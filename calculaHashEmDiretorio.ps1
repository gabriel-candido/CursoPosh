param($diretorio)
$ErrorActionPreference = "stop"

. .\shafile.ps1

$arquivo = Get-ChildItem $diretorio -File   

foreach ($item in $arquivo.FullName) {
        $hashItem = Get-FileSHA1 $item
        Write-Host "o Hash do arquivo $item eh $hashItem" -BackgroundColor Green
        
}


# gps | 
# select Name,
# id,
# @{n='VisturalMemory (MB)'; e={'{0:N2}' -f ($PSItem.VM/1mb) -as [Double]}}
# @{n='PagedMemory (MB)'; e={'{0:N2}' -f ($PSItem.PM/1mb) -as [Double]}}