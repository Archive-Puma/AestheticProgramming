<h1 align="center">
 <img src="https://cdn.rawgit.com/CosasDePuma/Aesthetic-Programming/384ffa5a/.img/logo.jpg" alt="Aesthetic-Programming" width="480" height="320">
</h1>

&nbsp;

:floppy_disk: Clone me!
----

Clone or download the Github project
```git
git clone https://github.com/cosasdepuma/aestheticprogramming.git aesthetic-programming && cd aesthetic-programming/
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

You can use online compilers like [this](https://www.tutorialspoint.com/compile_assembly_online.php)

Please contact with [Kike Puma](https://linkedin.com/in/kikepuma) if you need more information.

:video_game: Levels
----
[WARNING] I only tested my Assembly programs in Linux Enviroments and Online Compilers!


**NASM 32-bit**

| Lvl | Name | Lvl | Name | Lvl | Name |
| ---- | ---- | ---- | ---- | ---- | ---- |
| 00 | HelloWorld | 01 | Pattern | 02 | Nice2Meet |
| 03 | Calculator | 04 | Even    | 05 | Family |

**NASM 64-bit**

| Lvl | Name | Lvl | Name | Lvl | Name |
| ---- | ---- | ---- | ---- | ---- | ---- |
| 00 | HelloWorld64 | 01 | Macros | 02 | Nice2Meet64 |
| 03 | If Else |  |  |  |  |

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
| GAS | [0xAX](https://0xax.github.io/) | [Say hello to x86_64 Assembly](https://0xax.github.io/asm_6/) |
| NASM 32-bit | [TutorialsPoint](http://www.tutorialspoint.com/) | [Assembly Language Tutorial](http://www.tutorialspoint.com/assembly_programming/assembly_tutorial.pdf) |
| NASM 32-bit | [TutorialsPoint](http://www.tutorialspoint.com/) | [Learn NASM Assembly programming language](https://www.tutorialspoint.com/assembly_programming/index.htm) |
| NASM 64-bit | [0xAX](https://github.com/0xAX/) | [asm (Learning assembly for linux-x64)](https://github.com/0xAX/asm) |
| NASM and C | [StackOverflow](https://stackoverflow.com/) | [Linking C with NASM](https://stackoverflow.com/questions/24991944/linking-c-with-nasm) |
| NASM - Hacking | [Ajin Abraham (aka ><302)](www.keralacyberforce.in) | [Shellcode in Linux](https://www.exploit-db.com/docs/21013.pdf) |

:page_with_curl: License
----

![LICENSE](https://img.shields.io/github/license/CosasDePuma/AestheticProgramming.svg?style=flat-square)
