#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

// static: previne erro de múltipla definição (LNK2005) no Visual Studio
// quando múltiplos arquivos .c são compilados juntos no mesmo projeto
static void Ex04_MaiorNumero() {
    int a = 0, b = 0;

    printf("Digite dois números: ");
    if (scanf("%d %d", &a, &b) != 2) {
        printf("Entrada inválida.\n");
        return;
    }

    if (a > b)
        printf("O maior número é: %d\n", a);
    else if (b > a)
        printf("O maior número é: %d\n", b);
    else
        printf("Os números são iguais.\n");
}
