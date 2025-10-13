param(
    [string]$Prog = '',
    [string]$Num = '',
    [string]$Name = 'Novo'
)

if ([string]::IsNullOrEmpty($Prog) -and [string]::IsNullOrEmpty($Num)) {
    Write-Host 'Use: make new PROG=ex12 NAME=MeuExercicio  OR make new NUM=12 NAME=MeuExercicio'
    exit 1
}

if (-not [string]::IsNullOrEmpty($Prog)) {
    $prog = $Prog
} else {
    $prog = 'ex' + ('{0:00}' -f [int]$Num)
}

if ([string]::IsNullOrEmpty($Name)) { $Name = 'Novo' }

$padded = ($prog -replace 'ex0*','')
$padded = '{0:00}' -f [int]$padded
$dir = "Ex${padded}_$Name"

if (Test-Path $dir) {
    Write-Host "$dir already exists"
    exit 1
}

New-Item -ItemType Directory -Path $dir | Out-Null

$impl = Get-Content -Raw -Path '.templates\ex_template.c' -Encoding UTF8
$main = Get-Content -Raw -Path '.templates\main_template.c' -Encoding UTF8

$impl = $impl -replace '__PROG__',$prog
$main = $main -replace '__PROG__',$prog

Set-Content -Path (Join-Path $dir ("${prog}.c")) -Value $impl -Encoding UTF8
Set-Content -Path (Join-Path $dir 'main.c') -Value $main -Encoding UTF8

Write-Host "Created $dir with $($prog).c and main.c"
