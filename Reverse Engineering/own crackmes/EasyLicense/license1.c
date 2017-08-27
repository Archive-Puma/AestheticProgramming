#include <stdio.h>
#include <string.h>

int main (int argc, char *argv[])
{
    if (argc != 2)
    {
        fprintf (stderr, "Usage: %s <key>\n", argv[0]);
        return 1;
    }

    if (strcmp (argv[1], "MSTRKEY-70756D61") == 0)
    {
        fprintf (stdout, "Program activated!\n");
    } else {
        fprintf (stderr, "Wrong license key!\n");
    }

    return 0;
}

