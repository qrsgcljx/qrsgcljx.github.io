$ErrorActionPreference = "Stop"

$Branch = "main"
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$commitMessage = "blog: update content ($timestamp)"

$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

Write-Host "Checking Git..." -ForegroundColor Yellow
git --version | Out-Null

Write-Host "Staging changes..." -ForegroundColor Yellow
git add .

git diff --cached --quiet
if ($LASTEXITCODE -eq 0) {
    Write-Host "No changes detected. Nothing to publish." -ForegroundColor Cyan
    exit 0
}

Write-Host "Creating commit..." -ForegroundColor Yellow
git commit -m $commitMessage

Write-Host "Pushing to origin/$Branch ..." -ForegroundColor Yellow
git push origin $Branch

Write-Host ""
Write-Host "Publish complete. GitHub Pages is building." -ForegroundColor Green
