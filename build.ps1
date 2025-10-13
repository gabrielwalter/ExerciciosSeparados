param(
    [switch]$Release
)

Write-Host "Iniciando build (PowerShell)..."
$buildDir = Join-Path -Path $PSScriptRoot -ChildPath 'build'
if (-not (Test-Path -Path $buildDir)) { New-Item -ItemType Directory -Path $buildDir | Out-Null }

$cfg = 'Debug'
if ($Release) { $cfg = 'Release' }

cmake -S . -B "$buildDir"
cmake --build "$buildDir" --config $cfg

Write-Host "Build concluído. Verifique a pasta build\ e bin\ (se o projeto gerar binários lá)."