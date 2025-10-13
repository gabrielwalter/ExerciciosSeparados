#include <stdio.h>

// static: previne erro de múltipla definição (LNK2005) no Visual Studio
// quando múltiplos arquivos .c são compilados juntos no mesmo projeto

// Função recursiva para calcular o fatorial
static int fatorial(int n) {
    if (n <= 1)
        return 1;
    else
        return n * fatorial(n - 1);
}

static void Ex06_Fatorial(void) {
    int n;

    printf("Digite um número inteiro positivo: ");
    scanf("%d", &n);

    if (n < 0) {
        printf("Fatorial não definido para números negativos.\n");
        return;
    }

    int resultado = fatorial(n);
    printf("Fatorial de %d é: %d\n", n, resultado);
}
