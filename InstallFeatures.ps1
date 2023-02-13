function Install-WindowsFeatureInServer{
    param(
        [string[]] $computers,
        [string] $featureName
    )

    $jobScriptBlock = {
        parma(
            [string] $computerName,
            [string] $featureName
        ) 
        Install-WindowsFeatureInServer -computerName $computerName -name $featureName
    }

    $computers | ForEach-Object{
        Start-Job -ScriptBlock $jobScriptBlock -ArgumentList ($_, $featureName)
    }

}