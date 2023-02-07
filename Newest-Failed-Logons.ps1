Try {
Get-EventLog -LogName Security -InstanceId 4625 -Newest 100
}Catch{
$_.Exception
}
Pause