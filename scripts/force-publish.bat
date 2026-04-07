@echo off
setlocal
cd /d "%~dp0\.."

echo Running force publish...
powershell -ExecutionPolicy Bypass -File ".\scripts\force-publish.ps1"

if errorlevel 1 (
  echo.
  echo Force publish failed. Please read the error above.
  pause
  exit /b 1
)

echo.
echo Force publish finished.
pause
