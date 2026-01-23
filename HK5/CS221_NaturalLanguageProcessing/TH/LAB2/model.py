import pickle
import re
from collections import defaultdict, Counter
import numpy as np

class FinalStupidBackoffLM:
    def __init__(self):
        self.max_n = 3
        self.models = {n: defaultdict(Counter) for n in range(1, self.max_n + 1)}
        self.vocab = set()
        self.UNK = "<UNK>"
        
        # Tokenizer Regex mạnh mẽ
        self.tokenizer_regex = re.compile(r"""
            (?:https?://|www\.)\S+        | 
            [#@]\w+                       | 
            \d+(?:\.\d+)+                 | 
            \w+(?:[-'`’]\w+)* | 
            [^\w\s]
        """, re.X)

    def tokenize(self, text):
        return self.tokenizer_regex.findall(text)

    def fit(self, data):
        for text in data:
            tokens = self.tokenize(text.strip())
            if not tokens: continue
            
            self.vocab.update(tokens)
            
            padded_tokens = ['<START>'] * (self.max_n - 1) + tokens + ['<END>']
            length = len(padded_tokens)
            
            for n in range(1, self.max_n + 1):
                for i in range(length - n + 1):
                    if n == 1:
                        context = ()
                        token = padded_tokens[i]
                    else:
                        context = tuple(padded_tokens[i : i + n - 1])
                        token = padded_tokens[i + n - 1]
                    
                    self.models[n][context][token] += 1
        
        self.vocab.add('<START>')
        self.vocab.add('<END>')
        self.vocab.add(self.UNK)

    def generate(self):
        current_context = ['<START>'] * (self.max_n - 1)
        result = []
        generated_trigrams = set()
        
        # Fallback Unigram
        top_unigrams = self.models[1][()].most_common(100)
        fallback_candidates = [w for w, c in top_unigrams if w not in ['<START>', '<END>', self.UNK]]
        fallback_counts = np.array([self.models[1][()][w] for w in fallback_candidates], dtype=float)
        fallback_probs = fallback_counts / fallback_counts.sum()

        while True:
            context_tuple = tuple(current_context)
            candidates = []
            probs = []
            
            n = self.max_n
            found = False
            
            while n >= 1:
                curr_ctx = context_tuple[-(n-1):] if n > 1 else ()
                
                if n == 1:
                    candidates = fallback_candidates
                    probs = fallback_probs
                    found = True
                    break
                
                if curr_ctx in self.models[n]:
                    source = self.models[n][curr_ctx]
                    items = source.most_common(20) 
                    if items:
                        candidates = [w for w, c in items]
                        counts = np.array([c for w, c in items], dtype=float)
                        probs = counts / counts.sum()
                        found = True
                        break
                n -= 1
            
            # --- TOP-K SAMPLING ---
            K = 3 
            
            if found and candidates:
                clean_candidates = []
                clean_probs = []
                
                for i, w in enumerate(candidates):
                    if w in ['<START>', self.UNK]: continue
                    # Chống lặp từ liền kề (trừ dấu câu và dấu sao)
                    is_special = not w[0].isalnum()
                    if result and w == result[-1] and not is_special: continue
                    
                    if len(result) >= 2:
                        if (result[-2], result[-1], w) in generated_trigrams: continue
                    
                    clean_candidates.append(w)
                    clean_probs.append(probs[i])
                
                if not clean_candidates:
                    next_word = np.random.choice(fallback_candidates, p=fallback_probs)
                else:
                    clean_probs = np.array(clean_probs)
                    if len(clean_candidates) > K:
                        top_k_indices = np.argsort(clean_probs)[-K:]
                        final_candidates = [clean_candidates[i] for i in top_k_indices]
                        final_probs = clean_probs[top_k_indices]
                    else:
                        final_candidates = clean_candidates
                        final_probs = clean_probs
                    
                    final_probs = final_probs / final_probs.sum()
                    next_word = np.random.choice(final_candidates, p=final_probs)
            else:
                next_word = np.random.choice(fallback_candidates, p=fallback_probs)

            if next_word == '<END>':
                break
            
            if len(result) >= 2:
                generated_trigrams.add((result[-2], result[-1], next_word))
                
            result.append(next_word)
            current_context.pop(0)
            current_context.append(next_word)
            
            if len(result) > 60: break

        return self.smart_detokenize(result)

    def smart_detokenize(self, tokens):
        text = ""
        # Danh sách bám trái (không có khoảng trắng phía trước)
        left_attach = {".", ",", "!", "?", ":", ";", "]", "}", "%", "...", "!!!", "!!", "'", "’", "n't", "'s", "'m", "'re", "'ve", "'ll", "'d"}
        # Danh sách bám phải (không có khoảng trắng phía sau)
        right_attach = {"[", "{", "$", "#", "@", "("}
        
        # 1. Cân bằng ngoặc & XÓA NGOẶC RỖNG ()
        clean_tokens = []
        open_parens = 0
        for t in tokens:
            if t == '(':
                open_parens += 1
                clean_tokens.append(t)
            elif t == ')':
                if open_parens > 0:
                    # Nếu token trước đó là '(' -> Cặp rỗng () -> Xóa ngay
                    if clean_tokens and clean_tokens[-1] == '(':
                        clean_tokens.pop() # Xóa dấu '('
                        open_parens -= 1
                    else:
                        open_parens -= 1
                        clean_tokens.append(t)
            else:
                clean_tokens.append(t)
        
        # Đóng các ngoặc còn thiếu
        while open_parens > 0: 
            if clean_tokens and clean_tokens[-1] == '(':
                clean_tokens.pop()
            else:
                clean_tokens.append(')')
            open_parens -= 1
        
        # 2. Ghép chuỗi logic
        for i, token in enumerate(clean_tokens):
            if i == 0:
                text += token
                continue
            prev = clean_tokens[i-1]
            add_space = True
            
            if token in left_attach: add_space = False
            elif prev in right_attach: add_space = False
            elif token.startswith("'") and len(token) > 1: add_space = False 
            elif token == ')': add_space = False
            elif prev == '(': add_space = False
            
            # Xử lý số hàng nghìn (1,000)
            elif prev == ',' and token[0].isdigit(): add_space = False
            
            # Xử lý dấu sao *** dính liền
            elif token == '*' and prev == '*': add_space = False
            
            text += (" " if add_space else "") + token
            
        # 3. Post-processing (Xử lý hậu kỳ các lỗi thẩm mỹ)
        if text: 
            text = text[0].upper() + text[1:]
            
            # Thay thế dấu backtick lỗi
            text = text.replace("`", "'")
            
            # [FIX MỚI] Xóa dấu chấm phẩy kép (;; -> ;)
            text = text.replace(";;", ";")
            
            # Xóa khoảng trắng thừa trong ngoặc (nếu có)
            text = text.replace("( ", "(").replace(" )", ")")
            
        return text

class FirstLM(FinalStupidBackoffLM):
    def save(self):
        with open("FirstLM.mdl", "wb") as f:
            pickle.dump(self, f, protocol=pickle.HIGHEST_PROTOCOL)

class SecondLM(FinalStupidBackoffLM):
    def save(self):
        with open("SecondLM.mdl", "wb") as f:
            pickle.dump(self, f, protocol=pickle.HIGHEST_PROTOCOL)