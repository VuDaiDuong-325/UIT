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
| [HK3](https://github.com/VuDaiDuong-23520359/UIT/tree/DesktopUIT/HK3) | IT003     -   Data Structures & Algorithms   | [`Data Structure & Algorithm`](https://github.com/VuDaiDuong-325/Data-Structures-and-Algorithms-Learning) *(submodule)* |
|          | IT004  -   Structured Query Language                  |                               |
|          | IT005  -   Introduction to computer networks          |                               |
|          | IT006  -   Computer Architecture                      |                               |
|          | SS006  -   Introduction to law                        |                               |
|          | SS009  -   Scientific Socialism                       |                               |
|          | SS010  -   History of Vietnamese communist party      |                               |
| [HK4](https://github.com/VuDaiDuong-23520359/UIT/tree/DesktopUIT/HK4)  | CE103    -   Microprocessors & microcontrollers      | [`Project`](https://github.com/VuDaiDuong-325/Controlling-WS2812b-using-STM32) *(submodule)* |
|          | CE122  -   Engineering Circuit Analysis               |                               |
|          | IT007  -   Operating Systems                          | [`Operating System`](https://github.com/VuDaiDuong-325/Operating-System-Learning) *(submodule)* |
|          | SS008  -   Marxism–Leninism political economy         |                               |
| [HK5](https://github.com/VuDaiDuong-325/UIT/tree/DesktopUIT/HK5) | CE118  -  Digital Logic Design | [`Circuit Simulation`](https://github.com/VuDaiDuong-325/Circuit-Simulation-in-Digital-Logic-Design-Learning) *(submodule)* |
|          | CE124  -    Electronic Devices  |  |
|          | CE224  -    Embedded System Design  |  [`Project`](https://github.com/DuyNDP/CE224_Control_Led_APA102) *(submodule)*  |
|          | CS221  -    Natural Language Processing  |  |
---

## 💻 Course Tools Used

| Course Code | Course Name                               | Tools Used |
|-------------|--------------------------------------------|------------|
| IT001       | Introduction to programming                | Code::Blocks, VS, VSCode |
| IT002       | Object-oriented programming                | VS, VSCode |
| PH002       | Introduction to digital circuit            | Quartus |
| SS004       | Professional skills                        | VS, VSCode |
| IT003       | Data Structures & Algorithms               | VS, VSCode |
| IT004       | Structured Query Language                  | SQL Server |
| IT005       | Introduction to Computer Networks          | Wireshark, Charles, curl, Packet Tracer, VirtualBox |
| IT006       | Computer Architecture                      | MARS |
| CE103       | Microprocessors & Microcontrollers         | Proteus, ASM 8086 Emulator, STM32CubeIDE/MX |
| CE122       | Engineering Circuit Analysis               | Proteus, LTSpice |
| IT007       | Operating Systems                          | Ubuntu, WSL, VSCode |
| CE118       | Digital Logic Design                       | Quartus  |
| CE124       | Electronic Devices                         | LTSpice  |
| CE224       | Embedded System Design                     | STM32CubeIDE/MX, KeilC, VSCode  |
| CS221       | Natural Language Processing                | Google Colab, VSCode  |
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


