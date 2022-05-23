param( 
[Switch]$Delete,
[String]$CSVPath = $(throw "You didn't specify the value"),
[String]$Delimiter = $(throw "You didn't specify a Delimiter")
)

#check ob die CSV-Datei existiert
if(Test-Path $CSVPath){
    Write-Host "Dateipfad Vorhanden";
}else{
    throw("File doesn't exist");
}

#Get-LocalUser -Name stefans -ErrorAction SilentlyContinue
#$?  # sagt ob True oder False

function mod-user{
    
}