// address: 0x80484bb
int main(int argc, char **argv, char **envp) {
    int local11; 		// r28
    int local8; 		// r24

    if (argc == 2) {
        local8 = *(int*)(argv + 4);
        local8 = strcmp(local8, "MSTRKEY-70756D61");
        if (local8 != 0) {
            fwrite("Wrong license key!\n", 1, 19, stderr);
        } else {
            fwrite("Program activated!\n", 1, 19, stdout);
        }
        local8 = 0;
    } else {
        proc1();
        local8 = 1;
    }
    return local8;
}

