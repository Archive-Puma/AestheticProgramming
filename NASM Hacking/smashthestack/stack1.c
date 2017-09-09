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
#include <string.h>

int main (int argc, char *argv[])
{
    // write volatile if the value can change unexpectedly (it is not necessary to exploit the program)
    volatile int flag = 0;
    char buffer[64];

    // check arguments, we don't want a Segmentation Fault error :3
    if (argc == 1)
    {
        fprintf (stderr, "Please, specify an argument\n");
        return 0xDEAD;
    }

    // vuln function (see "man 3 strcpy" bug section)
    strcpy (buffer, argv[1]);

    if (flag == 0xdeadbeef)
    {
        // goodboy
        printf ("Test completed successfully\n");
    } else {
        // badboy
        fprintf (stderr, "Try again. Flag value: 0x%08x\n", flag);
    }
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
/*  "flag" value needs to    */
/*  be 0xdeadbeef (hex       */
/*  number without ascii     */
/*  representation).         */
/*                           */
/*  If you are not familiar  */
/*  with the ascii code,     */
/*  look at "man ascii".     */
/*                           */
/* ========================= */
/*                           */
/*  Commands:                */
/*  python -c "print 'A'*64  */
/*    + '/xef/xbe/xad/xde'"  */
/*                           */
/*  (if you do not know      */
/*  "Little Endian" model,   */
/*  you can use "struct"     */
/*  python module)           */
/*                           */
/*  python -c "import        */
/*    struct; print 'A'*64   */
/*    + struct.pack('I',     */
/*    0xdeadbeef)"           */
/*                           */
/* ========================= */