#include <stdio.h>
#include "sort.h"
#include <regex.h>
#include <locale.h>  
#include <stdlib.h>


int main(int argc,char *argv[])
{
    regex_t preg;
    int     rc;
    FILE    *fp;
    char *pattern = "([0-9]+[.]\?[0-9]*)";
    char *filename = argv[1];
    int arrlen = 0;
  	size_t nmatch = 1;
    regmatch_t pmatch[1];
    if ((rc = regcomp(&preg, pattern, REG_EXTENDED)) != 0)
    {
       printf("regcomp() failed, returning nonzero (%d)", rc);                  
       exit(1);                                                                 
    }
    fp = fopen(filename,"r");
    if (NULL ==fp)
    {
        return -1;
    }
    char msg[100];
    INSERT *ptr;
    while(!feof(fp))
    {
        INSERT insert;
        if (fgets(msg,100,fp) == NULL)
            printf("fgets error");
        else
           if (0 != (rc = regexec(&preg, msg, nmatch, pmatch, 0))) {
			  printf("Failed to match '%s' with '%s',returning %d.\n",
				 msg, pattern, rc);
		   }
		   else {
				insert.content = substring(msg, pmatch[0].rm_so,pmatch[0].rm_eo - pmatch[0].rm_so);
                arrlen++;
                insert.id = arrlen;
                ptr = genlist(ptr,arrlen,insert);
		   } 
    }
    for(int i =0; i<arrlen;i++)
    {
      float value = atof(ptr[i].content);
      INSERT key = ptr[i];
      int j = i -1;
      while (j>=0 && value < atof(ptr[j].content))
      {
          ptr[j+1] = ptr[j];
          j = j-1;
          ptr[j+1] = key;

      }
    }
    fclose(fp);
    fp = NULL;
    return 0;
}

