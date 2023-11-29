$certname = "your-certname"    ## Replace {certificateName}
$cert = New-SelfSignedCertificate -Subject "CN=$certname" -CertStoreLocation "Cert:\CurrentUser\My" -KeyExportPolicy Exportable -KeySpec Signature -KeyLength 2048 -KeyAlgorithm RSA -HashAlgorithm SHA256 -KeyUsage DigitalSignature, KeyEncipherment -Type SSLServerAuthentication
Export-PfxCertificate -Cert $cert -FilePath "C:\Users\AdamPlater\work\certs\$certname.pfx" -Password (ConvertTo-SecureString -String "abc123" -AsPlainText -Force)
openssl pkcs12 -in "C:\Users\AdamPlater\work\certs\your-certname.pfx" -clcerts -nokeys -out "C:\Users\AdamPlater\work\certs\your-certname.pem"


