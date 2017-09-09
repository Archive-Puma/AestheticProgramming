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
| 0x00 | HelloWorld | 0x01 | Pattern | 0x02 | Nice2Meet |
| 0x03 | Calculator | 0x04 | Even    | 0x05 | Family |

**NASM 64-bit**

| Lvl | Name | Lvl | Name | Lvl | Name |
| ---- | ---- | ---- | ---- | ---- | ---- |
| 0x00 | HelloWorld64 | 0x01 | Macros | 0x02 | Nice2Meet64 |
| 0x03 | If Else | 0x04 | Meaning | 0x05 | Params |

**NASM - Hacking**

| Lvl | Name | Lvl | Name | Lvl | Name |
| ---- | ---- | ---- | ---- | ---- | ---- |
| 0x00 | ExitCall | 0x01 | StackMsg | 0x02 | SpawnShell |
| 0x03 | GetPrivs |  |  |  |  |

| Lvl | Name | Lvl | Name | Lvl | Name |
| ---- | ---- | ---- | ---- | ---- | ---- |
| 0x00 | Stack0 | 0x01 | Stack1 | 0x02 | Stack2 |

**Reverse Engineering**

| Lvl | Name | Lvl | Name | Lvl | Name |
| ---- | ---- | ---- | ---- | ---- | ---- |
| 0x00 | License | 0x01 | EasyLicense | 0x02 | LenLicense |
| 0x03 | AntiDebugger |  |  |  |  |

NASM should be installed on your computer. If you are a Linux user, try the following command:
```sh
sudo apt install nasm
```

You can also download a preconfigured VM created by me with all the tools:

[![Download DisassWin](https://a.fsdn.com/con/app/sf-download-button)](https://sourceforge.net/projects/winhack7/files/latest/download)

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
| Reverse Engineering | [LiveOverflow](https://www.youtube.com/channel/UClcE-kVhqyiHCcjYwcpfj9w/featured) | [LiveOverflow Binary Hacking](http://liveoverflow.com/binary_hacking/index.html) |
| Reverse Engineering | [Raton (elhacker.net)](http://www.elhacker.net/hacking-programas-hack.html) | [Cursillo de Crackeo Básico para Principiantes](https://github.com/CosasDePuma/AestheticProgramming/tree/teachers/Cursillo%20de%20Crackeo%20B%C3%A1sico%20para%20Principiantes%20-%20Raton%20(ElHacker.net))

:page_with_curl: License
----

![LICENSE](https://img.shields.io/github/license/CosasDePuma/AestheticProgramming.svg?style=flat-square)
