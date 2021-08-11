#include <stdio.h>
#include "sort.h"
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
