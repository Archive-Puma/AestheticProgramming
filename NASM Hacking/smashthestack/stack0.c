/* ========================= */
/*     _________________     */
/*   //                 \\   */
/*  || HOW TO COMPILE IT ||  */
/*   \\_________________//   */
/*                           */
/* ========================= */
/*                           */
/*  GCC Args:                */
/*    -fno-stack-protector   */
/*    -z execstack           */
/*    -no-pie                */
/*    -m32  ((32-bit arch))  */
/*                           */
/* ========================= */
/*                           */
/*  Disable Random Addrsses  */
/*     echo 0 >              */
/*    /proc/sys/kernel/randomize_va_space
/*                           */
/* ========================= */
/*                           */


#include <stdio.h>

int main (int argc, char *argv[])
{
    // write volatile if the value can change unexpectedly (it is not necessary to exploit the program)
    volatile int flag = 0;
    char buffer[64];

    // vuln function (see "man 3 gets" bug section)
    gets (buffer);

    if (flag)
    {
        // goodboy
        fprintf (stdout, "Test completed successfully\n");
    } else {
        // badboy
        fprintf (stderr, "Try again\n");
    }

    return 0;
}


/*                           */
/* ========================= */
/*     _________________     */
/*   //                 \\   */
/*  ||  HOW TO SOLVE IT ||   */
/*   \\_________________//   */
/*                           */
/* ========================= */
/*                           */
/*  The value of the "flag"  */
/*  variable is always 0.    */
/*                           */
/*  Variables are stored in  */
/*  the Stack.               */
/*                           */
/*  As a buffer it has 64    */
/*  spaces, if we introduce  */
/*  a greater number of      */
/*  digits, we will          */
/*  overwrite the previous   */
/*  variables.               */
/*                           */
/* ========================= */
/*                           */
/*  Commands:                */
/*  perl -e "print 'A'x65"   */
/*  python -c "print 'A'*65" */
/*                           */
/* ========================= */