# Schritt 1: Anlegen eines PSCredential-Objekts mit Benutzername und Kennwort als SecureString

$Cred = [PSCredential]::New("ftp12146773-pskurs", ("posh2020" | ConvertTo-SecureString -AsPlainText -Force))

# Schritt 2: Download der Zip-Datei über wget

wget -uri ftp://wp12146773.server-he.de/posh/PoshFolien.zip -Credential $Cred -OutFile Folien.zip

# Fragen
# Was ist wget?
# Warum ist die Adresse so lang??
# Wer benutzt noch Ftp???
# Gibt es die Folien auch auf einem einfacheren Weg????

# Die Antwort auf alle Fragen:
# Es ist in erster Linie eine Übung zum Kennenlernen der PowerShell-Schreibweise
# Und: Wer sich auf die Befehlszeile einlässt, verlässt die vertraute Komfortzone
