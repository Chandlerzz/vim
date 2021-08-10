#include <stdio.h>
#include "insort.h"
#include <regex.h>
#include <locale.h>  
#include <stdlib.h>

char* substring(char* ch,int pos,int length)  
{  
    //定义字符指针 指向传递进来的ch地址
    char* pch=ch;  
    //通过calloc来分配一个length长度的字符数组，返回的是字符指针。
    char* subch=(char*)calloc(sizeof(char),length+1);  
    int i;  
 //只有在C99下for循环中才可以声明变量，这里写在外面，提高兼容性。  
    pch=pch+pos;  
//是pch指针指向pos位置。  
    for(i=0;i<length;i++)  
    {  
        subch[i]=*(pch++);  
//循环遍历赋值数组。  
    }  
    subch[length]='\0';//加上字符串结束符。  
    return subch;       //返回分配的字符数组地址。  
} 
INSERT* genlist(INSERT* ptr, int i, INSERT insert)
{
    if(i == 1)
    {
        ptr = malloc(sizeof *ptr);
    }
    else
    {
        ptr = realloc(ptr,sizeof *ptr *i);
    }
    ptr[i-1] = insert;
    return ptr;
}

int main(void)
{
    regex_t preg;
    char *pattern = "([0-9]+[.]\?[0-9]*)";
    int rc;
    int arrlen = 0;
  	size_t     nmatch = 1;
    regmatch_t pmatch[1];
    FILE *fp;
    if ((rc = regcomp(&preg, pattern, REG_EXTENDED)) != 0)
    {
       printf("regcomp() failed, returning nonzero (%d)", rc);                  
       exit(1);                                                                 
    }
    fp = fopen("/tmp/aa.json","r");
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
       var * value = ptr[i].content
    }
    fclose(fp);
    fp = NULL;
    return 0;
}

