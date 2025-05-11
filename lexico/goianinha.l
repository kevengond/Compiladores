%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "parser.tab.h" 
%}

%option yylineno  
%option noyywrap 

%%

[ \t\r]+        ;
\n              { /* yylineno é incrementado automaticamente */ }

"programa"      { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, PROGRAM, yylineno); 
    return PROGRAM; 
}
"car"           { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, CAR, yylineno); 
    return CAR; 
}
"int"           { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, INT, yylineno); 
    return INT; 
}
"retorne"       { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, RETORNE, yylineno); 
    return RETORNE; 
}
"leia"          { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, LEIA, yylineno); 
    return LEIA; 
}
"escreva"       { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, ESCREVA, yylineno); 
    return ESCREVA; 
}
"novalinha"     { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, NOVALINHA, yylineno); 
    return NOVALINHA; 
}
"se"            { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, SE, yylineno); 
    return SE; 
}
"entao"         { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, ENTAO, yylineno); 
    return ENTAO; 
}
"senao"         { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, SENAO, yylineno); 
    return SENAO; 
}
"enquanto"      { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, ENQUANTO, yylineno); 
    return ENQUANTO; 
}
"execute"       { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, EXECUTE, yylineno); 
    return EXECUTE; 
}

"=="            { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, IGUAL, yylineno); 
    return IGUAL; 
}
"!="            { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, DIF, yylineno); 
    return DIF; 
}
"<="            { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, MENOR_IGUAL, yylineno); 
    return MENOR_IGUAL; 
}
">="            { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, MAIOR_IGUAL, yylineno); 
    return MAIOR_IGUAL; 
}
"<"             { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, MENOR, yylineno); 
    return MENOR; 
}
">"             { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, MAIOR, yylineno); 
    return MAIOR; 
}
"&&"            { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, E, yylineno); 
    return E; 
}
"||"            { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, OU, yylineno); 
    return OU; 
}

[a-zA-Z_][a-zA-Z0-9_]* {
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, ID, yylineno);
    return ID;
}

[0-9]+ {
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, INTCONST, yylineno);
    return INTCONST;
}

"="             { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, '=', yylineno); 
    return '='; 
}
"+"             { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, '+', yylineno); 
    return '+'; 
}
"-"             { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, '-', yylineno); 
    return '-'; 
}
"*"             { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, '*', yylineno); 
    return '*'; 
}
"/"             { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, '/', yylineno); 
    return '/'; 
}
"("             { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, '(', yylineno); 
    return '('; 
}
")"             { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, ')', yylineno); 
    return ')'; 
}
"{"             { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, '{', yylineno); 
    return '{'; 
}
"}"             { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, '}', yylineno); 
    return '}'; 
}
";"             { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, ';', yylineno); 
    return ';'; 
}
","             { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, ',', yylineno); 
    return ','; 
}
"!"             { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, '!', yylineno); 
    return '!'; 
}

"/*"([^*]|\*+[^*/])*\*+"/" {
    /*  Comentário ignorado  */
}

\"([^\"\n]|\\.)*\" {
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, CAD_CAR, yylineno);
    return CAD_CAR; 
}

(\n|.) {
    printf("ERRO: CARACTERE %s INVALIDO linha %d\n", yytext, yylineno);
    return ERROR;
}

"/*"([^*]|\*+[^*/])*\*? {
    printf("ERRO: COMENTARIO NAO TERMINA linha %d\n", yylineno);
    return -2; 
}

\"([^\"\n]*) {
    printf("ERRO: CADEIA DE CARACTERES OCUPA MAIS DE UMA LINHA linha %d\n", yylineno);
    return -3;
}

%%