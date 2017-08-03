#! /bin/bash

if [ $# == '1' ]; then
    echo '[?] Compiling ASM using NASM...'
    #NASM
    nasm -f elf $1.asm
    if [ $? != '0' ]; then
        echo '[!] NASM Error!'
        exit
    fi
    #LD
    ld -m elf_i386 -s -o $1 $1.o
    if [ $? != '0' ]; then
        echo '[!] LD Error!'
        exit
    fi
    #JUNK
    rm -rf $1.o
    echo '[?] SUCCESSFULLY COMPILED!'

elif [ $# == '2' ]; then
    echo '[?] Compiling ASM using NASM...'
    #NASM
    nasm -f elf $1 -o tmp.o
    if [ $? != '0' ]; then
        echo '[!] NASM Error!'
        exit
    fi
    #GCC
    ld -m elf_i386 -s -o $2 tmp.o
    if [ $? != '0' ]; then
        echo '[!] LD Error!'
        exit
    fi
    #JUNK
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