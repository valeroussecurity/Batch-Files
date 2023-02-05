@echo off
Title Grab Hard Drive Serial/s
wmic path win32_physicalmedia get SerialNumber
pause