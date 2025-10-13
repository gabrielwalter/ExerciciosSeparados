# Lista diretórios ExNN_* e imprime no formato: "  exNN (ExNN_Name)"
Get-ChildItem -Name -Directory Ex* | ForEach-Object {
    if ($_ -match '^Ex([0-9][0-9])_') {
        $num = $matches[1]
        Write-Output "  ex${num} ($_)"
    }
}
