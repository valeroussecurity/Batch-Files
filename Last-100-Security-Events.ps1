Try {
Get-EventLog -LogName Security -Newest 100
}Catch{
$_.Exception
}
Pause