@echo off
Title Clear Print Spooler
::Stops Print Spooler Service, removes items stuck in Spooler, and re-enables Spooler service after.
:line1
NET STOP Spooler
Del /F /S /Q %systemroot%\System32\spool\PRINTERS\*
NET START Spooler
timeout /t 3