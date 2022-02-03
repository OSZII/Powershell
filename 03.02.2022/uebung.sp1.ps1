# Erste Übung 1
#Zeigen Sie den Namen der 5 größten PDF-Datein in Benutzerverzeichnis
#Get-Childitem -Path $env:USERPROFILE -Filter "*.pdf" -Recurse -File | Sort-Object -Property Length -Descending | `
#Select-Object -First 5 -Property FullName, Length

#Erstelle 5 Testdateien im Benutzerordner: Test_1.txt, Test_2.txt
#I bis 5
(1..5) | ForEach-Object -Process { New-Item -ItemType File  -Path $env:USERPROFILE -Name Test_$_.txt }