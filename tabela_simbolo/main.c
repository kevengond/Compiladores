#include "tabela_simbolos.h"

int main() {
    PilhaDeEscopos pilha;
    inicializarPilha(&pilha);

    printf("Criando escopo global e inserindo variáveis...\n");
    novoEscopo(&pilha);
    inserirSimbolo(&pilha, "x", "int", "10");
    inserirSimbolo(&pilha, "y", "float", "3.14");

    mostrarEscopoAtual(&pilha);

    printf("\nCriando um novo escopo...\n");
    novoEscopo(&pilha);
    inserirSimbolo(&pilha, "z", "char", "'A'");
    inserirSimbolo(&pilha, "x", "int", "20");

    mostrarEscopoAtual(&pilha);

    printf("\nBuscando 'x'...\n");
    Simbolo* s = buscarSimbolo(&pilha, "x");
    if (s) {
        printf("Encontrado: x é do tipo %s com valor %s\n", s->tipo, s->valor);
    }

    printf("\nRemovendo escopo atual...\n");
    removerEscopo(&pilha);

    mostrarEscopoAtual(&pilha);

    eliminarPilha(&pilha);

    return 0;
}