$ErrorActionPreference = "Stop"

$Branch = "main"
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$commitMessage = "blog: force rebuild ($timestamp)"

$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

Write-Host "Checking Git..." -ForegroundColor Yellow
git --version | Out-Null

Write-Host "Staging all files..." -ForegroundColor Yellow
git add -A

git diff --cached --quiet
if ($LASTEXITCODE -eq 0) {
    Write-Host "No file changes. Creating empty commit to force rebuild..." -ForegroundColor Cyan
    git commit --allow-empty -m $commitMessage
}
else {
    Write-Host "Changes detected. Creating normal commit..." -ForegroundColor Yellow
    git commit -m $commitMessage
}

Write-Host "Pushing to origin/$Branch ..." -ForegroundColor Yellow
git push origin $Branch

Write-Host ""
Write-Host "Force publish complete. GitHub Pages is building." -ForegroundColor Green
