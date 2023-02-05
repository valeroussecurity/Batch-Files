@echo off
Title Clear Print Spooler
:line1
NET STOP Spooler
Del /F /S /Q %systemroot%\System32\spool\PRINTERS\*
NET START Spooler
timeout /t 3