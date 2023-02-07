Try {
Get-EventLog -LogName Security -InstanceId 4624 -Newest 100
}Catch{
$_.Exception
}
Pause