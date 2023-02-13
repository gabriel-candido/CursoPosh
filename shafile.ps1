function Get-FileSHA1{
    param(
        [parameter(   
            valuefrompipeline = $true,
            ValueFromPipelineByPropertyName = "Fullname",
            mandatory = $true
            )]        
        [string] $filePath
        )
    
    begin
    {
        $sha1 = New-Object System.Security.Cryptography.SHA1Managed
        $pretyHash = New-Object System.Text.StringBuilder

    }

    process
    {
        $fileContent = Get-Content $filePath
        $fileByte = [System.Text.Encoding]::UTF8.GetBytes($fileContent) 

        $hash = $sha1.ComputeHash($fileByte)
    

        foreach($byte in $hash)
        {
            $hexanotation = $byte.toString("X2")
            $pretyHash.Append($hexanotation) > $null
        }
        $pretyHash.ToString()

        $pretyHash.Clear() > $null

    }

    end 
    {
        $sha1.Dispose()
    }
    
}



#>

<#
function Get-FileSHA256($filePath){
    $fileContent = Get-Content $filePath
    $fileByte = [System.Text.Encoding]::UTF8.GetBytes($fileContent) 

    $sha256 = New-Object System.Security.Cryptography.SHA256Managed 
   
    $newhash =$sha256.ComputeHash($fileByte)

    $newHash = New-Object System.Text.StringBuilder

    foreach ($byte in $newHash) {
       
        $hexanotation = $byte.ToString("X2")
        $newHash.Append($hexanotation)
    }
    Write-Host $newHash.ToString()  -BackgroundColor Green

    
}

<#
function Get-FileSHA1($filePath){
    $fileContent = Get-Content $filePath
    $fileByte = [System.Text.Encoding]::UTF8.GetBytes($fileContent) 

    $sha1 = New-Object System.Security.Cryptography.SHA1Managed
    $hash = $sha1.ComputeHash($fileByte)
    
}
function Get-FileSHA1($filePath){
    $fileContent = Get-Content $filePath
    $fileByte = [System.Text.Encoding]::UTF8.GetBytes($fileContent) 

    $sha1 = New-Object System.Security.Cryptography.SHA1Managed
    $hash = $sha1.ComputeHash($fileByte)
    #>