#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

// static: previne erro de múltipla definição (LNK2005) no Visual Studio
// quando múltiplos arquivos .c são compilados juntos no mesmo projeto
static void Ex01_Soma() {
    int a = 0, b = 0;

    printf("Digite dois números: ");
    if (scanf("%d %d", &a, &b) != 2) {
        printf("Entrada inválida.\n");
        return;
    }

    printf("Soma: %d\n", a + b);
}
