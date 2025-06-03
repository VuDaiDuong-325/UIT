# 📚 UIT - Computer Engineering Documents

This repository collects academic materials organized by semester at **UIT** (University of Information Technology), majoring in **Computer Engineering**.

---

## 📁 Course List & Directory Structure

| Semester | Course                                 | Linked Folder                 |
|----------|----------------------------------------|-------------------------------|
| [HK1](https://github.com/VuDaiDuong-23520359/UIT/tree/DesktopUIT/HK1)         | CE005     -   Introduction to Computer Engineering                |                               |
|          | IT001  -   Introduction to programming                |                               |
|          | MA003  -   Linear algebra                             |                               |
|          | MA006  -   Calculus                                   |                               |
|          | SS007  - 	Philosophy Marx - Lenin                 |                               |
| [HK2](https://github.com/VuDaiDuong-23520359/UIT/tree/DesktopUIT/HK2)         | IT002     -   Object-oriented programming                         |                               |
|          | MA004  -   Discrete structures                        |                               |
|          | MA005  -   Probability and statistics                 |                               |
|          | PH002  -   Introduction to digital circuit            |                               |
|          | SS004  -   Professional skills                        | [`SS004.10`](https://github.com/hamstrous/SS004.10) *(submodule)*                             |
| [HK3](https://github.com/VuDaiDuong-23520359/UIT/tree/DesktopUIT/HK3) | IT003     -   Data Structures & Algorithms   | [`HK3_DSA`](https://github.com/VuDaiDuong-23520359/HK3_DSA) *(submodule)* |
|          | IT004  -   Structured Query Language                  |                               |
|          | IT005  -   Introduction to computer networks          |                               |
|          | IT006  -   Computer Architecture                      |                               |
|          | SS006  -   Introduction to law                        |                               |
|          | SS009  -   Scientific Socialism                       |                               |
|          | SS010  -   History of Vietnamese communist party      |                               |
| [HK4](https://github.com/VuDaiDuong-23520359/UIT/tree/DesktopUIT/HK4)  | CE103    -   Microprocessors & microcontrollers      | [`MPU-MCU_project`](https://github.com/VuDaiDuong-23520359/MPU-MCU_project) *(submodule)* |
|          | CE122  -   Engineering Circuit Analysis               |                               |
|          | IT007  -   Operating Systems                          | [`OS_ubuntu`](https://github.com/VuDaiDuong-23520359/OS_ubuntu) *(submodule)* |
|          | SS008  -   Marxism–Leninism political economy         |                               |

```
📁 UIT/
├── 📂 HK1/
│ ├── 📄 CE005_Intro_Computer_Eng/
│ ├── 📄 IT001_Intro_Programming/
│ ├── 📄 MA003_Linear_Algebra/
│ └── ...
├── 📂 HK2/
│ ├── 📄 IT002_OOP/
│ ├── 📄 MA004_Discrete_Structures/
│ ├── 📄 PH002_Digital_Circuit/
│ └── 🔗 SS004_Professional_Skills/ (submodule)
├── 📂 HK3/
│ ├── 🔗 IT003_DSA/ (submodule: HK3_DSA)
│ ├── 📄 IT004_SQL/
│ ├── 📄 IT005_Computer_Networks/
│ └── ...
├── 📂 HK4/
│ ├── 🔗 CE103_Microcontrollers/ (submodule: MPU-MCU_project)
│ ├── 📄 CE122_Circuit_Analysis/
│ └── 🔗 IT007_OS/ (submodule: OS_ubuntu)
├── ⚙️ .gitignore
├── ⚙️ .gitattributes
└── ⚙️ .gitmodules
```
---

## 💻 Course Tools Used

| Course Code | Course Name                               | Tools Used |
|-------------|--------------------------------------------|------------|
| IT001       | Introduction to programming                | Code::Blocks, VS, VSCode |
| IT002       | Object-oriented programming (OOP)          | VS, VSCode |
| PH002       | Introduction to digital circuit            | Quartus |
| SS004       | Professional skills                        | VS, VSCode |
| IT003       | Data Structures & Algorithms (DSA)         | VS, VSCode |
| IT004       | Structured Query Language (SQL)            | SQL Server |
| IT005       | Introduction to Computer Networks          | Wireshark, Charles, curl, Packet Tracer, VirtualBox |
| IT006       | Computer Architecture                      | MARS |
| CE103       | Microprocessors & Microcontrollers         | Proteus, ASM 8086 Emulator, STM32CubeIDE/MX |
| CE122       | Engineering Circuit Analysis               | Proteus, LTSpice |
| IT007       | Operating Systems (OS)                     | Ubuntu, WSL, VSCode |

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


