#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "sort.h"
#define MAXLINE 100
int main(int argc,char *argv[])
{

    regex_t preg;
    int     rc;
    char *pattern = "([0-9]+[.]\?[0-9]*)";
  	size_t nmatch = 1;
    regmatch_t pmatch[1];
    FILE *fp;
    LINE line;
    LINE *pline;
    pline = malloc(sizeof (pline)*100);
    line.id = 0;
    if ((rc = regcomp(&preg, pattern, REG_EXTENDED)) != 0)
    {
       printf("regcomp() failed, returning nonzero (%d)", rc);                  
       exit(1);                                                                 
    }
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
       pline->id =line.id;
       printf("%d",pline->id);
       printf("%p\n",pline);
    }
    for(int i =0; i<len;i++)
    {
      float value = atof(ptr[i].content);
      LINE key = ptr[i];
      int j = i -1;
      while (j>=0 && value < atof(ptr[j].content))
      {
          ptr[j+1] = ptr[j];
          j = j-1;
          ptr[j+1] = key;

      }
    }

    return 0;
}
