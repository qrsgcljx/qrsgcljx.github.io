@echo off
setlocal
cd /d "%~dp0\.."

echo Running one-click publish...
powershell -ExecutionPolicy Bypass -File ".\scripts\publish.ps1"

if errorlevel 1 (
  echo.
  echo Publish failed. Please read the error above.
  pause
  exit /b 1
)

echo.
echo Publish finished.
pause
