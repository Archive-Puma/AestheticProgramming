//    _________________
//  //                 \\
// ||    COMPILATION    ||
//  \\_________________//
//
// gcc -o stackmsg stackmsg.c

int main (int argc, char *argv[])
{

    char shellcode[] = "\xeb\x19\x31\xc0\x31\xdb\x31\xc9\x31\xd2\xb0\x04\xb3\x01\x59\xb2\x0e\xcd\x80\x31\xc0\xb0\x01\x31\xdb\xcd\x80\xe8\xe2\xff\xff\xff\x46\x75\x63\x6b\x20\x53\x75\x6e\x64\x61\x79\x73\x21\x0a";
    
    int (*exeshell) ();
    exeshell = (int (*) ()) shellcode;
    (int) (*exeshell) ();
}

