#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

void Ex01_Soma() {
    int a = 0, b = 0;

    printf("Digite dois números: ");
    if (scanf("%d %d", &a, &b) != 2) {
        printf("Entrada inválida.\n");
        return;
    }

    printf("Soma: %d\n", a + b);
}