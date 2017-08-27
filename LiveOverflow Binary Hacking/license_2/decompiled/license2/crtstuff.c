// address: 0x80484bb
int main(int argc, char **argv, char **envp) {
    char local13; 		// r24
    char local15; 		// r26
    char local16; 		// r28
    int local8; 		// m[r28 - 24]
    int local9; 		// m[r28 - 20]

    if (argc == 2) {
        local8 = 0;
        local9 = 0;
        for(;;) {
            local13 = *(int*)(argv + 4);
            local13 = strlen(local13);
            if ((unsigned)local13 <= (unsigned)local9) {
                break;
            }
            local15 = *(int*)(argv + 4);
            local13 = *(unsigned char*)(local9 + local15);
            local8 += (int) (unsigned char) local13;
            local9++;
        }
        if (local8 != 1040) {
            fwrite("Wrong license key!\n", 1, 19, stderr);
        } else {
            fwrite("Program activated!\n", 1, 19, stdout);
        }
        local13 = 0;
    } else {
        proc1();
        local13 = 1;
    }
    return local13;
}

