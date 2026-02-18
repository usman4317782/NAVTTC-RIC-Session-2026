# ============================================================
# Script 2: Generate-Report.ps1
# Purpose : Shows detailed info about all SmartTech lab users
# ============================================================

$csvPath    = "C:\LabExercise\employees.csv"
$reportPath = "C:\LabExercise\Reports\detailed_report.csv"

# Create Reports folder if missing
if (-not (Test-Path "C:\LabExercise\Reports")) {
    New-Item -ItemType Directory -Path "C:\LabExercise\Reports" | Out-Null
}

Write-Host "`n===== SmartTech Solutions - Detailed User Report =====" -ForegroundColor Cyan

# Read the employee list from CSV
$employees = Import-Csv -Path $csvPath

$reportData = @()

foreach ($emp in $employees) {

    # Try to get the local user account
    $user = Get-LocalUser -Name $emp.Username -ErrorAction SilentlyContinue

    if ($user) {
        $reportData += [PSCustomObject]@{
            FullName        = $emp.FullName
            Username        = $emp.Username
            Department      = $emp.Department
            JobTitle        = $emp.JobTitle
            AccountEnabled  = $user.Enabled
            PasswordExpires = $user.PasswordExpires
            LastLogon       = $user.LastLogon
            Description     = $user.Description
            AccountExists   = "YES"
        }

        # Show on screen
        $statusColor = if ($user.Enabled) { "Green" } else { "Red" }
        $enabledText = if ($user.Enabled) { "ENABLED" } else { "DISABLED" }
        Write-Host ("  {0,-20} {1,-15} {2,-12} [{3}]" -f $emp.FullName, $emp.Username, $emp.Department, $enabledText) -ForegroundColor $statusColor
    }
    else {
        $reportData += [PSCustomObject]@{
            FullName        = $emp.FullName
            Username        = $emp.Username
            Department      = $emp.Department
            JobTitle        = $emp.JobTitle
            AccountEnabled  = "N/A"
            PasswordExpires = "N/A"
            LastLogon       = "N/A"
            Description     = "N/A"
            AccountExists   = "NO"
        }
        Write-Host "  $($emp.Username) - NOT FOUND on this machine" -ForegroundColor Yellow
    }
}

# Export to CSV
$reportData | Export-Csv -Path $reportPath -NoTypeInformation
Write-Host "`nDetailed report saved to: $reportPath" -ForegroundColor Cyan

# Quick stats
$total    = $reportData.Count
$existing = ($reportData | Where-Object { $_.AccountExists -eq "YES" }).Count
$enabled  = ($reportData | Where-Object { $_.AccountEnabled -eq $true }).Count
$disabled = ($reportData | Where-Object { $_.AccountEnabled -eq $false }).Count

Write-Host "`n===== ACCOUNT STATISTICS =====" -ForegroundColor Cyan
Write-Host "Total in CSV    : $total"
Write-Host "Accounts Found  : $existing"
Write-Host "Enabled         : $enabled" -ForegroundColor Green
Write-Host "Disabled        : $disabled" -ForegroundColor Red
Write-Host "==============================`n" -ForegroundColor Cyan
