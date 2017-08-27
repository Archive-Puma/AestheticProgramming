#include <stdio.h>
#include <string.h>

int main (int argc, char *argv[])
{
    if (argc != 2)
    {
        fprintf (stderr, "Usage: %s <key>\n", argv[0]);
        return 1;
    }

    int charsum = 0;
    for (int i = 0; i < strlen(argv[1]); i++)
    {
        charsum = charsum + argv[1][i];
    }

    if (charsum == 1040)
    {
        fprintf (stdout, "Program activated!\n");
    } else {
        fprintf (stderr, "Wrong license key!\n");
    }

    return 0;
}

