%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "parser.tab.h" 
%}

%option yylineno  
%option noyywrap 
%option noinput nounput

%%

[ \t\r]+        ;
\n              { /* yylineno é incrementado automaticamente */ }

"programa"      { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, TK_PROGRAM, yylineno); 
    return TK_PROGRAM; 
}
"car"           { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, TK_CAR, yylineno); 
    return TK_CAR; 
}
"int"           { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, TK_INT, yylineno); 
    return TK_INT; 
}
"retorne"       { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, TK_RETORNE, yylineno); 
    return TK_RETORNE; 
}
"leia"          { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, TK_LEIA, yylineno); 
    return TK_LEIA; 
}
"escreva"       { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, TK_ESCREVA, yylineno); 
    return TK_ESCREVA; 
}
"novalinha"     { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, TK_NOVALINHA, yylineno); 
    return TK_NOVALINHA; 
}
"se"            { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, TK_SE, yylineno); 
    return TK_SE; 
}
"entao"         { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, TK_ENTAO, yylineno); 
    return TK_ENTAO; 
}
"senao"         { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, TK_SENAO, yylineno); 
    return TK_SENAO; 
}
"enquanto"      { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, TK_ENQUANTO, yylineno); 
    return TK_ENQUANTO; 
}
"execute"       { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, TK_EXECUTE, yylineno); 
    return TK_EXECUTE; 
}

"=="            { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, TK_IGUAL, yylineno); 
    return TK_IGUAL; 
}
"!="            { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, TK_DIF, yylineno); 
    return TK_DIF; 
}
"<="            { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, TK_MENOR_IGUAL, yylineno); 
    return TK_MENOR_IGUAL; 
}
">="            { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, TK_MAIOR_IGUAL, yylineno); 
    return TK_MAIOR_IGUAL; 
}
"<"             { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, TK_MENOR, yylineno); 
    return TK_MENOR; 
}
">"             { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, TK_MAIOR, yylineno); 
    return TK_MAIOR; 
}
"&&"            { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, TK_E, yylineno); 
    return TK_E; 
}
"||"            { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, TK_OU, yylineno); 
    return TK_OU; 
}

[a-zA-Z_][a-zA-Z0-9_]* {
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, TK_ID, yylineno);
    return TK_ID;
}

[0-9]+ {
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, TK_INTCONST, yylineno);
    return TK_INTCONST;
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
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, TK_CAD_CAR, yylineno);
    return TK_CAD_CAR; 
}

(\n|.) {
    printf("ERRO: CARACTERE %s INVALIDO linha %d\n", yytext, yylineno);
    return TK_ERROR;
}

"/*"([^*]|\*+[^*/])*\*? {
    printf("ERRO: COMENTARIO NAO TERMINA linha %d\n", yylineno);
    return TK_ERROR; 
}

\"([^\"\n]*) {
    printf("ERRO: CADEIA DE CARACTERES OCUPA MAIS DE UMA LINHA linha %d\n", yylineno);
    return TK_ERROR;
}

%%