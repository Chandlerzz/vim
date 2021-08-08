#include <stdio.h>
#include "insort.h"
int main(void)
{
    INSERT *insert;
    FILE *fp;
    fp = fopen("/tmp/aa.json","r");
    if (NULL ==fp)
    {
        return -1;
    }
    char msg[100];
    while(!feof(fp))
    {
        if (fgets(msg,100,fp) == NULL)
            printf("fgets error");
        else
            printf("%s",msg);
    }
    fclose(fp);
    fp = NULL;
    return 0;
}

