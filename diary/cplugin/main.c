#include <stdio.h>
#include "sort.h"
#include <regex.h>
#include <locale.h>  
#include <stdlib.h>
#include <string.h>


int main(int argc,char *argv[])
{
    regex_t preg;
    int     rc;
    FILE    *fp;
    char *pattern = "([0-9]+[.]\?[0-9]*)";
    int len = 0;
  	size_t nmatch = 1;
    regmatch_t pmatch[1];
    if ((rc = regcomp(&preg, pattern, REG_EXTENDED)) != 0)
    {
       printf("regcomp() failed, returning nonzero (%d)", rc);                  
       exit(1);                                                                 
    }
    fp = fopen(*++argv,"r");
    if (NULL ==fp)
    {
        return -1;
    }
    LINE *ptr;
    LINE line;
    while(!feof(fp))
    {
        if (fgets(line.msg,100,fp) != NULL)
        {
            printf("%s",line.msg);
           /* if (0 != (rc = regexec(&preg, line.msg, nmatch, pmatch, 0))) { */
			  /* printf("Failed to match '%s' with '%s',returning %d.\n", */
				 /* line.msg, pattern, rc); */
		   /* } */
		   /* else { */
				/* line.content = substring(line.msg, pmatch[0].rm_so,pmatch[0].rm_eo - pmatch[0].rm_so); */
           /*      len++; */
           /*      line.id = len; */
           /*      ptr = genlist(ptr,len,&line); */
		   /* } */ 
        }
    }
    /* for(int i =0; i<len;i++) */
    /* { */
    /*   float value = atof(ptr[i].content); */
    /*   LINE key = ptr[i]; */
    /*   int j = i -1; */
    /*   while (j>=0 && value < atof(ptr[j].content)) */
    /*   { */
    /*       ptr[j+1] = ptr[j]; */
    /*       j = j-1; */
    /*       ptr[j+1] = key; */

    /*   } */
    /* } */
    fclose(fp);
    fp = NULL;
    return 0;
}

