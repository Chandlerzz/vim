#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "sort.h"
#define MAXLINE 100
int main(int argc,char *argv[])
{

     FILE *fp;
     LINE line;
     LINE *pline;
     line.id = 0;
     char arr[MAXLINE+1];

     if ((fp = fopen (*++argv, "r")) == NULL)
     {
        perror ("File open error!\n");
        exit (1);
     }
     while ((fgets (arr, MAXLINE, fp)) != NULL)
     {
        ++line.id;
        LINE *tmp;
        pline = pline+1;
        printf("%p\n",pline);
     }

      return 0;
}
