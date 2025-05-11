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

%token TK_PROGRAM 258
%token TK_CAR 259
%token TK_INT 260
%token TK_RETORNE 261
%token TK_LEIA 262
%token TK_ESCREVA 263
%token TK_NOVALINHA 264
%token TK_SE 265
%token TK_ENTAO 266
%token TK_SENAO 267
%token TK_ENQUANTO 268
%token TK_EXECUTE 269
%token TK_ID 270
%token TK_CAD_CAR 271
%token TK_INTCONST 272
%token TK_DIF 273
%token TK_MENOR_IGUAL 274
%token TK_MAIOR_IGUAL 275
%token TK_MENOR 276
%token TK_MAIOR 277
%token TK_ERROR

%left TK_OU
%left TK_E
%left TK_IGUAL TK_DIF
%left TK_MENOR TK_MAIOR TK_MENOR_IGUAL TK_MAIOR_IGUAL
%left '+' '-'
%left '*' '/'
%right NEG UNEG

%%

Programa: DeclFuncVar DeclProg
    { printf("Programa reconhecido com sucesso!\n"); }
    ;

DeclFuncVar: Tipo TK_ID DeclVar ';' DeclFuncVar
    | Tipo TK_ID DeclFunc DeclFuncVar
    | /* vazio */
    ;

DeclProg: TK_PROGRAM Bloco
    ;

DeclVar: ',' TK_ID DeclVar
    | /* vazio */
    ;

DeclFunc: '(' ListaParametros ')' Bloco
    ;

ListaParametros: /* vazio */
    | ListaParametrosCont
    ;

ListaParametrosCont: Tipo TK_ID
    | Tipo TK_ID ',' ListaParametrosCont
    ;

Bloco: '{' ListaDeclVar ListaComando '}'
    ;

ListaDeclVar: /* vazio */
    | Tipo TK_ID DeclVar ';' ListaDeclVar
    ;

Tipo: TK_INT
    | TK_CAR
    ;

ListaComando: Comando
    | Comando ListaComando
    ;

Comando: ';'
    | Expr ';'
    | TK_RETORNE Expr ';'
    | TK_LEIA TK_ID ';'
    | TK_ESCREVA Expr ';'
    | TK_ESCREVA TK_CAD_CAR ';'
    | TK_NOVALINHA ';'
    | TK_SE '(' Expr ')' TK_ENTAO Comando
    | TK_SE '(' Expr ')' TK_ENTAO Comando TK_SENAO Comando
    | TK_ENQUANTO '(' Expr ')' TK_EXECUTE Comando
    | Bloco
    ;

Expr: OrExpr
    | TK_ID '=' Expr
    ;

OrExpr: OrExpr TK_OU AndExpr
    | AndExpr
    ;

AndExpr: AndExpr TK_E EqExpr
    | EqExpr
    ;

EqExpr: EqExpr TK_IGUAL DesigExpr
    | EqExpr TK_DIF DesigExpr
    | DesigExpr
    ;

DesigExpr: DesigExpr TK_MENOR AddExpr
    | DesigExpr TK_MAIOR AddExpr
    | DesigExpr TK_MAIOR_IGUAL AddExpr
    | DesigExpr TK_MENOR_IGUAL AddExpr
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

PrimExpr: TK_ID '(' ListExpr ')'
    | TK_ID '(' ')'
    | TK_ID
    | TK_INTCONST
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