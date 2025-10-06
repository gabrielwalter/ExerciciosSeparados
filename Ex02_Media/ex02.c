#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

void Ex02_Media() {
    float n1 = 0, n2 = 0, n3 = 0;

    printf("Digite três notas: ");
    if (scanf("%f %f %f", &n1, &n2, &n3) != 3) {
        printf("Entrada inválida.\n");
        return;
    }

    float media = (n1 + n2 + n3) / 3;
    printf("Média: %.2f\n", media);
}