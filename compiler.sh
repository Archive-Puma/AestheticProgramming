#! /bin/bash

if [ $# == '1' ]; then
    echo '[?] Compiling ASM using NASM...'
    #NASM
    if [ `getconf LONG_BIT` == '64' ]; then
        echo '[?] Kernel: x86_64 (64-bit kernel)'
        nasm -f elf64 $1.asm
    else
        echo '[?] Kernel: i686 (32-bit kernel)'
        nasm -f elf $1.asm
    fi
    if [ $? != '0' ]; then
        echo '[!] NASM Error!'
        exit
    fi
    #LD
    ld -s -o $1 $1.o
    if [ $? != '0' ]; then
        echo '[!] LD Error!'
        exit
    fi
    rm -rf $1.o
    echo '[?] SUCCESSFULLY COMPILED!'
elif [ $# == '2' ]; then
    echo '[?] Compiling ASM using NASM...'
    #NASM
    if [ `getconf LONG_BIT` == '64' ]; then
        echo '[?] Kernel: x86_64 (64-bit kernel)'
        nasm -f elf64 $1 -o tmp.o
    else
        echo '[?] Kernel: i686 (32-bit kernel)'
        nasm -f elf $1 -o tmp.o
    fi
    if [ $? != '0' ]; then
        echo '[!] NASM Error!'
        exit
    fi
    #GCC
    ld -s -o $2 tmp.o
    if [ $? != '0' ]; then
        echo '[!] LD Error!'
        exit
    fi
    rm -rf tmp.o
    echo '[?] SUCCESSFULLY COMPILED!'
else 
    echo 'You enter an invalid number of arguments.'
    echo 'Usage ./compiler.sh <program and code name>'
    echo 'Command example: ./compiler.sh helloworld'
    echo 'Usage ./compiler.sh <code>.asm <program name>'
    echo 'Command example: ./compiler.sh helloworld.asm helloworld'
    exit
fi