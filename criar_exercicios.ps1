[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$basePath = "C:\Users\gabri\Documents\Visual Studio 2022\Exercicios"

$exercicios = @(
    "Ex01_Soma",
    "Ex02_Media",
    "Ex03_ParOuImpar",
    "Ex04_MaiorNumero",
    "Ex05_Tabuada",
    "Ex06_Fatorial",
    "Ex07_ContagemRegressiva",
    "Ex08_ConversaoTemperatura",
    "Ex09_ImprimeSequencia",
    "Ex10_ValidaSenha"
)

foreach ($nome in $exercicios) {
    $folderPath = Join-Path $basePath $nome
    New-Item -ItemType Directory -Path $folderPath -Force

    $numero = $nome.Substring(2,2)
    $fileName = "ex${numero}.c"
    $filePath = Join-Path $folderPath $fileName

    $content = @"
#include <stdio.h>
#include <locale.h>

int main() {
    setlocale(LC_ALL, "");

    // Exercício ${numero}: ${nome}
    printf("Este e o exercicio ${numero}: ${nome}\n");

    return 0;
}
"@

    [System.IO.File]::WriteAllText($filePath, $content, [System.Text.Encoding]::UTF8)
}