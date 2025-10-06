#include <stdio.h>

// Fun��o para realizar a contagem regressiva
void contagemRegressiva(int inicio) {
    for (int i = inicio; i >= 0; i--) {
        printf("%d\n", i);
    }
    printf("Fim da contagem!\n");
}

void Ex07_ContagemRegressiva(void) {
    int numero;

    printf("Digite um n�mero para iniciar a contagem regressiva: ");
    scanf("%d", &numero);

    if (numero < 0) {
        printf("N�mero inv�lido. Digite um valor positivo.\n");
        return;
    }

    contagemRegressiva(numero);
}
