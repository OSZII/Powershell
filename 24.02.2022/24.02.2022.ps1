# Zeige alle ini und txt Dateien im Benutzerordner (rekursiv) an die größer als 1KB sind Anzuzeigen ist der Name, Erstelldatum und die Größe
#Get-ChildItem -Path $HOME -File -Recurse | 
#Where-Object -FilterScript {$_.Extension -eq ".txt" -or $_.Extension -eq ".ini" } | 
#Where-Object -FilterScript {$_.Length -gt 1kb} 

#Get-ChildItem -Path $HOME -File -Recurse | 
#Where-Object -FilterScript {($_.Extension -eq ".txt" -or $_.Extension -eq ".ini") -and $_.Length -gt 1kb}

#Get-ChildItem -Path $HOME -File -Include *.ini, *.txt -Recurse | Where-Object -FilterScript { $_.Length -gt 1kb } | 
#Select-Object -Property Name, CreationTime, Length

#Get-ChildItem -Path $HOME -File -Include *.ini, *.txt -Recurse | Where-Object -FilterScript { $_.Length -gt 1kb } | 
#Select-Object -Property Name, CreationTime, Length | Out-File C:\Users\Stefan\Desktop\test5.txt
#noClobber macht das files falls existiert nicht übersschrieben werden soll

#Get-Command -Verb out

#Get-ChildItem -Path $HOME -File -Include *.ini, *.txt -Recurse | Where-Object -FilterScript { $_.Length -gt 1kb } | 
#Select-Object -Property Name, CreationTime, Length | Export-Csv -Path C:\Users\Stefan\Desktop\test.csv -Encoding UTF8 

#Get-ChildItem -Path $HOME -File -Include *.ini, *.txt -Recurse | Where-Object -FilterScript { $_.Length -gt 1kb } | 
#Select-Object -Property Name, CreationTime, Length | 
#ConvertTo-Html -PreContent "<h1>Hello World!</h1>" -Title "6AAIF lässt Grüßen" |
#Out-File -FilePath C:\Users\Stefan\Desktop\ausgabe.html;

#Get-ChildItem -Path $HOME -File -Include *.ini, *.txt -Recurse | Where-Object -FilterScript { $_.Length -gt 1kb } | 
#Select-Object -Property Name, CreationTime, Length | 
#ConvertTo-Json |
#Out-File -FilePath C:\Users\Stefan\Desktop\ausgabe.json;

#Get-PSProvider

#Get-PSDrive | Sort-Object Provider

#Set-Location Alias:

#Set-Location Env:

#Set-Location $HOME

#New-PSDrive -Name taif -PSProvider FileSystem -Root C:\Users\Stefan\Desktop\Tinf_5AAIF_2022\PS\

#$profile

#Test-Path $profile.CurrentUserCurrentHost

#New-Item -Path $profile.CurrentUserCurrentHost

#Get-ExecutionPolicy;

#Set-ExecutionPolicy Unrestricted -Scope CurrentUser

#Get-Command -Noun Content

#Get-Content $profile

Set-Content $profile -Value "New-PSDrive -Name taif -PSProvider FileSystem -Root C:\Users\Stefan\Desktop\ | out-null"