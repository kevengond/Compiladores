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


"programa"      { printf("[TOKEN]: 'programa' | [LINHA]: %d\n\n", yylineno); return 258; }
"car"           { printf("[TOKEN]: 'car' | [LINHA]: %d\n\n", yylineno); return 259; }
"int"           { printf("[TOKEN]: 'int' | [LINHA]: %d\n\n", yylineno); return 260; }
"retorne"       { printf("[TOKEN]: 'retorne' | [LINHA]: %d\n\n", yylineno); return 261; }
"leia"          { printf("[TOKEN]: 'leia' | [LINHA]: %d\n\n", yylineno); return 262; }
"escreva"       { printf("[TOKEN]: 'escreva' | [LINHA]: %d\n\n", yylineno); return 263; }

[a-zA-Z_][a-zA-Z0-9_]* {
    printf("[TOKEN]: 'identificador' (%s) | [LINHA]: %d\n\n", yytext, yylineno);
    return 270;
}


[0-9]+ {
    printf("[TOKEN]: 'número' (%s) | [LINHA]: %d\n\n", yytext, yylineno);
    return 272;
}

"="             { printf("[TOKEN]: '=' | [LINHA]: %d\n\n", yylineno); return '='; }
"+"             { printf("[TOKEN]: '+' | [LINHA]: %d\n\n", yylineno); return '+'; }
"-"             { printf("[TOKEN]: '-' | [LINHA]: %d\n\n", yylineno); return '-'; }
"*"             { printf("[TOKEN]: '*' | [LINHA]: %d\n\n", yylineno); return '*'; }
"/"             { printf("[TOKEN]: '/' | [LINHA]: %d\n\n", yylineno); return '/'; }
"("             { printf("[TOKEN]: '(' | [LINHA]: %d\n\n", yylineno); return '('; }
")"             { printf("[TOKEN]: ')' | [LINHA]: %d\n\n", yylineno); return ')'; }
"{"             { printf("[TOKEN]: '{' | [LINHA]: %d\n\n", yylineno); return '{'; }
"}"             { printf("[TOKEN]: '}' | [LINHA]: %d\n\n", yylineno); return '}'; }
";"             { printf("[TOKEN]: ';' | [LINHA]: %d\n\n", yylineno); return ';'; }


"/*"([^*]|\*+[^*/])*\*+"/" {
    printf("[COMENTÁRIO]: Ignorado | [LINHA]: %d\n\n", yylineno);
}



(\n|.) {
    printf("[ERRO]: Caractere inválido (%s) | [LINHA]: %d\n", yytext, yylineno);
    return -1;
}

"/*"([^*]|\*+[^*/])*\*? {
    printf("[ERRO]: Comentário não terminado | [LINHA]: %d\n", yylineno);
    return -2; 
}

\"([^\"\n]*) {
    printf("[ERRO]: Cadeia de caracteres não terminada | [LINHA]: %d\n", yylineno);
    return -3;
}

\"([^\"\n]|\\.)*\" {
    printf("[TOKEN]: 'string' (%s) | [LINHA]: %d\n\n", yytext, yylineno);
    return 273; 
}

%%
