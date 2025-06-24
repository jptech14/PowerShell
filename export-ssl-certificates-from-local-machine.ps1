# Export SSL Certificate Details from Local Machine Store
$certs = Get-ChildItem -Path Cert:\LocalMachine\My

$certDetails = foreach ($cert in $certs) {
    [PSCustomObject]@{
        Subject        = $cert.Subject
        Issuer         = $cert.Issuer
        Thumbprint     = $cert.Thumbprint
        NotBefore      = $cert.NotBefore
        NotAfter       = $cert.NotAfter
        FriendlyName   = $cert.FriendlyName
        SerialNumber   = $cert.SerialNumber
        SignatureAlgo  = $cert.SignatureAlgorithm.FriendlyName
        PublicKeyAlgo  = $cert.PublicKey.Key.Algorithm
    }
}

# Export to CSV
$certDetails | Export-Csv -Path "C:\SSL_Certificate_Details.csv" -NoTypeInformation

Write-Output "Certificate details exported to C:\SSL_Certificate_Details.csv"
