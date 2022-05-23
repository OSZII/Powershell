function mod-user{
<#
        .SYNOPSIS
            Function that adds users from a CSV

        .EXAMPLE
            mod-user -CSVPath "$env:USERPROFILE\Desktop\Testfile.csv" -Delimiter ":"

            Adds users from a csv with delimiter :

        .EXAMPLE
            mod-user -CSVPath "$env:USERPROFILE\Desktop\Testfile.csv" -Delimiter ":" -Delete

            This shows the help for the example function.

        .PARAMETER CSVPath
        Path to the CSV-File

        .PARAMETER Delimiter
        Delimiter the seperation symbol

        .Parameter Delete
        if Delete is given instead of adding users it removes users
    #>
param( 
[Switch]$Delete,
[String]$CSVPath = $(throw "You didn't specify the value"),
[String]$Delimiter = $(throw "You didn't specify a Delimiter")
)

#check ob die CSV-Datei existiert
if(-Not (Test-Path $CSVPath)){
    throw("Filepath doesn't exist")
}

#CSV Lesen
$csvImport = Import-CSV -Path $CSVPath -Delimiter $Delimiter

#Get-LocalUser -Name stefans -ErrorAction SilentlyContinue
#$?  # sagt ob True oder False


    $counter = 0
    if($Delete){
        $csvImport | ForEach-Object {
            Get-LocalUser -Name $username -ErrorAction SilentlyContinue
            if(-Not ($?)){
                Write-Host "User existiert nicht"
            }
            $username = $($_.Benutzername)
            Remove-LocalUser -Name $username -ErrorAction SilentlyContinue
            Get-LocalUser -Name $username -ErrorAction SilentlyContinue
            if(-Not ($?)){
                $counter++
            }
        }
        Write-Host $counter " Userkonten gelöscht"
    }else{
        Write-Host "User werden erstellt ..."
            
        $csvImport | ForEach-Object {
            $username = $($_.Benutzername)
            $password = $($_.Kennwort)
            $fullname = $($_.Vorname) + "_" + $($_.Nachname)
            #Write-Host $username $password " " $fullname
            Get-LocalUser -Name $username -ErrorAction SilentlyContinue
            if(-Not ($?)){
                New-LocalUser -Name $username -Password  (ConvertTo-SecureString -string $password -AsPlainText -Force) -FullName $fullname | Out-Null
                Get-LocalUser -Name $username -ErrorAction SilentlyContinue | Out-Null
                if($?){
                    $counter++
                }
            }
        }
        Write-Host $counter " User wurden erstellt"

    }



}
