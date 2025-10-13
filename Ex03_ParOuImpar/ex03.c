#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

// static: previne erro de múltipla definição (LNK2005) no Visual Studio
// quando múltiplos arquivos .c são compilados juntos no mesmo projeto
static void Ex03_ParOuImpar() {
    int numero = 0;

    printf("Digite um número: ");
    if (scanf("%d", &numero) != 1) {
        printf("Entrada inválida.\n");
        return;
    }

    if (numero % 2 == 0)
        printf("O número é par.\n");
    else
        printf("O número é ímpar.\n");
}
