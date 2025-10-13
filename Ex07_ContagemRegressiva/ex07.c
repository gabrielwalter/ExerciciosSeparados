#include <stdio.h>

// static: previne erro de múltipla definição (LNK2005) no Visual Studio
// quando múltiplos arquivos .c são compilados juntos no mesmo projeto

// Função para realizar a contagem regressiva
static void contagemRegressiva(int inicio) {
    for (int i = inicio; i >= 0; i--) {
        printf("%d\n", i);
    }
    printf("Fim da contagem!\n");
}

static void Ex07_ContagemRegressiva(void) {
    int numero;

    printf("Digite um número para iniciar a contagem regressiva: ");
    scanf("%d", &numero);

    if (numero < 0) {
        printf("Número inválido. Digite um valor positivo.\n");
        return;
    }

    contagemRegressiva(numero);
}
