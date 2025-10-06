#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

void Ex04_MaiorNumero() {
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