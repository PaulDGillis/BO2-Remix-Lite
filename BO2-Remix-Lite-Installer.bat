@echo off
setlocal

:Prompt
echo.
@echo ###############################################################
@echo ############## Remix-Lite Installation Script #################
@echo ###############################################################
SET /P AREYOUSURE=Install Or Uninstall mod (I/[U])?
IF /I "%AREYOUSURE%" EQU "I" (
    Call :INSTALL
    timeout 5
    EXIT /B 0
)
Call :Uninstall 1
timeout 5
EXIT /B 0
endlocal

:INSTALL
Call :UNINSTALL 0
powershell -Command Start-BitsTransfer -Source "https://github.com/PaulDGillis/BO2-Remix-Lite/releases/download/latest/BO2-Remix-Lite.zip"
powershell -Command Expand-Archive -Force -LiteralPath BO2-Remix-Lite.zip -DestinationPath "%localappdata%\Plutonium\storage\t6\scripts\zm"
powershell -Command Remove-Item -Force -Recurse "BO2-Remix-Lite.zip"
echo.
@echo ###############################################################
@echo ############# Remix-Lite Installation Complete ################
@echo ###############################################################
EXIT /B 0

:UNINSTALL
if Exist "%localappdata%\Plutonium\storage\t6\scripts\zm\remix" (
    powershell -Command Remove-Item -Force -Recurse "%localappdata%\Plutonium\storage\t6\scripts\zm\remix"
)
if Exist "%localappdata%\Plutonium\storage\t6\scripts\zm\Remix2.gsc" (
    powershell -Command Remove-Item -Force -Recurse "%localappdata%\Plutonium\storage\t6\scripts\zm\Remix2.gsc"
)
if %~1 == 1 (
    echo.
    @echo ###############################################################
    @echo ############### Remix-Lite Uninstall Complete #################
    @echo ###############################################################
)
EXIT /B 0

end