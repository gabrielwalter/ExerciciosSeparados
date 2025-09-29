#include <stdio.h>

int main() {
    int dentes;
    printf("Quantos dentes voce tem? ");
    scanf("%d", &dentes);

    if (dentes == 4) {
        printf("Bom dia!\n");
    } else {
        printf("Tenha um bom dia!\n");
    }

    return 0;
}