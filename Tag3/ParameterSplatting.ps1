<#
 .Synopsis
 Ein Beispiel für Parameter-Splatting
 .Notes
 Send-MailMessage setzt einen funktionierenden SMTP-Dienst voraus, der ohne Authenthifizierung ansprechbar ist
 Tipp: SMTP4Dev - https://github.com/rnwood/smtp4dev/releases/tag/3.1.1-ci2020083104 oder die Version für .NET 2.0
 https://github.com/rnwood/smtp4dev/releases/tag/v2.0.10
#>

$params = @{
    from = "admin@codeclass.local"
    smtpserver = "localhost"
    subject = "Wichtige Nachricht"
    body = "Ich möchte Ihnen mitteilen, dass..."
}

# Der To-Parameter wird ergänzt
Send-MailMessage @params -To user1@codeclass.local -Encoding UTF8
Send-MailMessage @params -To user2@codeclass.local -Encoding UTF8
# Geht nicht: Paramter können zwar ergänzt, aber nicht überschrieben werden
# Send-MailMessage @params -To user3@codeclass.local -Body (Get-Service) 


