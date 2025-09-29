

#include <stdio.h>

int main (void) {
    int a, b, soma;
    printf("Digite dois nmeros inteiros: ");
    scanf("%d %d", &a, &b);
    soma = a + b;
    printf("A soma de %d com %d vale %d\n", a, b, soma);
    return 0;
}