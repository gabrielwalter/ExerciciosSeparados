#include <stdio.h>

// static: previne erro de múltipla definição (LNK2005) no Visual Studio
// quando múltiplos arquivos .c são compilados juntos no mesmo projeto
static void Ex08_ConversaoTemperatura(void) {
    int opcao;
    float temperatura, convertido;

    printf("Escolha a conversão:\n");
    printf("1 - Celsius para Fahrenheit\n");
    printf("2 - Fahrenheit para Celsius\n");
    printf("Opção: ");
    scanf("%d", &opcao);

    if (opcao == 1) {
        printf("Digite a temperatura em Celsius: ");
        scanf("%f", &temperatura);
        convertido = (temperatura * 9 / 5) + 32;
        printf("%.2f°C = %.2f°F\n", temperatura, convertido);
    } else if (opcao == 2) {
        printf("Digite a temperatura em Fahrenheit: ");
        scanf("%f", &temperatura);
        convertido = (temperatura - 32) * 5 / 9;
        printf("%.2f°F = %.2f°C\n", temperatura, convertido);
    } else {
        printf("Opção inválida.\n");
    }
}
