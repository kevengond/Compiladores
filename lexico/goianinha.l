%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
%}

%option yylineno  
%option noyywrap 




%%


[ \t\r]+        ;
\n              { /* yylineno é incrementado automaticamente */ }


"programa"      { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, 258, yylineno); 
    return 258; 
}
"car"           { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, 259, yylineno); 
    return 259; 
}
"int"           { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, 260, yylineno); 
    return 260; 
}
"retorne"       { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, 261, yylineno); 
    return 261; 
}
"leia"          { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, 262, yylineno); 
    return 262; 
}
"escreva"       { 
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, 263, yylineno); 
    return 263; 
}

[a-zA-Z_][a-zA-Z0-9_]* {
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, 270, yylineno);
    return 270;
}


[0-9]+ {
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, 272, yylineno);
    return 272;
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


"/*"([^*]|\*+[^*/])*\*+"/" {
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, 273, yylineno);
}



(\n|.) {
    printf("ERRO: CARACTERE INVALIDO linha %d\n", yylineno);
    return -1;
}

"/*"([^*]|\*+[^*/])*\*? {
    printf("ERRO: COMENTARIO NAO TERMINA linha %d\n", yylineno);
    return -2; 
}

\"([^\"\n]*) {
    printf("ERRO: CADEIA DE CARACTERES OCUPA MAIS DE UMA LINHA linha %d\n", yylineno);
    return -3;
}

\"([^\"\n]|\\.)*\" {
    printf("Encontrado o lexema '%s' pertencente ao token de codigo %d linha %d\n", yytext, 273, yylineno);
    return 273; 
}

%%
