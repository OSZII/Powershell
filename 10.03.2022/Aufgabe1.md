+ Lassen Sie sich alle PowerShell-Laufwerke des Dateisystems anzeigen.
Get-PSDrive -PSProvider FileSystem
+ Legen Sie (mit der PowerShell) ein Verzeichnis $HOME\Testdaten an.
+ Erstellen Sie ein neues PowerShell-Laufwerk mit Namen TD und dem gerade erstellten Verzeichnis als Stammverzeichnis.
+ Wechseln Sie in das neue PowerShell-Laufwerk.
+ Erstellen Sie im Stammverzeichnis des Laufwerks TD: drei Dateien:
    + eine neue, leere Textdatei mit Namen notiz.txt
    + eine Datei prozesse.txt, die als Inhalt den Namen und die ID der aktuellen Prozesse Ihres Rechners erhält, deren Name mit s oder w beginnt
    + eine Datei, die alle laufenden Dienste im html-Format ausgibt (Dienste.html)
+ Schreiben Sie in die Datei notiz.txt
    + aktuelle Datumsinformationen sowie
    + die Liste der Dateinamen im Laufwerk Testdaten  
+ Versehen Sie die Datei prozesse.txt mit einem Schreibschutz.
+ Lassen Sie sich alle PowerShell-Laufwerke des Dateisystems anzeigen.
+ Löschen Sie das virtuelle PowerShell-Laufwerk TD: aus der Liste der PowerShell-Laufwerke.
