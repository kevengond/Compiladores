<h1>Trabalho da disciplina de Compiladores 2025/1</h1>


<h3>Como gerar o executável</h3>

flex -o goianinha.c goianinha.l gera o flex do código.
gcc -o goianinha goianinha.c main.c -lfl
./goianinha teste.g

