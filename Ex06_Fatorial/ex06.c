#include <stdio.h>

// Fun��o recursiva para calcular o fatorial
int fatorial(int n) {
    if (n <= 1)
        return 1;
    else
        return n * fatorial(n - 1);
}

void Ex06_Fatorial(void) {
    int n;

    printf("Digite um n�mero inteiro positivo: ");
    scanf("%d", &n);

    if (n < 0) {
        printf("Fatorial n�o definido para n�meros negativos.\n");
        return;
    }

    int resultado = fatorial(n);
    printf("Fatorial de %d �: %d\n", n, resultado);
}
