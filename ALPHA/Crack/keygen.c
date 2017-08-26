#include <stdio.h>
#include <time.h>

int main ()
{
    char buffer[5];
    time_t rawtime;
    struct tm * timeinfo;
    
    time ( &rawtime );
    timeinfo = localtime ( &rawtime );
    
    strftime ( buffer, 5, "%H%M", timeinfo );
    FILE *f = fopen( "KEY.txt", "w" );
    if (f != NULL)
    {
          fprintf ( f, "The key is the local time.\n\nCurrent key: %s", buffer );
          fclose( f );
    }
    return 0;
}
