@echo off
echo Beat some common sense into Cygwin and properly integrate .sh and .bash files
echo into Windows Explorer
echo -------------------------------------------------------------------------------
echo.
echo Run this batch file AFTER you installed Cygwin into "%CYGWIN_HOME%" and BEFORE you
echo run the Cygwin Bash Shell for the first time.
echo.
echo It will tell Cygwin to use the current user's ACLs when accessing/modifying 
echo files instead of the weird Windows/Unix ACL mix-up it usually deems appropriate
echo for whatever reasons.
echo.
echo Additionally, this script will register .sh and .bash files as "bashscript" and
echo make them executable by double click or drag^&drop from Windows Explorer. It
echo will also assign a custom icon to those file types.
echo.
rem pause
:: Retrieve the path where this script is located
SET var_path=%~dp0
SET var_path=%var_path:~0,-1%
:: Check for mandatory files and folders
if not exist "%var_path%\finish_cygwin_installation\cygwin-shell-script.ico" goto FILESMISSINGERROR
if not exist "%var_path%\finish_cygwin_installation\argshandler.sh" goto FILESMISSINGERROR
rem if not exist "%var_path%\finish_cygwin_installation\etc\fstab" goto FILESMISSINGERROR
if not exist %CYGWIN%\etc goto CYGDIRERROR
if not exist %CYGWIN%\bin\sed.exe goto SEDMISSINGERROR
:: Start working
echo Replacing/copying Cygwin files...
xcopy /E /C /I /H /R /K /Y "%var_path%\finish_cygwin_installation\*" "%CYGWIN%\"
echo.
echo Registering .sh and .bash files as "bashscript"...
assoc .sh=bashscript
assoc .bash=bashscript
echo.
echo Setting the run command for the file type "bashscript"...
rem select console
set CON=%CYGWIN%\bin\mintty.exe %CYGWIN%\bin\bash.exe -c
if "%1" == "cmd" set CON=%CYGWIN%\bin\bash.exe --login -i -c
rem set file association
ftype bashscript=%CON% 'cd "$(dirname "$(/argshandler.sh "%%1")")"; bash "$(/argshandler.sh "%%1")" "$(/argshandler.sh "%%2")" "$(/argshandler.sh "%%3")" "$(/argshandler.sh "%%4")" "$(/argshandler.sh "%%5")" "$(/argshandler.sh "%%6")" "$(/argshandler.sh "%%7")" "$(/argshandler.sh "%%8")" "$(/argshandler.sh "%%9")"'
echo.
echo Activating the drag^&drop capability for "bashscript" files (up to 8 items are
echo supported)...
reg add HKEY_CLASSES_ROOT\bashscript\shellex\DropHandler /v "" /t REG_SZ /d "{60254CA5-953B-11CF-8C96-00AA00B8708C}" /f
echo.
echo Registering the custom icon for the file type "bashscript"...
reg add HKEY_CLASSES_ROOT\bashscript\DefaultIcon /v "" /t REG_SZ /d "%CYGWIN%\cygwin-shell-script.ico,0" /f
echo.
echo Finished.
pause
exit /b
:: Error handlers
:FILESMISSINGERROR
echo ERROR:
echo Some necessary files in the folder
echo %var_path%\finish_cygwin_installation
echo or the folder itself are missing.
echo.
echo Cannot continue.
echo.
pause
exit /b 1
:CYGDIRERROR
echo Cygwin does not seem to be installed in
echo %CYGWIN%
echo.
echo Cannot continue.
echo.
pause
exit /b 1
:SEDMISSINGERROR
echo The Windows Explorer integration helper script requires the stream editor "sed"
echo to be installed. However, the file
echo %CYGWIN%\bin\sed.exe
echo could not be found.
echo.
echo Install "sed" using the Cygwin installer and run this script again.
echo.
echo Cannot continue.
echo.
pause
exit /b 1
