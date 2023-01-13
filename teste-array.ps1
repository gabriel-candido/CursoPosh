#scripts que sua array
Clear-Host
$GoogleDNS = @("8.8.8.8", "8.8.4.4")
$totaldns = $GoogleDNS.Count
Write-Host pingando todos os $totalDNS DNS do google
Test-Connection $GoogleDNS -Count 1
sleep 3
Write-Host "fim"