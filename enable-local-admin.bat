@echo off
Title Administrator
echo Please ensure you are running this script as an administrator, it will error out if not!
pause
net user Administrator /active:yes
net user Administrator *
pause