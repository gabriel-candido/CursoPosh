#consultar serviço do Windows
$serv = Get-Service -Name wuauserv
if ($serv.Status -eq "Running") 
    
   {Write-Host "Em execução"}
   Else 
    {Write-Host "Servico parado"}