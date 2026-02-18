# ============================================================
# Script 4: Search-Users.ps1
# Purpose : Search and filter SmartTech users by department
# ============================================================

$csvPath = "C:\LabExercise\employees.csv"

Write-Host "`n===== SmartTech Solutions - Search Tool =====" -ForegroundColor Cyan
Write-Host "`nSearch Options:"
Write-Host "  1 - Search by Department"
Write-Host "  2 - Search by Username"
Write-Host "  3 - Show ALL users with live status"
Write-Host "  4 - Show department statistics"
$choice = Read-Host "`nEnter your choice (1/2/3/4)"

$employees = Import-Csv -Path $csvPath

function Show-UserInfo($emp) {
    $user = Get-LocalUser -Name $emp.Username -ErrorAction SilentlyContinue
    if ($user) {
        $enabledText = if ($user.Enabled) { "ENABLED" } else { "DISABLED" }
        $color       = if ($user.Enabled) { "Green"   } else { "Red"     }
        Write-Host ("  {0,-22} {1,-18} {2,-12} {3,-30} [{4}]" -f `
            $emp.FullName, $emp.Username, $emp.Department, $emp.JobTitle, $enabledText) `
            -ForegroundColor $color
    } else {
        Write-Host "  $($emp.Username) - Account not found on this machine" -ForegroundColor DarkGray
    }
}

switch ($choice) {

    "1" {
        Write-Host "`nAvailable Departments: Development, Marketing, Finance, Support"
        $dept = Read-Host "Enter department name"

        $filtered = $employees | Where-Object { $_.Department -ieq $dept }

        if ($filtered.Count -eq 0) {
            Write-Host "No employees found in department: $dept" -ForegroundColor Yellow
        } else {
            Write-Host "`n--- $dept Department ($($filtered.Count) employees) ---" -ForegroundColor Cyan
            Write-Host ("  {0,-22} {1,-18} {2,-12} {3,-30} [STATUS]" -f "Full Name","Username","Department","Job Title")
            Write-Host "  " + ("-" * 95)
            foreach ($emp in $filtered) { Show-UserInfo $emp }
        }
    }

    "2" {
        $uname = Read-Host "Enter username to search"
        $found = $employees | Where-Object { $_.Username -ieq $uname }
        if ($found) {
            Write-Host "`n--- Search Result ---" -ForegroundColor Cyan
            Show-UserInfo $found
        } else {
            Write-Host "Username '$uname' not found in employee list." -ForegroundColor Yellow
        }
    }

    "3" {
        Write-Host "`n--- All SmartTech Employees ---" -ForegroundColor Cyan
        Write-Host ("  {0,-22} {1,-18} {2,-12} {3,-30} [STATUS]" -f "Full Name","Username","Department","Job Title")
        Write-Host "  " + ("-" * 95)
        foreach ($emp in $employees) { Show-UserInfo $emp }
    }

    "4" {
        Write-Host "`n--- Department Statistics ---" -ForegroundColor Cyan
        $departments = $employees | Select-Object -ExpandProperty Department -Unique

        foreach ($dept in $departments) {
            $deptEmps   = $employees | Where-Object { $_.Department -eq $dept }
            $enabledCount  = 0
            $disabledCount = 0

            foreach ($emp in $deptEmps) {
                $user = Get-LocalUser -Name $emp.Username -ErrorAction SilentlyContinue
                if ($user) {
                    if ($user.Enabled) { $enabledCount++ } else { $disabledCount++ }
                }
            }

            Write-Host "`n  $dept Department" -ForegroundColor Yellow
            Write-Host "    Total Employees : $($deptEmps.Count)"
            Write-Host "    Enabled Accounts: $enabledCount" -ForegroundColor Green
            Write-Host "    Disabled Accounts: $disabledCount" -ForegroundColor Red
        }
    }

    default {
        Write-Host "Invalid choice." -ForegroundColor Red
    }
}

Write-Host ""
