#! /bin/bash

if [ $# == '0' ]; then
    echo -e "Usage: $0 <program(s)>"
else
    for binary in $@; do
        for i in $(objdump -d $binary |grep "^ " |cut -f2); do echo -n '\x'$i; done; echo
    done
fi
