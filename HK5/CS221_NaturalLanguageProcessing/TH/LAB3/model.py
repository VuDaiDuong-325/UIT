import pickle
import random
from collections import defaultdict

class POSTagger:
    def __init__(self):
        self.weights = defaultdict(float)
        self.classes = set()
        # Biến dùng cho Averaged Perceptron (giúp làm mượt trọng số)
        self._totals = defaultdict(float)
        self._tstamps = defaultdict(int)
        self.i = 0 

    def fit(self, sentences, tags):
        """
        Hàm wrapper để tương thích với train.py cũ.
        Chuyển đổi input (Text, Label) thành dạng [(words, tags)] và gọi training.
        """
        training_data = list(zip(sentences, tags))
        # Gọi thuật toán train nâng cao
        self.train_structured(training_data)

    def _get_shape(self, word):
        """Trích xuất hình thái từ (cực quan trọng để đạt 98%+)"""
        if not word: return ''
        s = []
        for c in word:
            if c.isdigit(): s.append('d')
            elif c.islower(): s.append('x')
            elif c.isupper(): s.append('X')
            else: s.append(c)
        return "".join(s)

    def _get_features(self, i, context, prev, prev2):
        """Tạo features vector tối ưu"""
        word = context[i]
        word_l = word.lower()
        
        features = [
            "bias",
            f"w={word_l}",
            f"shape={self._get_shape(word)}"
        ]
        
        # Context features (Window +/- 2)
        if i > 0:
            w_prev = context[i-1]
            features.append(f"w-1={w_prev.lower()}")
            features.append(f"w-1s={self._get_shape(w_prev)}")
        if i > 1:
            features.append(f"w-2={context[i-2].lower()}")
            
        if i < len(context) - 1:
            w_next = context[i+1]
            features.append(f"w+1={w_next.lower()}")
            features.append(f"w+1s={self._get_shape(w_next)}")
        if i < len(context) - 2:
            features.append(f"w+2={context[i+2].lower()}")

        # Suffix/Prefix (xử lý Unknown words)
        n = len(word)
        for j in range(1, 5): 
            if n >= j:
                features.append(f"suf-{j}={word[-j:]}")
                features.append(f"pre-{j}={word[:j]}")
                
        # Hyphen/Digit/Caps
        if '-' in word: features.append("has_hyphen")
        if any(c.isdigit() for c in word): features.append("has_digit")
        if word.isupper(): features.append("all_caps")

        # Structural Features (Tag context) - Động lực của Beam Search
        features.append(f"t-1={prev}")
        features.append(f"t-2t-1={prev2}|{prev}")
        features.append(f"t-1w={prev}|{word_l}")
        
        return features

    def train_structured(self, sentences, iterations=5, beam_size=4):
        """Training Core: Structured Perceptron với Early Update"""
        # 1. Thu thập nhãn
        for _, tags in sentences:
            self.classes.update(tags)
        self.classes = sorted(list(self.classes))
        

        for it in range(iterations):
            correct_sents = 0
            random.shuffle(sentences) # Shuffle mỗi epoch
            
            for words, gold_tags in sentences:
                self.i += 1
                
                # Beam Search state: (score, history, prev, prev2)
                beam = [(0.0, [], "<S1>", "<S2>")]
                
                gold_path_valid = True 
                
                for i, word in enumerate(words):
                    next_beam = []
                    
                    # 1. Expand Beam
                    for score, history, prev, prev2 in beam:
                        feats = self._get_features(i, words, prev, prev2)
                        
                        # Tính điểm nhanh
                        # (Mẹo: Có thể cache dot product ở đây để tăng tốc nếu cần)
                        for cls in self.classes:
                            dot_prod = 0
                            for f in feats:
                                key = (f, cls)
                                if key in self.weights:
                                    dot_prod += self.weights[key]
                            
                            next_beam.append( (score + dot_prod, history + [cls], cls, prev) )
                    
                    # 2. Prune (Giữ top K)
                    next_beam.sort(key=lambda x: x[0], reverse=True)
                    beam = next_beam[:beam_size]
                    
                    # 3. Early Update Check
                    # Kiểm tra xem đường đi ĐÚNG có còn trong beam không
                    current_gold_history = gold_tags[:i+1]
                    best_gold_in_beam = False
                    for _, b_hist, _, _ in beam:
                        if b_hist == current_gold_history:
                            best_gold_in_beam = True
                            break
                    
                    if not best_gold_in_beam:
                        # LỖI: Đường đúng bị rơi khỏi beam -> Update ngay lập tức
                        pred_tags = beam[0][1] # Lấy đường đi sai có điểm cao nhất
                        self._update_parameters(words, gold_tags, pred_tags, i)
                        gold_path_valid = False
                        break # Dừng xử lý câu này
                
                # Nếu hết câu mà vẫn đúng
                if gold_path_valid:
                    best_pred_tags = beam[0][1]
                    if best_pred_tags != gold_tags:
                        self._update_parameters(words, gold_tags, best_pred_tags, len(words)-1)
                    else:
                        correct_sents += 1
                        
            acc = correct_sents / len(sentences)
        
        self.save()

    def _update_parameters(self, words, gold_tags, pred_tags, fail_index):
        """Cập nhật trọng số tại vị trí fail"""
        for i in range(fail_index + 1):
            gold_tag = gold_tags[i]
            pred_tag = pred_tags[i]
            
            g_prev = gold_tags[i-1] if i > 0 else "<S1>"
            g_prev2 = gold_tags[i-2] if i > 1 else "<S2>"
            
            p_prev = pred_tags[i-1] if i > 0 else "<S1>"
            p_prev2 = pred_tags[i-2] if i > 1 else "<S2>"
            
            feats_gold = self._get_features(i, words, g_prev, g_prev2)
            feats_pred = self._get_features(i, words, p_prev, p_prev2)
            
            for f in feats_gold:
                self._update_single_weight(f, gold_tag, 1.0)
            for f in feats_pred:
                self._update_single_weight(f, pred_tag, -1.0)

    def _update_single_weight(self, feat, cls, val):
        key = (feat, cls)
        self._totals[key] += (self.i - self._tstamps[key]) * self.weights[key]
        self._tstamps[key] = self.i
        self.weights[key] += val

    def tag_sentence(self, words):
        """Hàm dự đoán dùng Beam Search (dùng khi test)"""
        beam_size = 4
        beam = [(0.0, [], "<S1>", "<S2>")]
        
        for i, word in enumerate(words):
            next_beam = []
            for score, history, prev, prev2 in beam:
                feats = self._get_features(i, words, prev, prev2)
                for cls in self.classes:
                    dot_prod = 0
                    for f in feats:
                        if (f, cls) in self.weights:
                            dot_prod += self.weights[(f, cls)]
                    next_beam.append((score + dot_prod, history + [cls], cls, prev))
            
            next_beam.sort(key=lambda x: x[0], reverse=True)
            beam = next_beam[:beam_size]
            
        return beam[0][1]

    def tag(self, sent_list):
        """Interface cho test script"""
        return [self.tag_sentence(sent) for sent in sent_list]

    def save(self):
        # Averaging Weights
        final_weights = {}
        for key, w in self.weights.items():
            total = self._totals[key]
            total += (self.i - self._tstamps[key]) * w
            averaged = total / float(self.i)
            if abs(averaged) > 1e-6: # Loại bỏ trọng số quá nhỏ (Sparsify)
                final_weights[key] = averaged
        
        # Save nested dict structure to match typical usage
        saved_weights = defaultdict(dict)
        for (feat, cls), val in final_weights.items():
            saved_weights[feat][cls] = val
            
        model_data = {
            "weights": dict(saved_weights),
            "classes": self.classes
        }
        with open("model.mdl", "wb") as f:
            pickle.dump(model_data, f)

    def load(self, path="model.mdl"):
        with open(path, "rb") as f:
            data = pickle.load(f)
            self.classes = data["classes"]
            self.weights = {}
            # Flatten weights để tra cứu nhanh hơn
            for feat, tag_dict in data["weights"].items():
                for tag, val in tag_dict.items():
                    self.weights[(feat, tag)] = val