$ErrorActionPreference = "Stop"

$Branch = "main"
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$commitMessage = "blog: force rebuild ($timestamp)"

$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

Write-Host "Checking Git..." -ForegroundColor Yellow
git --version | Out-Null
if ($LASTEXITCODE -ne 0) { throw "Git is not available." }

Write-Host "Staging all files..." -ForegroundColor Yellow
git add -A
if ($LASTEXITCODE -ne 0) { throw "git add failed." }

git diff --cached --quiet
if ($LASTEXITCODE -eq 0) {
    Write-Host "No file changes. Creating empty commit to force rebuild..." -ForegroundColor Cyan
    git commit --allow-empty -m $commitMessage
    if ($LASTEXITCODE -ne 0) { throw "git commit --allow-empty failed." }
}
else {
    Write-Host "Changes detected. Creating normal commit..." -ForegroundColor Yellow
    git commit -m $commitMessage
    if ($LASTEXITCODE -ne 0) { throw "git commit failed." }
}

Write-Host "Pushing to origin/$Branch ..." -ForegroundColor Yellow
git push -u origin HEAD:$Branch
if ($LASTEXITCODE -ne 0) { throw "git push failed." }

Write-Host ""
Write-Host "Force publish complete. GitHub Pages is building." -ForegroundColor Green
