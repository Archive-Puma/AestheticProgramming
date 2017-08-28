//    _________________
//  //                 \\
// ||    COMPILATION    ||
//  \\_________________//
//
// gcc -o exitcall exitcall.c

int main (int argc, char *argv[])
{

    char shellcode[] = "\x31\xc0\x31\xdb\xb0\x01\xcd\x80";
    
    int (*exeshell) ();
    exeshell = (int (*) ()) shellcode;
    (int) (*exeshell) ();
}

