# ============================================================
# Script 3: Manage-Accounts.ps1
# Purpose : Disable or Enable a specific user account
# Usage   : Run the script, follow on-screen prompts
# ============================================================

Write-Host "`n===== SmartTech Solutions - Account Manager =====" -ForegroundColor Cyan

# ----- Ask the user what action to perform -----
Write-Host "`nWhat would you like to do?"
Write-Host "  1 - Disable an account"
Write-Host "  2 - Enable an account"
Write-Host "  3 - Disable ALL SmartTech lab accounts"
Write-Host "  4 - Enable ALL SmartTech lab accounts"
$choice = Read-Host "`nEnter your choice (1/2/3/4)"

$csvPath = "C:\LabExercise\employees.csv"
$logPath = "C:\LabExercise\Reports\management_log.txt"

# Create Reports folder if missing
if (-not (Test-Path "C:\LabExercise\Reports")) {
    New-Item -ItemType Directory -Path "C:\LabExercise\Reports" | Out-Null
}

function Disable-Account($username) {
    $user = Get-LocalUser -Name $username -ErrorAction SilentlyContinue
    if ($user) {
        Disable-LocalUser -Name $username
        Write-Host "[DISABLED] $username" -ForegroundColor Yellow
        Add-Content -Path $logPath -Value "$(Get-Date) - DISABLED - $username"
    } else {
        Write-Host "[NOT FOUND] $username" -ForegroundColor Red
    }
}

function Enable-Account($username) {
    $user = Get-LocalUser -Name $username -ErrorAction SilentlyContinue
    if ($user) {
        Enable-LocalUser -Name $username
        Write-Host "[ENABLED] $username" -ForegroundColor Green
        Add-Content -Path $logPath -Value "$(Get-Date) - ENABLED  - $username"
    } else {
        Write-Host "[NOT FOUND] $username" -ForegroundColor Red
    }
}

switch ($choice) {

    "1" {
        $username = Read-Host "Enter the username to DISABLE"
        Disable-Account $username
    }

    "2" {
        $username = Read-Host "Enter the username to ENABLE"
        Enable-Account $username
    }

    "3" {
        Write-Host "`nDisabling ALL lab accounts..." -ForegroundColor Yellow
        $employees = Import-Csv -Path $csvPath
        foreach ($emp in $employees) {
            Disable-Account $emp.Username
        }
        Write-Host "`nAll accounts disabled." -ForegroundColor Yellow
    }

    "4" {
        Write-Host "`nEnabling ALL lab accounts..." -ForegroundColor Green
        $employees = Import-Csv -Path $csvPath
        foreach ($emp in $employees) {
            Enable-Account $emp.Username
        }
        Write-Host "`nAll accounts enabled." -ForegroundColor Green
    }

    default {
        Write-Host "Invalid choice. Please run the script again." -ForegroundColor Red
    }
}

Write-Host "`nAction log saved to: $logPath`n" -ForegroundColor Cyan
