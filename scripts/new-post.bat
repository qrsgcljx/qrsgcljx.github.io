@echo off
setlocal
cd /d "%~dp0\.."

echo Running new post wizard...
powershell -ExecutionPolicy Bypass -File ".\scripts\new-post.ps1"

if errorlevel 1 (
  echo.
  echo New post creation failed. Please read the error above.
  pause
  exit /b 1
)

echo.
echo New post file created successfully.
pause
