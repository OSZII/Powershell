<#
.SYNOPSIS
    outputs errorlogs
.DESCRIPTION
    Outputs the Errorlog message of Logtype and limits it to Anzahl
.NOTES
    Author         : Stefan Ostojic
#>
function get-errorlog ($anzahl,[string]$type) { 
$eventlogs = Get-EventLog $type -Newest $anzahl | select -ExpandProperty message 
$eventlogs | foreach { 
Add-Content -Path "$env:USERPROFILE\Desktop\ostojicstefan_Errorlog-Datum_Zeit.csv" -Value $_
}

Write-Host $eventlogs

New-Item "$env:USERPROFILE\Desktop\ostojicstefan_Errorlog-Datum_Zeit.html" -ItemType File
Set-Content "$env:USERPROFILE\Desktop\ostojicstefan_Errorlog-Datum_Zeit.html" $eventlogs

}


#$type = Read-Host "Wählen Sie den Logtype aus:"
#$anzahl = Read-Host "Menge eingeben [0-9]+"
#get-errorlog $anzahl $type

#Write-Host "-------------------------"
#Get-EventLog "Application" 
#Write-Host "-------------------------"
Get-Help get-errorlog
