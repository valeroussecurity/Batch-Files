@echo off
cls
echo,
color 0A
Title Tune Up
setlocal
:line1
echo ********************************************************************
echo * PLEASE ENSURE "_TUNE UP" FOLDER IS IN THE ROOT FOLDER OF THE C:\ *
echo *   DRIVE AND THAR YOU ARE RUNNING THIS FILE AS AN ADMINISTRATOR!  *
echo ********************************************************************
echo.
choice /C a /N /M "Press A to Continue."
goto disclaimer
endlocal


:disclaimer
cls
setlocal
echo                     **** Tune Up Batch File *****
echo  ************************** DISCLAIMER ***********************************
echo  * This tune-up batch wipes temp files, local stores, etc., and will     *
echo  * install 3rd party software onto your computer. If it does something   *
echo  * that you didn't expect and you didn't read this disclaimer, it still  *
echo  * falls under your responsibility.                                      *
echo  *                                                                       *
echo  * All 3rd-party tools used by this batch file ^(MBAM, ADWCleaner, etc.,^) *
echo  * are bound to their respective licenses. It is your responsibility to  *
echo  * determine if you have the rights to use these programs within         *
echo  * whatever environment you may be in. Please note that this batch file  *
echo  * has been tested within a Windows 10 environment. I cannot guarantee   *
echo  * the script's reliability in older or newer Windows operating systems. *
echo  *                                                                       *
echo  * By running this batch, you accept the full burden for anything that   *
echo  * may occur. There are no warranties or guarantees, you are running     *
echo  * this tool at your own risk. Anything that may occur whether positive  *
echo  * or negative, is your responsibility. I, the original creator of this  *
echo  * script, am not liable for anything that transpires as a result of     *
echo  * your decision to run this file.                                       *
echo  *************************************************************************
echo.
echo By typing "I AGREE", you acknowledge that you have read and agreed to this disclaimer.
echo The batch file will start with the tune up process upon responding. Close out if you do not agree.
echo.


:terms_prompt
set /p choice= Response:
echo %choice%|findstr /i "\<I AGREE\>">nul && goto tune|| echo You must type I AGREE to continue&& goto terms_prompt
endlocal


:tune
cls
echo **************** Running Tools ****************
echo *** Installing Malwarebytes, SuperAntiSpyware, and Spybot
start "" "C:\_TUNE UP\Programs\Ninite.exe"
echo *** Clearing Temp files, browser cache and cookies, emptying recycle bin
call "C:\_TUNE UP\Programs\BleachBit\bleach.bat"
echo.
echo.
echo.
echo.
echo.
echo *** Patching outdated software
"C:\_TUNE UP\Programs\PatchMyPC.exe" /s
echo.
echo *** Running junkware and adware removal tool
"C:\_TUNE UP\Programs\AdwCleaner.exe" /eula /clean /noreboot
echo.
echo *** Removing any potential rootkits
"C:\_TUNE UP\Programs\tdsskiller.exe" -silent -accepteula -dcexact -tdlfs
echo.
echo *** Restoring Windows Health - This may take some time
DISM /Online /Cleanup-Image /RestoreHealth
echo.
echo *** Scanning for OS corruption - This may take some time
sfc /scannow
echo.
echo *** Reparing potential network issues
ipconfig /release
ipconfig /renew
ipconfig /flushdns
echo.
echo.
echo.
echo Verify that NiNite is done installing software, then hit any key to continue
pause

echo ************* Running Manual Input Tools *************
echo ---These tools require manual input. Please see instructions below---
echo
start "" "C:\Program Files\Malwarebytes\Anti-Malware\mbam.exe"
echo ********************** MALWARE BYTES INSTRUCTIONS *********************** 
echo * - If it prompts you to upgrade to the premium edition, disregard.     *
echo * - Under "Scanner" section (bottom middle), click "Scan". Wait for     *
echo * scan to finish. If it asks to reboot the PC- IGNORE IT!               *
echo *                               ABOUT:                                  *
echo * This program will scan for malware and Potentially Unwanted Programs  *
echo * (PUPs).                                                               *
echo *************************************************************************
echo.
echo.
start "" "C:\Program Files\SUPERAntiSpyware\SUPERAntiSpyware.exe"
echo ******************** SUPER ANTI SPYWARE INSTRUCTIONS ********************
echo * - If it prompts you to upgrade to the premium edition, disregard.     *
echo * - Towards the bottom right of the program (above the ads), locate the *
echo * word "Database". Right under that, select "Click here to check for    *
echo * updates. Even if it takes some time, let the updates finish.          *
echo * - In the upper right section, select the box that says "Scan This     *
echo * Computer."                                                            *
echo * - On the new page, select "Complete Scan" IF you have time. If you    *
echo * already feel that the scans have taken long enough, select "Quick     *
echo * Scan" instead.                                                        *
echo * - If a new page comes up displaying "Potentially Unwanted Programs",  *
echo * Review items. If they are not needed for the employee to do their job,*
echo * Remove the item/s.                                                    *
echo *                               ABOUT:                                  *
echo * This program will scan for malware and Potentially Unwanted Programs  *
echo * (PUPs).                                                               *
echo *************************************************************************
echo.
echo.
echo ********************** TASK MANAGER INSTRUCTIONS ************************
echo * - Please navigate to the Startup tab.                                 *
echo *    - If startup tab is not showing, select the "more details" button  *
echo *      in the bottom left corner of the program. New tabs including     *
echo *      Startup will appear.                                             *
echo * - Disable ALL Programs listed EXCEPT for OneDrive (or any other app   *
echo * that the teacher needs when the computer restarts).                   *
echo *                                                                       *
echo *   CLOSE OUT OF TASK MANAGER WHEN FINISHED TO CONTINUE RUNNING THIS    *
echo *                              SCRIPT!!!                                *
echo *************************************************************************
taskmgr.exe
echo.
echo.
echo.
echo Verify MalwareBytes and Super Anti Spyware are finished scanning and/or
echo removing items. Once they are done, close out of them. Press any key on
echo this command prompt to begin the cleanup process including uninstalling
echo programs that this batch installed.
pause

echo *** Removing MalwareBytes
"%ProgramFiles%\Malwarebytes\Anti-Malware\mbuns.exe" /VERYSILENT /NORESTART /NOSURVEY
echo.
echo *** Removing Super Anti Spyware - Please confirm on pop-up window to uninstall.
"%ProgramFiles%\SUPERAntiSpyware\Uninstall.exe"
echo.
echo *** Cleaning up left over logs...
del C:\T*.txt /F
rmdir /s C:\AdwCleaner /q
echo.
echo.
echo.
echo ***** FINISHED *****
echo Press any key past this point and this batch file will restart the computer.
echo Exit command prompt if you do not want to initiate a restart at this time.
pause
shutdown -r -t 60