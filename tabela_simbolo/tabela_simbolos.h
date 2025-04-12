#ifndef TABELA_SIMBOLOS_H
#define TABELA_SIMBOLOS_H

#include <iostream>
#include <unordered_map>
#include <stack>
#include <string>

using namespace std;


struct Simbolo {
    string tipo;
    string valor; 
};

class TabelaDeSimbolos {
private:
    stack<unordered_map<string, Simbolo>> pilha; // Pilha de tabelas de símbolos

public:
    TabelaDeSimbolos(); 
    void novoEscopo();   // Cria um novo escopo
    void removerEscopo(); // Remove o escopo atual
    void inserir(const string& nome, const string& tipo, const string& valor = ""); // Insere símbolo
    Simbolo* buscar(const string& nome); // Busca um símbolo
    void mostrarEscopoAtual(); // Mostra os símbolos do escopo atual
    void inserirFuncao(const string& nome, int numParametros, const string& tipoRetorno); // Insere uma função
    void inserirParametro(const string& nome, int tipo, int posicao, Simbolo* funcao); // Insere um parâmetro
    void eliminarPilha(); // Elimina toda a pilha de escopos
};

#endif // TABELA_SIMBOLOS_H