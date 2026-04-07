$ErrorActionPreference = "Stop"

$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$commitMessage = "blog: update content ($timestamp)"

$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

Write-Host "Checking Git..." -ForegroundColor Yellow
git --version | Out-Null
if ($LASTEXITCODE -ne 0) { throw "Git is not available." }

$Branch = (git branch --show-current).Trim()
if ([string]::IsNullOrWhiteSpace($Branch)) {
    throw "Cannot detect current branch."
}

Write-Host "Staging changes..." -ForegroundColor Yellow
git add .
if ($LASTEXITCODE -ne 0) { throw "git add failed." }

git diff --cached --quiet
if ($LASTEXITCODE -eq 0) {
    Write-Host "No changes detected. Nothing to publish." -ForegroundColor Cyan
    exit 0
}

Write-Host "Creating commit..." -ForegroundColor Yellow
git commit -m $commitMessage
if ($LASTEXITCODE -ne 0) { throw "git commit failed." }

Write-Host "Pushing to origin/$Branch ..." -ForegroundColor Yellow
git push -u origin $Branch
if ($LASTEXITCODE -ne 0) { throw "git push failed." }

Write-Host ""
Write-Host "Publish complete. GitHub Pages is building." -ForegroundColor Green
