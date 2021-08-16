#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "sort.h"
#include <regex.h>
#include <locale.h>  
#define MAXLINE 100
int main(int argc,char *argv[])
{
    regex_t preg;
    int     rc;
    char *pattern = "([0-9]+[.]\?[0-9]*)";
  	size_t nmatch = 1;
    regmatch_t pmatch[1];
    FILE *fp;
    LINE *lines[100];
    char arr[MAXLINE+1];
    int     count = 0;
    if ((rc = regcomp(&preg, pattern, REG_EXTENDED)) != 0)
    {
       printf("regcomp() failed, returning nonzero (%d)", rc);                  
       exit(1);                                                                 
    }

    if ((fp = fopen (*++argv, "r")) == NULL)
    {
       perror ("File open error!\n");
       exit (1);
    }

    while ((fgets (arr, MAXLINE, fp)) != NULL)
    {
        lines[count] = lalloc();
       if (0 != (rc = regexec(&preg, arr, nmatch, pmatch, 0))) {
          printf("Failed to match '%s' with '%s',returning %d.\n",
             arr, pattern, rc);
       }
       else {
            lines[count] -> content = substring(arr, pmatch[0].rm_so,pmatch[0].rm_eo - pmatch[0].rm_so);
            lines[count] -> id = count;
            lines[count] -> msg = (char *)malloc(strlen(arr)+1);
            strcpy(lines[count] -> msg, arr);
            count++;
       } 
    }
    for(int i =0; i<count;i++)
    {
      float value = atof(lines[i]->content);
      LINE *key = lines[i];
      int j = i -1;
      while (j>=0 && value < atof(lines[j]->content))
      {
          lines[j+1] = lines[j];
          j = j-1;
          lines[j+1] = key;

      }
    }
    return 0;
}

