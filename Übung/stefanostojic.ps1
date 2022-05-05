param(
[Switch]$create, 
[Switch]$delete,
[String]$CSVPath,
[String]$Delimiter,
[String]$DirectoryPath
)

#Überprüfen ob alle Parameter für create und delete vorhanden sind

#$DirectoryPath muss bei beiden gegeben sein also wird hier auch gleich überprüft ob dieser auch gültig ist
if(!$DirectoryPath){
    throw "DirectoryPath muss gegeben sein"
}elseif(!(Test-Path -Path $DirectoryPath)){
    throw "Pfad nicht Vorhanden"
}

$folderPath = "$DirectoryPath\Verzeichnisse"

#Bei Create muss CSVPath, Delimiter 
if($create){
    if(!$CSVPath -or !$Delimiter){
        throw "CSVPath and the Delimiter for it need to be given"
    }else {
        $csvImport = Import-CSV -Path $CSVPath -Delimiter $Delimiter   
    }
}

#"C:\Users\Stefan\Desktop\Git Repos\Powershell\Übung\Benutzer_AAIF_2021.csv"




function create-directory {
    $count = 0
    New-Item $folderPath -ItemType Directory | Out-Null
    $csvImport | ForEach-Object {
       New-Item $folderPath -ItemType Directory -Name $($_.Name+"_"+$($_.Vorname.substring(0,2)+"_6AAIF")) | Out-Null
       $newPath = $folderPath + "\" + $($_.Name+"_"+$($_.Vorname.substring(0,2)+"_6AAIF"))

       New-Item -Path $newPath -ItemType File -Name "Hinweis.txt" | Out-Null
       Set-Content -Path "$newPath\Hinweis.txt" -Value $("[Herr/Frau] " +  $_.Name)
       $count++
    }
    Write-Host "Directories erstellt: " $count

}

function delete-directory{
    Remove-Item $folderPath -Recurse
}

#create-directory
if($delete -and $create){
    Write-Host "Beide Switches gleichzeitig sind nicht möglich"
}elseif($create){
    #Write-Host "Folderpath: " $folderPath
    if(Test-Path -Path $folderPath){
        Write-Host "Ordnerverzeichnis Existiert bereits"
    }else{
        create-directory
    }
}elseif($delete){
    if(Test-Path -Path $folderPath){
        delete-directory
        Write-Host "Directory $folderPath gelöscht"
    }else{
        Write-Host "Directory existiert nicht!"
    }
}

