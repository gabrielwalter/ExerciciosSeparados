param(
    [Parameter(Mandatory=$true)]
    [string]$Prog
)

# Espera Prog no formato exNN (ex01, ex12, ...)
if ($Prog -notmatch '^ex[0-9]{2}$') {
    Write-Error "Formato inválido. Use: exNN (por exemplo: ex11)"
    exit 1
}

$num = $Prog.Substring(2,2)
$dir = "Ex${num}_New"

if (-Not (Test-Path $dir)) {
    New-Item -ItemType Directory -Path $dir | Out-Null
}

$cfile = Join-Path $dir "$Prog.c"
$mainfile = Join-Path $dir "main.c"

@"
#include <stdio.h>
#include "$Prog.c"

int main(void) {
    printf("Exercício criado\n");
    return 0;
}
"@ | Out-File -Encoding utf8 $mainfile

@"
// Exemplo simples para $Prog
#include <stdio.h>

void ${Prog}_func(void) {
    printf("Função de exemplo\n");
}
"@ | Out-File -Encoding utf8 $cfile

Write-Output "$dir criado"
