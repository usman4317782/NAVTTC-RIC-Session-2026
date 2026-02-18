# ============================================================
# Script 1: Create-Users.ps1
# Purpose : Reads employees.csv and creates local user accounts
# Author  : Student
# Date    : February 2026
# ============================================================

# ----- STEP 1: Set the path to your CSV file -----
$csvPath = "C:\LabExercise\employees.csv"
$logPath = "C:\LabExercise\Reports\creation_log.txt"
$reportPath = "C:\LabExercise\Reports\creation_report.csv"

# Create Reports folder if it does not exist
if (-not (Test-Path "C:\LabExercise\Reports")) {
    New-Item -ItemType Directory -Path "C:\LabExercise\Reports" | Out-Null
}

# ----- STEP 2: Set a default password for all new users -----
$defaultPassword = ConvertTo-SecureString "SmartTech@2026" -AsPlainText -Force

# ----- STEP 3: Prepare an array to collect results -----
$results = @()

# ----- STEP 4: Read the CSV file -----
Write-Host "`n===== SmartTech Solutions - User Creation Script =====" -ForegroundColor Cyan
Write-Host "Reading employee data from: $csvPath`n" -ForegroundColor Yellow

$employees = Import-Csv -Path $csvPath

# ----- STEP 5: Loop through each employee and create account -----
foreach ($emp in $employees) {

    $status = ""
    $message = ""

    try {
        # Check if the user already exists
        $existing = Get-LocalUser -Name $emp.Username -ErrorAction SilentlyContinue

        if ($existing) {
            $status = "SKIPPED"
            $message = "User already exists"
            Write-Host "[SKIPPED]  $($emp.Username) - already exists" -ForegroundColor Yellow
        }
        else {
            # Create the new local user
            New-LocalUser `
                -Name $emp.Username `
                -FullName $emp.FullName `
                -Description "$($emp.JobTitle) - $($emp.Department)" `
                -Password $defaultPassword | Out-Null

            $status = "SUCCESS"
            $message = "Account created successfully"
            Write-Host "[SUCCESS]  $($emp.Username) ($($emp.FullName)) - $($emp.Department)" -ForegroundColor Green
        }
    }
    catch {
        $status = "FAILED"
        $message = $_.Exception.Message
        Write-Host "[FAILED]   $($emp.Username) - $message" -ForegroundColor Red
    }

    # Store result for report
    $results += [PSCustomObject]@{
        FullName   = $emp.FullName
        Username   = $emp.Username
        Department = $emp.Department
        JobTitle   = $emp.JobTitle
        Status     = $status
        Message    = $message
        Timestamp  = (Get-Date -Format "yyyy-MM-dd HH:mm:ss")
    }
}

# ----- STEP 6: Export the creation report to CSV -----
$results | Export-Csv -Path $reportPath -NoTypeInformation
Write-Host "`nReport saved to: $reportPath" -ForegroundColor Cyan

# ----- STEP 7: Write a simple log file -----
$logLines = @()
$logLines += "=========================================="
$logLines += "User Creation Log - $(Get-Date)"
$logLines += "=========================================="
foreach ($r in $results) {
    $logLines += "[$($r.Timestamp)] $($r.Status) - $($r.Username) | $($r.Department) | $($r.Message)"
}
$logLines | Out-File -FilePath $logPath -Encoding UTF8

Write-Host "Log saved to   : $logPath" -ForegroundColor Cyan

# ----- STEP 8: Show a summary -----
$success = ($results | Where-Object { $_.Status -eq "SUCCESS" }).Count
$skipped = ($results | Where-Object { $_.Status -eq "SKIPPED" }).Count
$failed  = ($results | Where-Object { $_.Status -eq "FAILED"  }).Count

Write-Host "`n===== SUMMARY =====" -ForegroundColor Cyan
Write-Host "Total Employees : $($employees.Count)" -ForegroundColor White
Write-Host "Created         : $success" -ForegroundColor Green
Write-Host "Skipped         : $skipped" -ForegroundColor Yellow
Write-Host "Failed          : $failed"  -ForegroundColor Red
Write-Host "===================`n" -ForegroundColor Cyan
