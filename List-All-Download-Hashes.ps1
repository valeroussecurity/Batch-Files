Try {
Get-FileHash -Path C:\Users\*\Downloads\* -Algorithm SHA256
}Catch{
$_.Exception
}
Pause