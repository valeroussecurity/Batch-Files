@echo off
Title Network Connection Info
::Lists all active network connections on the host. Including:
:: Protocol, Local IP w/ port info, Foreign IPs w/ port info, and network state.
netstat -nba
pause