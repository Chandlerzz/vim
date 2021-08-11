typedef struct insert{
    int     id;
    char    *content;
} INSERT;
extern char* substring(char* ch,int pos,int length); 
extern INSERT* genlist(INSERT* ptr, int i, INSERT insert);
