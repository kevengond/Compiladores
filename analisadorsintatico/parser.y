%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylineno;
extern int yylex();
extern FILE *yyin;
extern char *yytext;

void yyerror(const char *s);
%}

%token PROGRAM 258
%token CAR 259
%token INT 260
%token RETORNE 261
%token LEIA 262
%token ESCREVA 263
%token NOVALINHA 264
%token SE 265
%token ENTAO 266
%token SENAO 267
%token ENQUANTO 268
%token EXECUTE 269
%token ID 270
%token CAD_CAR 271
%token INTCONST 272
%token DIF 273
%token MENOR_IGUAL 274
%token MAIOR_IGUAL 275
%token MENOR 276
%token MAIOR 277
%token ERROR

%left OU
%left E
%left IGUAL DIF
%left MENOR MAIOR MENOR_IGUAL MAIOR_IGUAL
%left '+' '-'
%left '*' '/'
%right NEG UNEG

%%

Programa: DeclFuncVar DeclProg
    { printf("Programa reconhecido com sucesso!\n"); }
    ;

DeclFuncVar: Tipo ID DeclVar ';' DeclFuncVar
    | Tipo ID DeclFunc DeclFuncVar
    | /* vazio */
    ;

DeclProg: PROGRAM Bloco
    ;

DeclVar: ',' ID DeclVar
    | /* vazio */
    ;

DeclFunc: '(' ListaParametros ')' Bloco
    ;

ListaParametros: /* vazio */
    | ListaParametrosCont
    ;

ListaParametrosCont: Tipo ID
    | Tipo ID ',' ListaParametrosCont
    ;

Bloco: '{' ListaDeclVar ListaComando '}'
    ;

ListaDeclVar: /* vazio */
    | Tipo ID DeclVar ';' ListaDeclVar
    ;

Tipo: INT
    | CAR
    ;

ListaComando: Comando
    | Comando ListaComando
    ;

Comando: ';'
    | Expr ';'
    | RETORNE Expr ';'
    | LEIA ID ';'
    | ESCREVA Expr ';'
    | ESCREVA CAD_CAR ';'
    | NOVALINHA ';'
    | SE '(' Expr ')' ENTAO Comando
    | SE '(' Expr ')' ENTAO Comando SENAO Comando
    | ENQUANTO '(' Expr ')' EXECUTE Comando
    | Bloco
    ;

Expr: OrExpr
    | ID '=' Expr
    ;

OrExpr: OrExpr OU AndExpr
    | AndExpr
    ;

AndExpr: AndExpr E EqExpr
    | EqExpr
    ;

EqExpr: EqExpr IGUAL DesigExpr
    | EqExpr DIF DesigExpr
    | DesigExpr
    ;

DesigExpr: DesigExpr MENOR AddExpr
    | DesigExpr MAIOR AddExpr
    | DesigExpr MAIOR_IGUAL AddExpr
    | DesigExpr MENOR_IGUAL AddExpr
    | AddExpr
    ;

AddExpr: AddExpr '+' MulExpr
    | AddExpr '-' MulExpr
    | MulExpr
    ;

MulExpr: MulExpr '*' UnExpr
    | MulExpr '/' UnExpr
    | UnExpr
    ;

UnExpr: '-' PrimExpr %prec UNEG
    | '!' PrimExpr %prec NEG
    | PrimExpr
    ;

PrimExpr: ID '(' ListExpr ')'
    | ID '(' ')'
    | ID
    | INTCONST
    | '(' Expr ')'
    ;

ListExpr: Expr
    | ListExpr ',' Expr
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "ERRO: %s na linha %d próximo a '%s'\n", s, yylineno, yytext);
}

int main(int argc, char **argv) {
    if (argc > 1) {
        FILE *file = fopen(argv[1], "r");
        if (!file) {
            fprintf(stderr, "Não foi possível abrir o arquivo %s\n", argv[1]);
            return 1;
        }
        yyin = file;
    }
    
    printf("Iniciando análise sintática...\n");
    int result = yyparse();
    
    if (result == 0) {
        printf("Análise sintática concluída com sucesso!\n");
    } else {
        printf("Análise sintática falhou devido a erros.\n");
    }
    
    return result;
}