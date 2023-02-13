param($tipodeExportacao)
clear 

#Nome do arquivo
$nameExp =@{
    Label = "Nome";
    Expression = {$_.name}
    }

#tamanho do arquivo
$lengthExp = @{
    Label = "Tamanho";
    Expression = {"{0:n2}KB" -f ($_.length / 1kb)}
    }

#Caminho do arquivo
$dir =@{
    Label = "Caminho";
    Expression = "DirectoryName"
    }

$parameter = $nameExp, $lengthExp, $dir

#Procurar em todos os diretorios a partir de...
cd C:\Users\gabriel-ananias

$resultado =
dir -Recurse -File |
	? Name -Like "*ps1" |
	Select $parameter

if($tipodeExportacao -eq "html"){
    $tituloPagina = "relatorio de arquivos posh"
    $titulobody = "<h1> $titulopagina </h1>"
    $resultado |
         ConvertTo-Html `
            -Title $tituloPagina -Body $titulobody|
         Out-File C:\Users\gabriel-ananias\Desktop\relatorio.html
         }
         elseif ($tipodeExportacao -eq "json")
         {
            $resultado |
            ConvertTo-Json | 
            out-file C:\Users\gabriel-ananias\Desktop\relatorio.json
         }
         elseif ($tipodeExportacao -eq "csv")
         {
            $resultado |
            ConvertTo-csv -NoTypeInformation| 
            out-file C:\Users\gabriel-ananias\Desktop\relatorio.csv
         
         }