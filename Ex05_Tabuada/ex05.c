#include <stdio.h>

void Ex05_Tabuada(void) {
    int numero;
    printf("Digite um número para ver a tabuada: ");
    scanf("%d", &numero);

    printf("Tabuada de %d:\n", numero);
    for (int i = 1; i <= 10; i++) {
        printf("%d x %d = %d\n", numero, i, numero * i);
    }
}
