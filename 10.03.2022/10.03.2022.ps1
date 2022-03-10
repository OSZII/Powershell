#+ Lassen Sie sich alle PowerShell-Laufwerke des Dateisystems anzeigen.
Get-PSDrive -PSProvider FileSystem
#+ Legen Sie (mit der PowerShell) ein Verzeichnis $HOME\Testdaten an.
New-Item -ItemType Directory $HOME\Testdaten
#+ Erstellen Sie ein neues PowerShell-Laufwerk mit Namen TD und dem gerade erstellten Verzeichnis als Stammverzeichnis.
New-PSDrive -Name TD -PSProvider FileSystem -Root $HOME\Testdaten
#+ Wechseln Sie in das neue PowerShell-Laufwerk.
cd TD:\
#+ Erstellen Sie im Stammverzeichnis des Laufwerks TD: drei Dateien:
#    + eine neue, leere Textdatei mit Namen notiz.txt
New-Item -Name notiz.txt
#    + eine Datei prozesse.txt, die als Inhalt den Namen und die ID der aktuellen Prozesse Ihres Rechners erhÃ¤lt, deren Name mit s oder w beginnt
New-Item -Name prozesse.txt
Get-Process | Where-Object -FilterScript {$_.Name -like "w*" -or $_.Name -like "s*" } | Select-Object -Property ProcessName, Id | 
Out-File -FilePath TD:\prozesse.txt
#    + eine Datei, die alle laufenden Dienste im html-Format ausgibt (Dienste.html)
Get-Process | Where-Object -FilterScript {$_.Name -like "w*" -or $_.Name -like "s*" } | Select-Object -Property ProcessName, Id | 
ConvertTo-Html -PreContent "<h1>Hello World!</h1>" -Title "st Grüßen" | Out-File -FilePath TD:\Dienste.html
#+ Schreiben Sie in die Datei notiz.txt
#    + aktuelle Datumsinformationen sowie
#    + die Liste der Dateinamen im Laufwerk Testdaten  
Set-Content -Path .\notiz.txt -Value ((Get-Date), (Get-ChildItem -Path $TD))
#+ Versehen Sie die Datei prozesse.txt mit einem Schreibschutz.
Set-ItemProperty -Path TD:\prozesse.txt -Name isreadonly -Value $true
#+ Lassen Sie sich alle PowerShell-Laufwerke des Dateisystems anzeigen.
Get-PSDrive -PSProvider FileSystem
#+ LÃ¶schen Sie das virtuelle PowerShell-Laufwerk TD: aus der Liste der PowerShell-Laufwerke.
Remove-PSDrive -Name TDs

#Remove-Item -Path <Itemname> -Force wenn man mit schreibschutz entfernen will