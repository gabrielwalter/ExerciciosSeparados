#include <stdio.h>
#include <locale.h>

int main(void) {

    setlocale(LC_ALL, "");

    printf("Meu gatinho é lindo!\n"); // remover

    int a[5] = {1, 2};
    int b[5];          // não inicializado
    int c[5] = {0};

    for (int i = 0; i < 5; ++i)
        printf("a[%d]=%d  ", i, a[i]);
    printf("\n");

    for (int i = 0; i < 5; ++i)
        printf("c[%d]=%d  ", i, c[i]);
    printf("\n");



    return 0;
}
