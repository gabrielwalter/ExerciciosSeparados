param(
    [switch]$Release
)

Write-Host "Iniciando build (PowerShell)..."
$buildDir = Join-Path -Path $PSScriptRoot -ChildPath 'build'
if (Test-Path -Path $buildDir) {
    Write-Host "Cleaning existing build directory..."
    Remove-Item -Recurse -Force -ErrorAction SilentlyContinue $buildDir
}
New-Item -ItemType Directory -Path $buildDir | Out-Null

$cfg = 'Debug'
if ($Release) { $cfg = 'Release' }

cmake -S . -B "$buildDir"
if ($LASTEXITCODE -ne 0) {
    Write-Error "CMake configuration failed (see output above). Aborting build."
    exit $LASTEXITCODE
}

cmake --build "$buildDir" --config $cfg
if ($LASTEXITCODE -ne 0) {
    Write-Error "Build failed (cmake --build returned an error)."
    exit $LASTEXITCODE
}

Write-Host "Build concluído. Verifique a pasta build\ e bin\ (se o projeto gerar binários lá)."