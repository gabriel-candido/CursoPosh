#teste de internet
 clear
 $conn = (Test-Connection www.google.com -Count 1 -Quiet)
 if($conn -eq "true") 
    {write-host "internet funcionando"}