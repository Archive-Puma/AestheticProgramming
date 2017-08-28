int main (int argc, char *argv[])
{

    char shellcode[] = "";
    
    int (*exeshell) ();
    exeshell = (int (*) ()) shellcode;
    (int) (*exeshell) ();
}

