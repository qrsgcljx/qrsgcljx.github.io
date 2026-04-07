$ErrorActionPreference = "Stop"

function ConvertTo-Slug {
    param(
        [Parameter(Mandatory = $true)]
        [string]$InputText
    )

    $slug = $InputText.ToLowerInvariant()
    $slug = $slug -replace "[^a-z0-9\s-]", ""
    $slug = $slug -replace "\s+", "-"
    $slug = $slug -replace "-{2,}", "-"
    $slug = $slug.Trim("-")

    if ([string]::IsNullOrWhiteSpace($slug)) {
        $slug = "new-post"
    }

    return $slug
}

$root = Split-Path -Parent $PSScriptRoot
$postsDir = Join-Path $root "_posts"
$templatePath = Join-Path $root "templates/post-template.md"

if (-not (Test-Path $postsDir)) {
    throw "Cannot find _posts directory: $postsDir"
}

$title = Read-Host "Title"
if ([string]::IsNullOrWhiteSpace($title)) {
    throw "Title cannot be empty."
}

$tagsInput = Read-Host "Tags (comma separated, optional)"
$excerptInput = Read-Host "Excerpt (optional)"
$authorInput = Read-Host "Author (optional, default: Embedded Developer)"

if ([string]::IsNullOrWhiteSpace($authorInput)) {
    $authorInput = "Embedded Developer"
}

$dateText = Get-Date -Format "yyyy-MM-dd"
$slug = ConvertTo-Slug -InputText $title
$fileName = "$dateText-$slug.md"
$targetPath = Join-Path $postsDir $fileName

if (Test-Path $targetPath) {
    throw "File already exists: $targetPath"
}

$tags = @()
if (-not [string]::IsNullOrWhiteSpace($tagsInput)) {
    $tags = $tagsInput.Split(",") | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne "" }
}

$tagsLine = "[]"
if ($tags.Count -gt 0) {
    $tagsLine = "[" + (($tags | ForEach-Object { "'$_'" }) -join ", ") + "]"
}

$excerpt = $excerptInput
if ([string]::IsNullOrWhiteSpace($excerpt)) {
    $excerpt = "Please add an excerpt."
}

$template = ""
if (Test-Path $templatePath) {
    $template = Get-Content -Path $templatePath -Raw -Encoding UTF8
}
else {
    $template = @"
---
title: {{TITLE}}
date: {{DATE}}
author: {{AUTHOR}}
tags: {{TAGS}}
excerpt: {{EXCERPT}}
---

# {{TITLE}}

Start writing your post here.
"@
}

$content = $template
$content = $content.Replace("{{TITLE}}", $title)
$content = $content.Replace("{{DATE}}", $dateText)
$content = $content.Replace("{{AUTHOR}}", $authorInput)
$content = $content.Replace("{{TAGS}}", $tagsLine)
$content = $content.Replace("{{EXCERPT}}", $excerpt)

Set-Content -Path $targetPath -Value $content -Encoding UTF8

Write-Host ""
Write-Host "Post created:" -ForegroundColor Green
Write-Host $targetPath -ForegroundColor Cyan
