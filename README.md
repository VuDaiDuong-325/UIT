# 📚 UIT - Computer Engineering Documents

This repository collects academic materials organized by semester at **UIT** (University of Information Technology), majoring in **Computer Engineering**.

---

## 📁 Directory Structure

| Semester | Course                                 | Linked Folder                 |
|----------|----------------------------------------|-------------------------------|
| HK3      | IT003 - Data Structures & Algorithms | [`HK3_DSA/Thuc_hanh`](https://github.com/VuDaiDuong-23520359/HK3_DSA/tree/main/Thuc_hanh) *(submodule)* |
| HK4      | CE103 - Microprocessor & Embedded    | [`MPU-MCU_project/Project`](https://github.com/VuDaiDuong-23520359/MPU-MCU_project/tree/main/Project) *(submodule)* |
| HK4      | IT007 - Operating Systems (Ubuntu)   | [`OS_ubuntu/IT007_HDH`](https://github.com/VuDaiDuong-23520359/OS_ubuntu/tree/main/IT007_HDH) *(submodule)* |

---

## ⚙️ Git Submodules

The folders above are linked using **Git Submodules** to keep them in sync with their respective repositories.

After cloning this repository, run the following command to initialize all submodules:

```bash
git submodule update --init --recursive

- `.gitignore`: for Assembly, C/C++
- `.gitattributes`: Upload Zip files > 100MB
- `.gitmodules`: 
link `Thuc_hanh` folder in [HK3/IT003_DSA](https://github.com/VuDaiDuong-23520359/UIT/tree/DesktopUIT/HK3/IT003_DSA) to [HK3_DSA](https://github.com/VuDaiDuong-23520359/HK3_DSA) repository
link `Project` folder in [HK4/CE103_Vxl-vdk](https://github.com/VuDaiDuong-23520359/UIT/tree/DesktopUIT/HK4/CE103_Vxl-vdk) to [MPU-MCU_project](https://github.com/VuDaiDuong-23520359/MPU-MCU_project)
link 'IT007_HDH` folder to [OS_ubuntu](https://github.com/VuDaiDuong-23520359/OS_ubuntu)