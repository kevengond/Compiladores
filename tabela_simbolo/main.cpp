#include "tabela_simbolos.h"

int main() {
    TabelaDeSimbolos tabela;

    printf("Criando escopo global e inserindo variáveis...\n");
    tabela.inserir("x", "int", "10");
    tabela.inserir("y", "float", "3.14");

    tabela.mostrarEscopoAtual();

    printf("\nCriando um novo escopo...\n");
    tabela.novoEscopo();
    tabela.inserir("z", "char", "'A'");
    tabela.inserir("x", "int", "20");

    tabela.mostrarEscopoAtual();

    printf("\nBuscando 'x'...\n");
    Simbolo* s = tabela.buscar("x");
    if (s) printf("Encontrado: x é do tipo %s com valor %s\n", s->tipo.c_str(), s->valor.c_str());

    printf("\nRemovendo escopo atual...\n");
    tabela.removerEscopo();

    tabela.mostrarEscopoAtual();

    return 0;
}