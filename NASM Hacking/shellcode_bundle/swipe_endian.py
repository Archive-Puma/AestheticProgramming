import sys

def flip_word(word):
    w1 = word[:8]
    w2 = word[8:]
    return w2 + w1

def new_word(code):
    word = str()
    last = str()

    if(len(code) >= 16):
        word = code[:16]
        last = code[16:]
    elif(len(code) == 16):
        word = code
    else:
        return code, str()


    return flip_word(word), last


def read_shellcode(shellcode_file):
    new_code = str()

    with open(shellcode_file, "r") as shellcode:
        original_code = shellcode.read()

        if(original_code[0] == "\""):
            original_code = original_code[1:]
        if(original_code[len(original_code)-2] == "\""):
            original_code = original_code[:len(original_code) -2]

        buffered_code = original_code
        while(len(buffered_code) != 0):
            partial_new_code, buffered_code = new_word(buffered_code)
            new_code = new_code + partial_new_code

        print new_code

    with open(shellcode_file, "w") as shellcode:
        shellcode.write(new_code)

read_shellcode(sys.argv[1])
