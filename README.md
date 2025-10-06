📘 ExerciciosSeparados
Projeto em C que organiza exercícios de programação em arquivos separados, com foco em modularidade, prática de lógica e uso eficiente de Makefile.
🔎 Diferente do projeto MenuExercicios, onde os exercícios são chamados por um menu central, aqui cada exercício possui sua própria função main() e pode ser compilado e executado de forma independente.


🛠️ Estrutura
Cada exercício está em um arquivo .c separado (ex: ex01.c, ex02.c, etc.), com sua própria função main(). Isso permite testes isolados, facilita a manutenção e torna o projeto mais modular.

🚀 Como compilar e executar
Requisitos:
- GCC instalado
- Make instalado
Comandos:
make            # Compila todos os arquivos .c e gera os executáveis
make clean      # Remove os binários gerados


Se houver um Makefile com suporte a make run, ele pode executar um dos exercícios automaticamente.


📂 Exemplo de uso
$ make
gcc -std=c17 -Wall -O2 -g ex01.c -o ex01
gcc -std=c17 -Wall -O2 -g ex02.c -o ex02
...
$ ./ex01
(Saída do exercício 01)



📌 Autor
Gabriel Walter
Joinville, SC – Brasil
Desenvolvedor em formação, focado em C, automação com Makefile e boas práticas de código.
