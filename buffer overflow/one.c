#include<stdio.h>
//user lab01C lab01start

CanNeverExecute()
{
        printf("I can never execute\n");
        exit(0);
}

GetInput()
{
        char buffer[8];

        gets(buffer);
        puts(buffer);
}

main()
{
        GetInput();

        return 0;
}
