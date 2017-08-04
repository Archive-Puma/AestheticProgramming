<h1 align="center">
 <img src="https://cdn.rawgit.com/CosasDePuma/Aesthetic-Programming/384ffa5a/.img/logo.jpg" alt="Aesthetic-Programming" width="480" height="320">
</h1>

&nbsp;

:floppy_disk: Clone me!
----

Clone or download the Github project
```git
git clone https://github.com/cosasdepuma/aesthetic-programming.git && cd aesthetic-programming/
```

All programs are commented and with a header similar to this one explaining how to compile them
```asm
;    _________________
;  //                 \\
; || HOW TO COMPILE IT ||
;  \\_________________//
;
; ------    x86   ------
; nasm -f elf program.asm
; ld -s -o program program.o
;
; ------  x86_64  ------
; nasm -f elf64 program.asm
; ld -s -o program program.o
;
; ------ COMPILER ------
; ./compiler.sh program
; ./compiler.sh program.asm program
;
; --    Always x86   ---
; nasm -f elf program.asm
; ld -m elf_i386 -s -o program program.o
```

Please contact with [Kike Puma](https://linkedin.com/in/kikepuma) if you need more information.

:video_game: Levels
----
[WARNING] I only tested my Assembly programs in Linux Enviroments!


**NASM 32-bit**

| Lvl | Name | Lvl | Name | Lvl | Name |
| ---- | ---- | ---- | ---- | ---- | ---- |
| 00 | HelloWorld | 01 | Pattern | 02 | Nice2Meet |
| 03 | Calculator | 04 | Even    | 05 | Family |

**NASM - Hacking**

| Lvl | Name | Lvl | Name | Lvl | Name |
| ---- | ---- | ---- | ---- | ---- | ---- |
| 00 | ExitCall | 01 | HelloShell |  |  |

NASM should be installed on your computer. If you are a Linux user, try the following command:
```sh
sudo apt install nasm
```

:notebook: Docs
----
If you are interested in learning Assembly Code, here I leave the tutorials that served me to start in the language.

| About | Author | Name |
| ---- | ---- | ---- |
| NASM | [TutorialsPoint](http://www.tutorialspoint.com/) | [Assembly Language Tutorial](http://www.tutorialspoint.com/assembly_programming/assembly_tutorial.pdf) |
| NASM | [TutorialsPoint](http://www.tutorialspoint.com/) | [Learn NASM Assembly programming language](https://www.tutorialspoint.com/assembly_programming/index.htm) |
| NASM - Hacking | [Ajin Abraham (aka ><302)](www.keralacyberforce.in) | [Shellcode in Linux](https://www.exploit-db.com/docs/21013.pdf) |

:page_with_curl: License
----

![LICENSE](https://img.shields.io/github/license/CosasDePuma/Aesthetic-Programming.svg?style=flat-square)