#include <stdio.h>

// static: previne erro de múltipla definição (LNK2005) no Visual Studio
// quando múltiplos arquivos .c são compilados juntos no mesmo projeto
static void imprimeSequencia(int inicio, int fim) {
    if (inicio > fim) {
        printf("O valor inicial deve ser menor ou igual ao final.\n");
        return;
    }

    printf("Sequência de %d até %d:\n", inicio, fim);
    for (int i = inicio; i <= fim; i++) {
        printf("%d ", i);
    }
    printf("\n");
}

static void Ex09_ImprimeSequencia(void) {
    int inicio, fim;

    printf("Digite o valor inicial: ");
    scanf("%d", &inicio);

    printf("Digite o valor final: ");
    scanf("%d", &fim);

    imprimeSequencia(inicio, fim);
}
