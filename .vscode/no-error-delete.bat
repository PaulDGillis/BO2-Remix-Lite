if Exist %1 (
    powershell -Command Remove-Item -Force -Recurse %1
)

@REM if Exist "compiled" (
@REM     powershell -Command Remove-Item -Force -Recurse "compiled"
@REM )
@REM if Exist "%localappdata%\Plutonium\storage\t6\scripts\zm\remix" (
@REM     powershell -Command Remove-Item -Force -Recurse "%localappdata%\Plutonium\storage\t6\scripts\zm\remix"
@REM )
@REM if Exist "%localappdata%\Plutonium\storage\t6\scripts\zm\Remix2.gsc" (
@REM     powershell -Command Remove-Item -Force -Recurse "%localappdata%\Plutonium\storage\t6\scripts\zm\Remix2.gsc"
@REM )