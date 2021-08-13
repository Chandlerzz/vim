typedef struct line{
    int     id;
    char    *content;
    char    *msg;
} LINE;
extern char* substring(char* ch,int pos,int length); 
extern LINE* genlist(LINE* ptr, int i, LINE *line);
