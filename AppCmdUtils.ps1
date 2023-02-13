function Add-ApplicationPool {
    parm(
        [string[]] $computerName,
        [string] $ApplicationPoolName 
    )
    
    #
    $sessions = $computerName |ForEach-Object  {New-PSSession -ComputerName $_}
    $jobs = $sessions |ForEach-Object{

        Invoke-Command -Session $_ -ScriptBlock{
        "Estamos executando no computador: $computerName"
        
        $appCMDargs = "add apppool /name:$($args[0]) /managedRuntimeVersion:v4.0 /managedPipelineMode:Integrade"

        C:\Windows\System32\inetsrv\appcmd.exe $appCMDargs.Split(' ')
        } -ArgumentList $ApplicationPoolName -AsJob

    }
    $jobs |Wait-Job | 
        Select-Object @{Expresion= {Receive-Job $_}; label = "Resultado"},"Name"
    $jobs | Remove-Job
    $sessions |Remove-PSSession

}