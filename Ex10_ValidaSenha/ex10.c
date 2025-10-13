#include <stdio.h>
#include <string.h>

#define SENHA_CORRETA "1234"

// static: previne erro de múltipla definição (LNK2005) no Visual Studio
// quando múltiplos arquivos .c são compilados juntos no mesmo projeto
static void Ex10_ValidaSenha(void) {
    char senha[20];
    int tentativas = 3;

    while (tentativas > 0) {
        printf("Digite a senha: ");
        scanf("%s", senha);

        if (strcmp(senha, SENHA_CORRETA) == 0) {
            printf("Senha correta! Acesso permitido.\n");
            return;
        } else {
            tentativas--;
            printf("Senha incorreta. Tentativas restantes: %d\n", tentativas);
        }
    }

    printf("Número de tentativas excedido. Acesso negado.\n");
}
