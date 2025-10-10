#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <locale.h>
#ifdef _WIN32
    #include <windows.h>
#endif
#include "ex09.c"

int main() {
    // Configura o console para UTF-8
    #ifdef _WIN32
        SetConsoleOutputCP(65001);
        SetConsoleCP(65001);
    #endif
    setlocale(LC_ALL, "pt_BR.UTF-8");

    Ex09_ImprimeSequencia();
    return 0;
}
