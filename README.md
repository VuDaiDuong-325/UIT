# 📚 UIT - Computer Engineering Documents

This repository collects academic materials organized by semester at **UIT** (University of Information Technology), majoring in **Computer Engineering**.

---

## 📁 Directory Structure

| Semester | Course                                 | Linked Folder                 |
|----------|----------------------------------------|-------------------------------|
| HK3      | IT003 - Data Structures & Algorithms   | [`HK3_DSA/Thuc_hanh`](https://github.com/VuDaiDuong-23520359/HK3_DSA/tree/main/Thuc_hanh) *(submodule)* |
|          | IT004 - Structured Query Language      |                               |
|          | IT005 - Computer Network               |                               |
|          | IT006 - Computer Architecture          |                               |
|          | SS009 - Scientific Socialism           |                               |
|          | SS009 - Party History                  |                               |
| HK4      | CE103 - Microprocessor & Embedded      | [`MPU-MCU_project/Project`](https://github.com/VuDaiDuong-23520359/MPU-MCU_project/tree/main/Project) *(submodule)* |
|          | CE122 - Technical circuit analysis     |                               |
|          | IT007 - Operating Systems              | [`OS_ubuntu/IT007_HDH`](https://github.com/VuDaiDuong-23520359/OS_ubuntu/tree/main/IT007_HDH) *(submodule)* |
|          | SS008 - Political Economy              |                               |

---

## 📦 Git Configuration Files

- `.gitignore`: For Assembly and C/C++ projects
- `.gitattributes`: Upload `.zip` files > 100MB using Git LFS
- `.gitmodules`: Defines and manages Git submodules linked in this repository

---

## ⚙️ Git Submodules

The folders above are linked using **Git Submodules** to keep them in sync with their respective repositories.

After cloning this repository, run the following command to initialize all submodules:

```bash
git submodule update --init --recursive


