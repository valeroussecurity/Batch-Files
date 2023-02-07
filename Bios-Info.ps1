Try {
Get-CimInstance -ClassName Win32_BIOS
}Catch{
$_.Exception
}
Pause