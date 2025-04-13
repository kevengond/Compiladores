#include <stdio.h>
#include <string.h>
#include <stdlib.h>

extern int yylex();
extern char* yytext;  
extern FILE *yyin;    

int main(int argc, char** argv) {
    if (argc != 2) {
        printf("Uso correto: %s arquivo_de_teste\n", argv[0]);
        exit(1);
    }

    yyin = fopen(argv[1], "r");
    if (!yyin) {
        perror("Erro ao abrir o arquivo");
        exit(1);
    }

    int token = yylex();  
    while (token) { 
        token = yylex();
    }

    fclose(yyin);
    return 0;
}
