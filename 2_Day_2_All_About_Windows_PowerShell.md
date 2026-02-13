# Windows PowerShell - Complete Reference Guide
## From Basics to Advanced System Administration

**Target:** Windows Server 2019 & IT Infrastructure Management  
**Version:** PowerShell 5.1+  
**Updated:** February 2026

---

# Table of Contents

1. [Introduction to PowerShell](#1-introduction-to-powershell)
2. [Getting Started](#2-getting-started)
3. [Core PowerShell Concepts](#3-core-powershell-concepts)
4. [Basic Commands & Navigation](#4-basic-commands--navigation)
5. [Working with Files and Folders](#5-working-with-files-and-folders)
6. [Variables and Data Types](#6-variables-and-data-types)
7. [Operators and Expressions](#7-operators-and-expressions)
8. [Control Flow Structures](#8-control-flow-structures)
9. [Functions and Script Blocks](#9-functions-and-script-blocks)
10. [Error Handling](#10-error-handling)
11. [PowerShell Remoting](#11-powershell-remoting)
12. [Working with Objects](#12-working-with-objects)
13. [Modules and Package Management](#13-modules-and-package-management)
14. [Working with Services](#14-working-with-services)
15. [Managing Processes](#15-managing-processes)
16. [Registry Operations](#16-registry-operations)
17. [Network Management](#17-network-management)
18. [User and Group Management](#18-user-and-group-management)
19. [Scheduled Tasks](#19-scheduled-tasks)
20. [Event Logs](#20-event-logs)
21. [Advanced Scripting Techniques](#21-advanced-scripting-techniques)
22. [Active Directory Management](#22-active-directory-management)
23. [Disk and Storage Management](#23-disk-and-storage-management)
24. [Performance Monitoring](#24-performance-monitoring)
25. [Security and Best Practices](#25-security-and-best-practices)

---

# 1. Introduction to PowerShell

## 1.1 What is PowerShell?

PowerShell is Microsoft's task automation and configuration management framework consisting of:
- **Command-line shell**: Interactive environment for executing commands
- **Scripting language**: Built on .NET Framework for complex automation
- **Configuration management**: Tools for system configuration and management

### Key Features:
- **Object-oriented pipeline**: Passes objects, not text
- **.NET Integration**: Direct access to .NET Framework
- **Consistent syntax**: Verb-Noun naming convention
- **Extensible**: Modules, snap-ins, and providers
- **Built-in help**: Comprehensive documentation
- **Remote management**: Built-in remoting capabilities

## 1.2 PowerShell vs Command Prompt

| Feature | CMD | PowerShell |
|---------|-----|------------|
| Output Type | Text | Objects |
| Scripting | Batch files | Full language |
| Piping | Text | Objects |
| Remote Management | Limited | Native |
| Extensibility | None | Modules/Snap-ins |
| Complexity | Simple | Powerful |

## 1.3 PowerShell Versions

- **PowerShell 1.0** (2006): Initial release
- **PowerShell 2.0** (2009): Remoting, modules, background jobs
- **PowerShell 3.0** (2012): Workflows, improved modules
- **PowerShell 4.0** (2013): Desired State Configuration (DSC)
- **PowerShell 5.0** (2016): Classes, package management
- **PowerShell 5.1** (2017): Included in Windows Server 2019
- **PowerShell 7.x** (2020+): Cross-platform PowerShell Core

**Windows Server 2019 uses PowerShell 5.1 by default**

## 1.4 Why Learn PowerShell for System Administration?

### Critical Benefits:
1. **Automation**: Eliminate repetitive manual tasks
2. **Efficiency**: Manage hundreds of servers simultaneously
3. **Consistency**: Standardize configurations across infrastructure
4. **Remote Management**: Control servers without physical access
5. **Integration**: Works with AD, Exchange, SQL Server, Azure, etc.
6. **Career Value**: Required skill for Windows administrators

### Real-World Applications:
- User provisioning/deprovisioning
- Server configuration and deployment
- Security auditing and compliance
- Backup and disaster recovery
- Performance monitoring and reporting
- Patch management
- Network configuration
- Troubleshooting and diagnostics

---

# 2. Getting Started

## 2.1 Opening PowerShell

### Method 1: Start Menu
**Steps:**
1. Press `Windows` key
2. Type `PowerShell`
3. Choose:
   - **Windows PowerShell**: Normal user
   - **Windows PowerShell (Admin)**: Administrator

**When to use Admin:**
- System modifications
- Service management
- Software installation
- Execution policy changes
- Most server administration tasks

### Method 2: Run Dialog
**Steps:**
1. Press `Win + R`
2. Type `powershell`
3. Press `Enter` (normal) or `Ctrl + Shift + Enter` (admin)

### Method 3: Windows Terminal (Windows 10/11/Server 2019+)
**Steps:**
1. Install Windows Terminal from Microsoft Store (optional)
2. Launch Windows Terminal
3. Select PowerShell profile

### Method 4: Context Menu
**Steps:**
1. Right-click Start button
2. Select **Windows PowerShell** or **Windows PowerShell (Admin)**

### Method 5: File Explorer
**Steps:**
1. Navigate to any folder in File Explorer
2. Click address bar
3. Type `powershell` and press `Enter`
   - Opens PowerShell in that directory

## 2.2 PowerShell ISE (Integrated Scripting Environment)

### What is PowerShell ISE?
Graphical PowerShell environment with:
- Script editor with syntax highlighting
- Debugging capabilities
- Intellisense/auto-completion
- Multi-tab interface
- Command explorer pane

### Opening ISE:
```powershell
# Method 1: Run dialog
Win + R → Type "powershell_ise" → Enter

# Method 2: From PowerShell
ise

# Method 3: Start Menu
Start → Type "PowerShell ISE"
```

### ISE Layout:
- **Script Pane** (Top): Write and edit scripts
- **Console Pane** (Bottom): Interactive commands
- **Command Add-on** (Right): Browse commands
- **Menu Bar**: File, Edit, View, Tools, Debug, Add-ons, Help

### ISE Shortcuts:
```
F5          - Run script
F8          - Run selection
F9          - Set/Remove breakpoint
F10         - Step Over
F11         - Step Into
Shift+F11   - Step Out
Ctrl+N      - New script
Ctrl+O      - Open script
Ctrl+S      - Save script
```

### Creating Your First Script in ISE:
**Step-by-step:**
```powershell
# 1. Open ISE as Administrator
# 2. In Script Pane, type:
Write-Host "Hello, PowerShell!" -ForegroundColor Green
Get-Date
$env:COMPUTERNAME

# 3. Save: File → Save As → C:\Scripts\MyFirstScript.ps1
# 4. Run: Press F5
# 5. Observe output in Console Pane
```

## 2.3 Checking PowerShell Version

### View Complete Version Information:
```powershell
$PSVersionTable
```

**Output:**
```
Name                           Value
----                           -----
PSVersion                      5.1.19041.4648
PSEdition                      Desktop
PSCompatibleVersions           {1.0, 2.0, 3.0, 4.0...}
BuildVersion                   10.0.19041.4648
CLRVersion                     4.0.30319.42000
WSManStackVersion              3.0
PSRemotingProtocolVersion      2.3
SerializationVersion           1.1.0.1
```

### Key Properties Explained:
- **PSVersion**: PowerShell version number
- **PSEdition**: Desktop (Windows PS) or Core (PS 6+)
- **CLRVersion**: .NET Common Language Runtime version
- **WSManStackVersion**: WS-Management protocol version
- **PSRemotingProtocolVersion**: Remoting capabilities version

### Check Specific Version:
```powershell
$PSVersionTable.PSVersion

# Output:
# Major  Minor  Build  Revision
# -----  -----  -----  --------
# 5      1      19041  4648
```

### Check Edition:
```powershell
$PSVersionTable.PSEdition
# Output: Desktop or Core
```

## 2.4 Execution Policy

### What is Execution Policy?
Security feature controlling script execution conditions. **NOT a security boundary** but prevents accidental script execution.

### Execution Policy Levels:

| Policy | Description | When to Use |
|--------|-------------|-------------|
| **Restricted** | No scripts run. Interactive only. | Default on clients |
| **AllSigned** | Only signed scripts by trusted publisher | High security environments |
| **RemoteSigned** | Downloaded scripts must be signed | **Recommended for admins** |
| **Unrestricted** | All scripts run with warnings | Development machines |
| **Bypass** | Nothing blocked, no warnings | Automation/CI/CD |
| **Undefined** | No policy set | Inherits from parent scope |

### Check Current Policy:
```powershell
Get-ExecutionPolicy
```

### Check All Scopes:
```powershell
Get-ExecutionPolicy -List
```

**Output:**
```
Scope          ExecutionPolicy
-----          ---------------
MachinePolicy  Undefined
UserPolicy     Undefined
Process        Undefined
CurrentUser    RemoteSigned
LocalMachine   Restricted
```

### Execution Policy Scopes:

**Priority Order (highest to lowest):**
1. **MachinePolicy**: Set by Group Policy (all users)
2. **UserPolicy**: Set by Group Policy (current user)
3. **Process**: Current PowerShell session only
4. **CurrentUser**: Current user
5. **LocalMachine**: All users on computer

### Setting Execution Policy:

**For all users (requires Admin):**
```powershell
Set-ExecutionPolicy RemoteSigned
```

**Step-by-step:**
1. Open PowerShell as Administrator
2. Run: `Set-ExecutionPolicy RemoteSigned`
3. When prompted: `[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "N"):`
4. Type `Y` and press Enter

**For current user only (no Admin needed):**
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

**For current session only:**
```powershell
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process
```

**Force without prompts:**
```powershell
Set-ExecutionPolicy RemoteSigned -Force
```

### Unblock Downloaded Scripts:
```powershell
# Single file
Unblock-File -Path "C:\Scripts\Downloaded.ps1"

# Multiple files
Get-ChildItem C:\Scripts\*.ps1 -Recurse | Unblock-File
```

### Bypass Policy for Single Script:
```powershell
# Method 1: Start PowerShell with bypass
PowerShell.exe -ExecutionPolicy Bypass -File "C:\Scripts\MyScript.ps1"

# Method 2: Use dot sourcing after unblocking
Unblock-File .\MyScript.ps1
. .\MyScript.ps1
```

### Best Practice for Server 2019:
```powershell
# Recommended for administrators
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
```

## 2.5 PowerShell Console Configuration

### Customize Console Colors:

**Method 1: Console Properties**
1. Right-click title bar → Properties
2. Colors tab → Select text/background colors
3. Font tab → Select font and size
4. Layout tab → Window size and position
5. Click OK

**Method 2: Programmatically**
```powershell
# Change colors
$Host.UI.RawUI.ForegroundColor = "Cyan"
$Host.UI.RawUI.BackgroundColor = "Black"
Clear-Host  # Apply changes

# Available colors:
# Black, DarkBlue, DarkGreen, DarkCyan, DarkRed, DarkMagenta
# DarkYellow, Gray, DarkGray, Blue, Green, Cyan, Red, Magenta
# Yellow, White
```

### Set Window Size:
```powershell
# Get current size
$size = $Host.UI.RawUI.WindowSize
$size

# Set new size
$size.Width = 120
$size.Height = 40
$Host.UI.RawUI.WindowSize = $size
```

### Set Buffer Size:
```powershell
$buffer = $Host.UI.RawUI.BufferSize
$buffer.Width = 120
$buffer.Height = 5000  # Scrollback buffer
$Host.UI.RawUI.BufferSize = $buffer
```

### Set Window Title:
```powershell
$Host.UI.RawUI.WindowTitle = "PowerShell - $env:USERNAME@$env:COMPUTERNAME"
```

## 2.6 PowerShell Profile

### What is a Profile?
Script that runs automatically when PowerShell starts. Use it to customize your environment.

### Profile Types:

| Profile | Scope | Path Variable |
|---------|-------|---------------|
| Current User, Current Host | You, PowerShell console | `$PROFILE.CurrentUserCurrentHost` |
| Current User, All Hosts | You, all PS hosts | `$PROFILE.CurrentUserAllHosts` |
| All Users, Current Host | Everyone, PS console | `$PROFILE.AllUsersCurrentHost` |
| All Users, All Hosts | Everyone, all hosts | `$PROFILE.AllUsersAllHosts` |

### View Profile Paths:
```powershell
$PROFILE | Format-List * -Force
```

**Output:**
```
AllUsersAllHosts       : C:\Windows\System32\WindowsPowerShell\v1.0\profile.ps1
AllUsersCurrentHost    : C:\Windows\System32\WindowsPowerShell\v1.0\Microsoft.PowerShell_profile.ps1
CurrentUserAllHosts    : C:\Users\Admin\Documents\WindowsPowerShell\profile.ps1
CurrentUserCurrentHost : C:\Users\Admin\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
```

### Create Profile:

**Step-by-step:**
```powershell
# 1. Check if profile exists
Test-Path $PROFILE

# 2. If False, create it
New-Item -Path $PROFILE -ItemType File -Force

# 3. Open in notepad
notepad $PROFILE

# 4. Add customizations (see examples below)

# 5. Save and close

# 6. Reload profile
. $PROFILE
```

### Example Profile Configuration:
```powershell
# ==========================================
# PowerShell Profile for System Administrators
# Location: $PROFILE
# ==========================================

# 1. Console Appearance
$Host.UI.RawUI.ForegroundColor = "Cyan"
$Host.UI.RawUI.BackgroundColor = "Black"
$Host.UI.RawUI.WindowTitle = "PowerShell - $env:USERNAME@$env:COMPUTERNAME"

# 2. Custom Prompt
function prompt {
    $path = (Get-Location).Path
    $host.UI.RawUI.WindowTitle = "PS: $path"
    Write-Host "PS " -NoNewline -ForegroundColor Green
    Write-Host "[$env:USERNAME@$env:COMPUTERNAME]" -NoNewline -ForegroundColor Yellow
    Write-Host " $path" -ForegroundColor Cyan
    return "> "
}

# 3. Useful Aliases
Set-Alias np notepad
Set-Alias sbc Show-Command  # Opens GUI command explorer

# 4. Custom Functions
function Get-SystemInfo {
    <#
    .SYNOPSIS
    Quick system information display
    #>
    [PSCustomObject]@{
        ComputerName = $env:COMPUTERNAME
        Username = $env:USERNAME
        OS = (Get-CimInstance Win32_OperatingSystem).Caption
        Version = (Get-CimInstance Win32_OperatingSystem).Version
        Architecture = $env:PROCESSOR_ARCHITECTURE
        Memory = "{0:N2} GB" -f ((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory/1GB)
        Uptime = (Get-Date) - (Get-CimInstance Win32_OperatingSystem).LastBootUpTime
    }
}

function Get-AdminStatus {
    <#
    .SYNOPSIS
    Check if running as Administrator
    #>
    $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = [Security.Principal.WindowsPrincipal]$identity
    $admin = $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
    
    if ($admin) {
        Write-Host "Running as Administrator" -ForegroundColor Green
    } else {
        Write-Host "NOT running as Administrator" -ForegroundColor Red
    }
}

function Update-Profile {
    <#
    .SYNOPSIS
    Edit and reload profile
    #>
    notepad $PROFILE
    . $PROFILE
    Write-Host "Profile reloaded!" -ForegroundColor Green
}

# 5. Set Default Location
Set-Location C:\Scripts

# 6. Load Required Modules
# Import-Module ActiveDirectory -ErrorAction SilentlyContinue

# 7. Welcome Message
Clear-Host
Write-Host "================================" -ForegroundColor Cyan
Write-Host "  PowerShell $($PSVersionTable.PSVersion)" -ForegroundColor Green
Write-Host "  Welcome, $env:USERNAME!" -ForegroundColor Yellow
Write-Host "================================" -ForegroundColor Cyan
Write-Host ""
Get-AdminStatus
Write-Host ""
```

### Reload Profile:
```powershell
. $PROFILE
```

### Backup Profile:
```powershell
Copy-Item $PROFILE "$PROFILE.backup.$(Get-Date -Format 'yyyyMMdd')"
```

---

# 3. Core PowerShell Concepts

## 3.1 Cmdlets (Command-lets)

### What are Cmdlets?
Lightweight commands in PowerShell environment. They are .NET classes compiled into DLLs, not standalone executables.

### Naming Convention:
```
Verb-Noun
```

Always follows this pattern for consistency.

### Examples:
```powershell
Get-Process     # Retrieve processes
Set-Service     # Modify service
New-Item        # Create item
Remove-User     # Delete user
Start-Service   # Begin service
Stop-Process    # End process
```

### Approved Verbs Categories:

**Common Verbs:**
```powershell
Add, Clear, Close, Copy, Enter, Exit, Find, Format, Get, Hide
Join, Lock, Move, New, Open, Optimize, Pop, Push, Redo, Remove
Rename, Reset, Resize, Search, Select, Set, Show, Skip, Split
Step, Switch, Undo, Unlock, Watch
```

**Communications Verbs:**
```powershell
Connect, Disconnect, Read, Receive, Send, Write
```

**Data Verbs:**
```powershell
Backup, Checkpoint, Compare, Compress, Convert, ConvertFrom
ConvertTo, Dismount, Edit, Expand, Export, Group, Import, Initialize
Limit, Merge, Mount, Out, Publish, Restore, Save, Sync, Unpublish
Update
```

**Diagnostic Verbs:**
```powershell
Debug, Measure, Ping, Repair, Resolve, Test, Trace
```

**Lifecycle Verbs:**
```powershell
Approve, Assert, Complete, Confirm, Deny, Disable, Enable, Install
Invoke, Register, Request, Restart, Resume, Start, Stop, Submit
Suspend, Uninstall, Unregister, Wait
```

**Security Verbs:**
```powershell
Block, Grant, Protect, Revoke, Unblock, Unprotect
```

### View All Approved Verbs:
```powershell
Get-Verb | Format-Table -AutoSize
```

### Finding Cmdlets:

**List all cmdlets:**
```powershell
Get-Command -CommandType Cmdlet
```

**Find by verb:**
```powershell
Get-Command -Verb Get
Get-Command -Verb Set
Get-Command -Verb New
```

**Find by noun:**
```powershell
Get-Command -Noun Service
Get-Command -Noun Process
Get-Command -Noun EventLog
```

**Search with wildcards:**
```powershell
Get-Command *service*
Get-Command Get-*User*
Get-Command *-ADUser
```

**Count cmdlets:**
```powershell
(Get-Command -CommandType Cmdlet).Count
```

**Find cmdlets from specific module:**
```powershell
Get-Command -Module Microsoft.PowerShell.Management
```

## 3.2 Parameters

### What are Parameters?
Named inputs that modify cmdlet behavior. They control what the cmdlet does and how it does it.

### Parameter Syntax:
```powershell
Cmdlet-Name -ParameterName Value
```

### Parameter Types:

**1. Named Parameters:**
```powershell
Get-Service -Name wuauserv
Get-Process -Name chrome
Get-ChildItem -Path C:\Windows -Filter *.log
```

**2. Positional Parameters:**
```powershell
# These are equivalent:
Get-Service -Name wuauserv
Get-Service wuauserv  # -Name is implied (position 0)

Get-ChildItem -Path C:\Windows
Get-ChildItem C:\Windows  # -Path is implied
```

**3. Switch Parameters (Boolean flags):**
```powershell
Get-ChildItem -Recurse          # Include subdirectories
Get-ChildItem -Force            # Include hidden items
Get-Process -FileVersionInfo    # Include version info
Stop-Service wuauserv -Force    # Don't prompt
```

### Parameter Features:

**Tab Completion:**
```powershell
# Type cmdlet and dash, then press Tab
Get-Service -<TAB>
# Cycles through: -Name, -DisplayName, -Include, -Exclude, etc.

# Tab completion for values:
Get-Service -Name w<TAB>
# Completes to service names starting with 'w'
```

**Parameter Aliases:**
```powershell
# Many parameters have short aliases
Get-ChildItem -Path C:\Windows        # Full name
Get-ChildItem -LiteralPath C:\Windows # Alternative
gci -Path C:\Windows                  # Using cmdlet alias

# ComputerName aliases
Get-Service -ComputerName Server01
Get-Service -Cn Server01             # Alias
Get-Service -Computer Server01       # Another alias
```

### Common Parameters:

All advanced cmdlets support these:

```powershell
-Verbose            # Show detailed messages
-Debug              # Show debugging messages
-ErrorAction        # Control error handling
-ErrorVariable      # Store errors in variable
-WarningAction      # Control warning handling
-WarningVariable    # Store warnings in variable
-OutVariable        # Store output in variable
-OutBuffer          # Output buffering count
-WhatIf             # Simulate operation
-Confirm            # Prompt before execution
```

**Examples:**
```powershell
# Verbose output
Get-ChildItem C:\Windows -Verbose

# Stop on error
Get-Content file.txt -ErrorAction Stop

# Store errors
Get-Service -Name NonExistent -ErrorVariable myerror -ErrorAction SilentlyContinue
$myerror

# Test without executing
Remove-Item C:\temp\*.txt -WhatIf

# Prompt for confirmation
Stop-Service wuauserv -Confirm
```

### ErrorAction Values:

```powershell
Stop               # Terminate command
Continue           # Display error and continue (default)
SilentlyContinue   # Suppress error and continue
Inquire            # Prompt user
Ignore             # Ignore error completely
Suspend            # Suspend workflow (workflows only)
```

**Examples:**
```powershell
# Stop on any error
Get-Content C:\nonexistent.txt -ErrorAction Stop

# Suppress errors
Get-Service InvalidName -ErrorAction SilentlyContinue

# Prompt on error
Get-Process -Name InvalidProcess -ErrorAction Inquire
```

### Parameter Validation:

**View parameter details:**
```powershell
Get-Help Get-Service -Parameter Name
```

**Check if parameter is mandatory:**
```powershell
(Get-Command Get-Service).Parameters.Name.Attributes.Mandatory
# Output: False
```

**View all parameters:**
```powershell
Get-Command Get-Service | Select-Object -ExpandProperty Parameters
```

### Parameter Sets:

Some cmdlets have multiple parameter sets - mutually exclusive parameter combinations.

**View syntax for all parameter sets:**
```powershell
Get-Command Get-EventLog -Syntax
```

**Output:**
```
Get-EventLog [-LogName] <string> [[-InstanceId] <long[]>] [-After <datetime>] [-AsString] [-Before <datetime>]...

Get-EventLog [-List] [-AsString] [-ComputerName <string[]>]...
```

**Usage:**
```powershell
# Parameter Set 1: Get events from specific log
Get-EventLog -LogName Application -Newest 10

# Parameter Set 2: List available logs
Get-EventLog -List

# Cannot combine parameters from different sets:
# Get-EventLog -LogName Application -List  # ERROR
```

## 3.3 The Pipeline

### What is the Pipeline?
PowerShell's most powerful feature. The `|` symbol passes **objects** (not text) from one cmdlet to another.

### Basic Pipeline Syntax:
```powershell
Cmdlet1 | Cmdlet2 | Cmdlet3
```

### Why Objects Matter:

**Traditional Shell (Text):**
```bash
# Bash/CMD passes text
dir | find "System"
# Output is plain text, hard to manipulate
```

**PowerShell (Objects):**
```powershell
# PowerShell passes objects with properties/methods
Get-ChildItem | Where-Object {$_.Length -gt 1MB}
# Can access properties like .Length, .Name, .LastWriteTime
```

### Simple Pipeline Examples:

**Example 1: Sort and filter processes**
```powershell
Get-Process | Sort-Object CPU -Descending | Select-Object -First 10
```

**Step-by-step execution:**
1. `Get-Process` → Returns array of process objects
2. `Sort-Object CPU -Descending` → Sorts by CPU property (high to low)
3. `Select-Object -First 10` → Takes first 10 objects

**Example 2: Find running services**
```powershell
Get-Service | Where-Object {$_.Status -eq 'Running'} | Select-Object Name, DisplayName
```

**Step-by-step:**
1. `Get-Service` → Gets all service objects
2. `Where-Object` → Filters to only running services
3. `Select-Object` → Selects specific properties to display

**Example 3: Stop multiple processes**
```powershell
Get-Process -Name notepad | Stop-Process -Force
```

**Step-by-step:**
1. `Get-Process -Name notepad` → Gets all notepad.exe processes
2. `Stop-Process -Force` → Stops each process without confirmation

**Example 4: Find large files**
```powershell
Get-ChildItem C:\Temp -Recurse -File | 
    Where-Object {$_.Length -gt 100MB} | 
    Sort-Object Length -Descending |
    Select-Object Name, @{Name="Size(MB)";Expression={[math]::Round($_.Length/1MB,2)}}
```

**Step-by-step:**
1. Gets all files recursively
2. Filters files larger than 100MB
3. Sorts by size (largest first)
4. Formats output with calculated size in MB

### Pipeline Variable: `$_`

`$_` represents the **current object** in the pipeline.

**Syntax:**
```powershell
... | Where-Object {$_ -operator value}
... | ForEach-Object {$_.Property}
```

**Examples:**
```powershell
# Filter by property
Get-Process | Where-Object {$_.CPU -gt 100}
# $_ = each process object
# Access CPU property of current object

# Access multiple properties
Get-ChildItem | Where-Object {$_.Length -gt 1MB -and $_.Extension -eq '.log'}

# Use in ForEach-Object
Get-Service | ForEach-Object {
    Write-Host "$($_.Name) is $($_.Status)" -ForegroundColor $(
        if($_.Status -eq 'Running'){'Green'} else {'Red'}
    )
}
```

**Common Property Access:**
```powershell
$_.Name          # Object name
$_.Length        # File size
$_.Status        # Service/process status
$_.CPU           # CPU usage
$_.LastWriteTime # File modification time
$_.Extension     # File extension
```

### Pipeline Binding Methods:

PowerShell binds pipeline input in two ways:

**1. ByValue (Entire Object):**
```powershell
Get-Service -Name wuauserv | Stop-Service
# Entire service object passed
# Stop-Service accepts service objects
```

**2. ByPropertyName (Matching Properties):**
```powershell
Import-Csv users.csv | New-ADUser
# CSV columns match parameter names
# Name column → -Name parameter
# Department column → -Department parameter
```

**Check binding method:**
```powershell
Get-Help Stop-Service -Parameter InputObject
# Shows: Accept pipeline input? True (ByValue)

Get-Help New-ADUser -Parameter Name
# Shows: Accept pipeline input? True (ByPropertyName)
```

### Advanced Pipeline Techniques:

**ForEach-Object for custom processing:**
```powershell
Get-ChildItem *.txt | ForEach-Object {
    $content = Get-Content $_.FullName
    $lines = $content.Count
    [PSCustomObject]@{
        FileName = $_.Name
        Lines = $lines
        Size = $_.Length
        Modified = $_.LastWriteTime
    }
}
```

**Tee-Object (split pipeline):**
```powershell
Get-Process | Tee-Object -FilePath processes.txt | Where-Object {$_.CPU -gt 10}
# Saves ALL processes to file
# AND continues pipeline with filtered results
```

**Measure-Object (statistics):**
```powershell
Get-ChildItem -File | Measure-Object -Property Length -Sum -Average -Maximum -Minimum

# Output:
# Count    : 42
# Average  : 52428.8
# Sum      : 2201610
# Maximum  : 524288
# Minimum  : 0
```

**Group-Object (categorization):**
```powershell
Get-Service | Group-Object Status | Format-Table Count, Name

# Output:
# Count Name
# ----- ----
#   150 Running
#    89 Stopped
```

### Pipeline Best Practices:

✅ **Do:**
- Use pipeline for object transformation
- Filter early with Where-Object
- Select only needed properties early
- Chain related operations

❌ **Don't:**
- Force pipeline where unnecessary
- Pipe to Format-* cmdlets mid-pipeline
- Use pipeline for single operations

**Example of filtering early:**
```powershell
# ❌ Bad - processes all then filters
Get-ChildItem -Recurse | Where-Object {$_.Extension -eq '.log'}

# ✅ Good - filters during retrieval
Get-ChildItem -Recurse -Filter *.log
```

## 3.4 Aliases

### What are Aliases?
Alternate short names for cmdlets, functions, or scripts.

### Purpose:
- Speed up interactive typing
- CMD/Unix compatibility
- Personal convenience

⚠️ **Warning:** Avoid aliases in production scripts. Use full cmdlet names for clarity.

### Common Built-in Aliases:

**Navigation & File Operations:**
```powershell
# Listing
ls, dir, gci    → Get-ChildItem
# Change directory
cd, chdir, sl   → Set-Location
# Current directory
pwd, gl         → Get-Location
# Create directory
md, mkdir       → New-Item -ItemType Directory
# Copy
cp, copy, cpi   → Copy-Item
# Move
mv, move, mi    → Move-Item
# Delete
rm, del, erase  → Remove-Item
# View file
cat, type, gc   → Get-Content
```

**Process & Service:**
```powershell
ps, gps         → Get-Process
kill, spps      → Stop-Process
saps            → Start-Process
gsv             → Get-Service
sasv            → Start-Service
spsv            → Stop-Service
rsv             → Restart-Service
```

**General Operations:**
```powershell
cls, clear      → Clear-Host
echo, write     → Write-Output
select          → Select-Object
where, ?        → Where-Object
foreach, %      → ForEach-Object
sort            → Sort-Object
group           → Group-Object
measure         → Measure-Object
```

**Formatting:**
```powershell
fl              → Format-List
ft              → Format-Table
fw              → Format-Wide
gm              → Get-Member
```

### Alias Management:

**List all aliases:**
```powershell
Get-Alias

# Sort alphabetically
Get-Alias | Sort-Object Name

# Count aliases
(Get-Alias).Count
```

**Find cmdlet for specific alias:**
```powershell
Get-Alias ls
Get-Alias -Name dir
Get-Alias cd, pwd, rm
```

**Output:**
```
CommandType     Name      Definition
-----------     ----      ----------
Alias           ls        Get-ChildItem
```

**Find all aliases for a cmdlet:**
```powershell
Get-Alias -Definition Get-ChildItem

# Output:
# dir, gci, ls
```

**Search aliases:**
```powershell
Get-Alias | Where-Object {$_.Definition -like '*Process*'}
Get-Alias *svc*
```

### Creating Custom Aliases:

**Basic alias:**
```powershell
Set-Alias -Name np -Value notepad

# Now use:
np test.txt  # Opens test.txt in Notepad
```

**Alias for executable:**
```powershell
Set-Alias -Name edge -Value "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"

# Use:
edge https://google.com
```

**Alias for script:**
```powershell
Set-Alias -Name backup -Value "C:\Scripts\Backup-System.ps1"
```

**Temporary alias (session only):**
```powershell
Set-Alias ll "Get-ChildItem -Force"
# Lost when PowerShell closes
```

### Permanent Aliases (via Profile):

Add to `$PROFILE`:
```powershell
# Edit profile
notepad $PROFILE

# Add these lines:
Set-Alias np notepad
Set-Alias ll Get-ChildItem
Set-Alias grep Select-String
Set-Alias which Get-Command
```

### Export/Import Aliases:

**Export all aliases:**
```powershell
Export-Alias -Path C:\MyAliases.xml
```

**Export as CSV:**
```powershell
Get-Alias | Export-Csv C:\MyAliases.csv -NoTypeInformation
```

**Import aliases:**
```powershell
Import-Alias -Path C:\MyAliases.xml
```

### Remove Aliases:

**Remove single alias:**
```powershell
Remove-Item Alias:np
```

**Remove multiple:**
```powershell
Remove-Item Alias:np, Alias:ll
```

**Remove all custom aliases:**
```powershell
Get-Alias | Where-Object {$_.Options -match 'None'} | Remove-Item
```

### Alias Limitations:

**Cannot do parameters:**
```powershell
# ❌ This doesn't work
Set-Alias gps "Get-Process -Name"

# ✅ Use functions instead:
function gpsn {
    param($Name)
    Get-Process -Name $Name
}
```

**Cannot use pipeline in alias:**
```powershell
# ❌ Doesn't work
Set-Alias top "Get-Process | Sort CPU -Desc | Select -First 10"

# ✅ Use function:
function top {
    Get-Process | Sort-Object CPU -Descending | Select-Object -First 10
}
```

### Alias Best Practices:

✅ **Good Uses:**
- Interactive console work
- Personal productivity
- Quick troubleshooting

❌ **Avoid in:**
- Production scripts
- Shared code
- Documentation
- Scheduled tasks

**Example script comparison:**
```powershell
# ❌ Bad - Uses aliases (unclear)
gci C:\logs -r | ? {$_.Length -gt 1MB} | select Name, Length

# ✅ Good - Full cmdlets (clear)
Get-ChildItem C:\logs -Recurse | 
    Where-Object {$_.Length -gt 1MB} | 
    Select-Object Name, Length
```

## 3.5 PowerShell Providers

### What are Providers?
Adapt data stores to look like file systems. Access different data types with consistent cmdlets.

### Built-in Providers:

**List all providers:**
```powershell
Get-PSProvider
```

**Output:**
```
Name            Capabilities              Drives
----            ------------              ------
Alias           ShouldProcess             {Alias}
Environment     ShouldProcess             {Env}
FileSystem      Filter, ShouldProcess... {C, D, Temp, ...}
Function        ShouldProcess             {Function}
Registry        ShouldProcess, Trans...   {HKLM, HKCU}
Variable        ShouldProcess             {Variable}
Certificate     ShouldProcess             {Cert}
WSMan           Credentials               {WSMan}
```

### Provider Examples:

**1. FileSystem Provider:**
```powershell
# Standard file operations
Set-Location C:\Windows
Get-ChildItem
New-Item test.txt -ItemType File
Remove-Item test.txt
```

**2. Registry Provider:**
```powershell
# Navigate registry like filesystem
Set-Location HKLM:\SOFTWARE
Get-ChildItem

# Read registry value
Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -Name ProductName

# Create registry key
New-Item "HKLM:\SOFTWARE\MyApp"

# Set registry value
Set-ItemProperty "HKLM:\SOFTWARE\MyApp" -Name "Version" -Value "1.0"
```

**3. Certificate Provider:**
```powershell
# Navigate certificates
Set-Location Cert:\CurrentUser\My
Get-ChildItem

# Find certificate by thumbprint
Get-ChildItem Cert:\LocalMachine\My | Where-Object {$_.Thumbprint -eq '1234567890ABCDEF...'}

# Export certificate
$cert = Get-ChildItem Cert:\CurrentUser\My\1234567890ABCDEF...
Export-Certificate -Cert $cert -FilePath C:\cert.cer
```

**4. Environment Provider:**
```powershell
# Navigate environment variables
Set-Location Env:
Get-ChildItem

# Get specific variable
Get-ChildItem Env:PATH
$env:PATH  # Alternative

# Set environment variable
New-Item -Path Env:MYVAR -Value "MyValue"
$env:MYVAR = "MyValue"  # Alternative

# Modify PATH
$env:PATH += ";C:\MyApp\bin"
```

**5. Variable Provider:**
```powershell
# Navigate PowerShell variables
Set-Location Variable:
Get-ChildItem

# Get variable
Get-Variable PSVersionTable
Get-ChildItem Variable:PS*

# Create variable
New-Item -Path Variable:MyVar -Value 123
```

**6. Function Provider:**
```powershell
# View functions
Set-Location Function:
Get-ChildItem

# View function definition
Get-Content Function:prompt
Get-Content Function:Clear-Host

# Create function dynamically
$function:SayHello = {Write-Host "Hello!"}
SayHello
```

**7. Alias Provider:**
```powershell
# Navigate aliases
Set-Location Alias:
Get-ChildItem

# View alias
Get-Content Alias:ls
Get-Content Alias:dir
```

### Working with Drives:

**List all drives:**
```powershell
Get-PSDrive
```

**Output:**
```
Name     Used (GB)  Free (GB) Provider   Root
----     ---------  --------- --------   ----
Alias                         Alias
C           125.32     374.68 FileSystem C:\
Cert                          Certificate \
D             0.00      99.00 FileSystem D:\
Env                           Environment
Function                      Function
HKCU                          Registry   HKEY_CURRENT_USER
HKLM                          Registry   HKEY_LOCAL_MACHINE
Variable                      Variable
WSMan                         WSMan
```

**Create custom drive:**
```powershell
# Map folder to drive
New-PSDrive -Name Scripts -PSProvider FileSystem -Root "C:\PowerShell\Scripts"

# Now access:
Set-Location Scripts:
Get-ChildItem Scripts:
```

**Map network share:**
```powershell
New-PSDrive -Name Share -PSProvider FileSystem -Root "\\Server\Share" -Persist
# -Persist makes it permanent (like net use)
```

**Map registry key:**
```powershell
New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT
Get-ChildItem HKCR:\
```

**Remove drive:**
```powershell
Remove-PSDrive -Name Scripts
```

### Provider Commands:

**These cmdlets work across all providers:**
```powershell
# Navigation
Get-Location
Set-Location
Push-Location
Pop-Location

# Items (files, keys, etc.)
Get-ChildItem
New-Item
Remove-Item
Copy-Item
Move-Item
Rename-Item

# Item properties
Get-ItemProperty
Set-ItemProperty
Clear-ItemProperty
Remove-ItemProperty

# Content
Get-Content
Set-Content
Add-Content
Clear-Content
```

**Examples across providers:**
```powershell
# FileSystem
Get-ChildItem C:\
New-Item C:\test.txt

# Registry
Get-ChildItem HKLM:\Software
New-Item HKLM:\Software\TestKey

# Environment
Get-ChildItem Env:
New-Item Env:TestVar -Value "Test"

# Certificate
Get-ChildItem Cert:\CurrentUser\My
```

## 3.6 The Help System

### Why Master Help?
PowerShell's built-in help is comprehensive. Mastering it reduces dependency on external resources.

### Update Help:

**Update all help (requires Admin & Internet):**
```powershell
Update-Help -Force
```

**Update specific module:**
```powershell
Update-Help -Module Microsoft.PowerShell.Management -Force
```

**Update from local path (offline):**
```powershell
# Save help on internet-connected machine:
Save-Help -DestinationPath \\Server\Share\PSHelp

# Update from share on offline machine:
Update-Help -SourcePath \\Server\Share\PSHelp
```

### Basic Help Commands:

**Get help for cmdlet:**
```powershell
Get-Help Get-Process
```

**Detailed help:**
```powershell
Get-Help Get-Process -Detailed
```

**Full help (everything):**
```powershell
Get-Help Get-Process -Full
```

**Examples only:**
```powershell
Get-Help Get-Process -Examples
```

**Online help:**
```powershell
Get-Help Get-Process -Online
# Opens Microsoft Docs in browser
```

**Help in separate window:**
```powershell
Get-Help Get-Process -ShowWindow
# Searchable GUI window
```

### Understanding Help Structure:

```
NAME
    Get-Process

SYNOPSIS
    Gets processes running on local or remote computer.

SYNTAX
    Get-Process [[-Name] <String[]>] [-ComputerName <String[]>] [<CommonParameters>]
    
    Get-Process -Id <Int32[]> [-ComputerName <String[]>] [<CommonParameters>]

DESCRIPTION
    Retrieves objects that represent processes on local or remote computer...

PARAMETERS
    -Name <String[]>
        Specifies process names. Wildcards permitted.
        
        Required?                    false
        Position?                    0
        Default value                All processes
        Accept pipeline input?       True (ByPropertyName)
        Accept wildcard characters?  true

    -Id <Int32[]>
        Specifies process IDs.
        
        Required?                    true
        Position?                    named
        Default value                None
        Accept pipeline input?       True (ByPropertyName)
        Accept wildcard characters?  false

INPUTS
    System.Diagnostics.Process
    System.String

OUTPUTS
    System.Diagnostics.Process

NOTES
    You can also refer to Get-Process by its built-in alias, "ps"...

EXAMPLES
    -------------------------- EXAMPLE 1 --------------------------
    PS C:\>Get-Process
    Gets all processes running on the local computer.

RELATED LINKS
    Online Version: http://go.microsoft.com/fwlink/?LinkId=821590
    Debug-Process
    Get-Process
    Start-Process
    Stop-Process
    Wait-Process
```

### Syntax Notation:

**Understanding brackets:**
```powershell
Get-Process [[-Name] <String[]>] [-ComputerName <String[]>]
```

- `[ ]` - Optional parameter
- `[[ ]]` - Optional positional parameter  
- `< >` - Required value type
- `[]` after type - Accepts array/multiple values

**Examples:**
```
[-Name] <String>        # Optional parameter, value required if used
[[-Name] <String>]      # Optional positional parameter
-Name <String[]>        # Accepts array of strings
[-Force]                # Switch parameter (no value)
<String>                # Required value
```

### Parameter Help:

**Help for specific parameter:**
```powershell
Get-Help Get-Service -Parameter Name
```

**Help for all parameters:**
```powershell
Get-Help Get-Service -Parameter *
```

### Searching Help:

**Search for cmdlets:**
```powershell
Get-Help *service*
Get-Help *process*
Get-Help *event*
```

**Search in help content:**
```powershell
Get-Help * | Where-Object {$_.Synopsis -like '*event log*'}
```

**Find cmdlets by category:**
```powershell
Get-Help -Category Cmdlet
Get-Help -Category Function
```

### About Topics:

**List all "about" topics:**
```powershell
Get-Help about_*
```

**Essential topics:**
```powershell
Get-Help about_Operators
Get-Help about_Comparison_Operators
Get-Help about_Logical_Operators
Get-Help about_Automatic_Variables
Get-Help about_Environment_Variables
Get-Help about_If
Get-Help about_While
Get-Help about_For
Get-Help about_ForEach
Get-Help about_Switch
Get-Help about_Functions
Get-Help about_Functions_Advanced
Get-Help about_Parameters
Get-Help about_Splatting
Get-Help about_Arrays
Get-Help about_Hash_Tables
Get-Help about_Variables
Get-Help about_Scopes
Get-Help about_Modules
Get-Help about_Remote
Get-Help about_Remote_Requirements
Get-Help about_Execution_Policies
Get-Help about_Pipelines
Get-Help about_Try_Catch_Finally
Get-Help about_Throw
```

### Help for Scripts:

**Get help from script:**
```powershell
Get-Help C:\Scripts\MyScript.ps1
# Works if script has comment-based help
```

**Comment-based help example:**
```powershell
<#
.SYNOPSIS
    Brief description of script

.DESCRIPTION
    Detailed description

.PARAMETER ComputerName
    Computer to query

.EXAMPLE
    .\MyScript.ps1 -ComputerName SERVER01
    Example description

.NOTES
    Author: Your Name
    Date: 2026-02-13
#>
param(
    [string]$ComputerName
)
# Script code here
```

### Help Best Practices:

1. **Update help regularly:**
   ```powershell
   Update-Help -Force -ErrorAction SilentlyContinue
   ```

2. **Start with examples:**
   ```powershell
   Get-Help Get-Process -Examples
   ```

3. **Use ShowWindow for readability:**
   ```powershell
   Get-Help Get-Process -ShowWindow
   ```

4. **Check related links:**
   - At bottom of full help
   - Links to similar cmdlets

5. **Use online help for latest:**
   ```powershell
   Get-Help Get-Process -Online
   ```

---

# 4. Basic Commands & Navigation

## 4.1 Navigation Commands

### Get Current Location:
```powershell
Get-Location
# Aliases: pwd, gl
```

**Output:**
```
Path
----
C:\Users\Administrator
```

**In script:**
```powershell
$currentPath = Get-Location
Write-Host "Currently in: $currentPath"
```

### Change Directory:
```powershell
Set-Location C:\Windows
# Aliases: cd, chdir, sl
```

**Examples:**
```powershell
# Absolute path
cd C:\Windows\System32

# Relative path
cd .\drivers
cd ..\..          # Up two levels

# Root of drive
cd \

# Home directory
cd ~
cd $HOME

# Previous location
cd -
```

**With drives:**
```powershell
# Change drive
cd D:\

# Registry
cd HKLM:\SOFTWARE

# Certificate store
cd Cert:\CurrentUser\My
```

### Push and Pop Location:

**Push location (save and move):**
```powershell
Push-Location C:\Windows
# Saves current location, moves to C:\Windows
```

**Pop location (return):**
```powershell
Pop-Location
# Returns to saved location
```

**Complete example:**
```powershell
# 1. Start in C:\Users\Administrator
Get-Location  # C:\Users\Administrator

# 2. Push to C:\Windows
Push-Location C:\Windows
Get-Location  # C:\Windows

# 3. Do work in C:\Windows
Get-ChildItem

# 4. Push to C:\Program Files
Push-Location "C:\Program Files"
Get-Location  # C:\Program Files

# 5. Do work

# 6. Pop back
Pop-Location
Get-Location  # C:\Windows

# 7. Pop again
Pop-Location
Get-Location  # C:\Users\Administrator
```

**Practical use:**
```powershell
# Script that needs to work in multiple directories
$originalPath = Get-Location

try {
    Push-Location C:\Logs
    # Process logs
    Get-ChildItem *.log | ForEach-Object { ... }
    
    Push-Location C:\Temp
    # Process temp files
    Get-ChildItem *.tmp | Remove-Item
    
    Pop-Location  # Back to C:\Logs
    Pop-Location  # Back to original
}
finally {
    Set-Location $originalPath
}
```

## 4.2 Listing Directory Contents

### Get-ChildItem Basics:
```powershell
Get-ChildItem
# Aliases: ls, dir, gci
```

**Specify path:**
```powershell
Get-ChildItem C:\Windows
Get-ChildItem -Path C:\Windows
```

**With wildcards:**
```powershell
Get-ChildItem *.txt
Get-ChildItem C:\*.log
Get-ChildItem Test*
Get-ChildItem *Report*.xlsx
```

### Filtering Options:

**Include hidden/system files:**
```powershell
Get-ChildItem -Force
```

**Files only:**
```powershell
Get-ChildItem -File
```

**Directories only:**
```powershell
Get-ChildItem -Directory
```

**Recursive:**
```powershell
Get-ChildItem -Recurse
# Shows all subdirectories
```

**Depth limit:**
```powershell
Get-ChildItem -Recurse -Depth 2
# Only 2 levels deep
```

**Filter parameter:**
```powershell
Get-ChildItem -Filter *.log
Get-ChildItem -Filter Test*
```

**Include/Exclude:**
```powershell
# Include multiple patterns
Get-ChildItem -Include *.txt, *.log -Recurse

# Exclude patterns
Get-ChildItem -Exclude *.tmp, *.bak -Recurse
```

**By attributes:**
```powershell
# Hidden files
Get-ChildItem -Attributes Hidden

# Read-only files
Get-ChildItem -Attributes ReadOnly

# NOT read-only
Get-ChildItem -Attributes !ReadOnly

# Multiple attributes
Get-ChildItem -Attributes Hidden, System
```

### Advanced Filtering:

**By date:**
```powershell
# Modified in last 7 days
Get-ChildItem | Where-Object {$_.LastWriteTime -gt (Get-Date).AddDays(-7)}

# Created today
Get-ChildItem | Where-Object {$_.CreationTime.Date -eq (Get-Date).Date}

# Modified between dates
$start = Get-Date "2026-01-01"
$end = Get-Date "2026-01-31"
Get-ChildItem | Where-Object {$_.LastWriteTime -ge $start -and $_.LastWriteTime -le $end}

# Older than 30 days
Get-ChildItem | Where-Object {$_.LastWriteTime -lt (Get-Date).AddDays(-30)}
```

**By size:**
```powershell
# Larger than 1MB
Get-ChildItem -File | Where-Object {$_.Length -gt 1MB}

# Between 1MB and 10MB
Get-ChildItem -File | Where-Object {$_.Length -gt 1MB -and $_.Length -lt 10MB}

# Smaller than 100KB
Get-ChildItem -File | Where-Object {$_.Length -lt 100KB}

# Empty files
Get-ChildItem -File | Where-Object {$_.Length -eq 0}
```

**By extension:**
```powershell
# Specific extension
Get-ChildItem | Where-Object {$_.Extension -eq '.log'}

# Multiple extensions
Get-ChildItem | Where-Object {$_.Extension -in '.txt','.log','.csv'}

# Without extension
Get-ChildItem | Where-Object {$_.Extension -eq ''}
```

### Practical Examples:

**Find largest files:**
```powershell
Get-ChildItem -Recurse -File | 
    Sort-Object Length -Descending | 
    Select-Object -First 10 Name, @{Name='Size(MB)';Expression={[math]::Round($_.Length/1MB,2)}}, FullName
```

**Count files by extension:**
```powershell
Get-ChildItem -Recurse -File | 
    Group-Object Extension | 
    Sort-Object Count -Descending | 
    Select-Object Count, Name
```

**Find empty directories:**
```powershell
Get-ChildItem -Recurse -Directory | 
    Where-Object {(Get-ChildItem $_.FullName).Count -eq 0} |
    Select-Object FullName
```

**Total size of directory:**
```powershell
$size = (Get-ChildItem -Recurse -File | Measure-Object -Property Length -Sum).Sum
Write-Host "Total: $([math]::Round($size/1GB,2)) GB"
```

**Files modified by specific user:**
```powershell
Get-ChildItem -Recurse | 
    Where-Object {$_.LastWriteTime -gt (Get-Date).AddDays(-7)} |
    Select-Object Name, LastWriteTime, @{Name='Owner';Expression={(Get-Acl $_.FullName).Owner}}
```

### Formatting Output:

**Format as table:**
```powershell
Get-ChildItem | Format-Table Name, Length, LastWriteTime
# Alias: ft
```

**Format as list:**
```powershell
Get-ChildItem | Format-List
# Alias: fl
# Shows all properties
```

**Custom table:**
```powershell
Get-ChildItem -File | Format-Table -AutoSize -Property Name, 
    @{Label='Size(KB)';Expression={[math]::Round($_.Length/1KB,2)}; Align='Right'},
    @{Label='Modified';Expression={$_.LastWriteTime.ToString('yyyy-MM-dd HH:mm')}; Width=20}
```

**Select properties:**
```powershell
Get-ChildItem | Select-Object Name, Length, LastWriteTime, Extension
```

## 4.3 Working with Command History

### View History:
```powershell
Get-History
# Alias: history, h
```

**Output:**
```
  Id CommandLine
  -- -----------
   1 Get-Process
   2 Get-Service
   3 Get-ChildItem C:\Windows
```

**Limit results:**
```powershell
Get-History -Count 10  # Last 10 commands
```

### Invoke History:

**By ID:**
```powershell
Invoke-History 5
# Alias: r 5
```

**Last command:**
```powershell
Invoke-History
# Re-runs last command
```

### Search History:
```powershell
Get-History | Where-Object {$_.CommandLine -like '*service*'}
```

### Clear History:
```powershell
Clear-History
```

### Save History:
```powershell
Get-History | Export-Csv C:\history.csv -NoTypeInformation
```

### Keyboard Shortcuts:

```
↑ (Up Arrow)        - Previous command
↓ (Down Arrow)      - Next command
F7                  - Show command history dialog
F8                  - Search history (after typing partial command)
F9                  - Run command by history number
#<number><Enter>    - Run command by number (e.g., #5)
Ctrl+R              - Search history backwards
Tab                 - Auto-complete
```

## 4.4 Screen Management

### Clear Screen:
```powershell
Clear-Host
# Aliases: cls, clear
```

### Pause Execution:
```powershell
# Wait for key press
Read-Host "Press Enter to continue"

# Pause command
pause
```

### Start Sleep:
```powershell
# Sleep 5 seconds
Start-Sleep -Seconds 5

# Sleep 500 milliseconds
Start-Sleep -Milliseconds 500
```

## 4.5 Information Commands

### Get-Command:

**List all commands:**
```powershell
Get-Command
```

**By type:**
```powershell
Get-Command -CommandType Cmdlet
Get-Command -CommandType Function
Get-Command -CommandType Alias
```

**By verb:**
```powershell
Get-Command -Verb Get
Get-Command -Verb Set
Get-Command -Verb New
```

**By noun:**
```powershell
Get-Command -Noun Service
Get-Command -Noun Process
Get-Command -Noun EventLog
```

**Search:**
```powershell
Get-Command *service*
Get-Command *network*
```

**From module:**
```powershell
Get-Command -Module NetAdapter
Get-Command -Module ActiveDirectory
```

**Command details:**
```powershell
Get-Command Get-Process | Format-List *
```

### Get-Member:

**View object members:**
```powershell
Get-Process | Get-Member
# Alias: gm
```

**Properties only:**
```powershell
Get-Process | Get-Member -MemberType Property
```

**Methods only:**
```powershell
Get-Process | Get-Member -MemberType Method
```

**Specific member:**
```powershell
Get-Process | Get-Member -Name CPU
```

**Example usage:**
```powershell
# 1. See what properties are available
Get-Service | Get-Member

# 2. Use discovered properties
Get-Service | Select-Object Name, Status, StartType
```

### Measure-Object:

**Count objects:**
```powershell
Get-Process | Measure-Object
```

**Statistics:**
```powershell
Get-ChildItem -File | Measure-Object -Property Length -Sum -Average -Maximum -Minimum
```

**Count lines/words/characters:**
```powershell
Get-Content file.txt | Measure-Object -Line -Word -Character
```

### Select-Object:

**First N:**
```powershell
Get-Process | Select-Object -First 10
```

**Last N:**
```powershell
Get-Process | Select-Object -Last 5
```

**Skip N:**
```powershell
Get-Process | Select-Object -Skip 10 -First 5
```

**Specific properties:**
```powershell
Get-Process | Select-Object Name, CPU, WS
```

**Calculated properties:**
```powershell
Get-Process | Select-Object Name, @{Name='Memory(MB)';Expression={[math]::Round($_.WS/1MB,2)}}
```

**Unique:**
```powershell
Get-Process | Select-Object -Unique Company
```

### Where-Object:

**Basic filter:**
```powershell
Get-Service | Where-Object {$_.Status -eq 'Running'}
# Alias: where, ?
```

**Multiple conditions:**
```powershell
Get-Process | Where-Object {$_.CPU -gt 10 -and $_.WS -gt 100MB}
```

**Short syntax (PS 3.0+):**
```powershell
Get-Service | Where Status -eq 'Running'
Get-Process | Where CPU -gt 10
Get-ChildItem | Where Length -gt 1MB
```

### Sort-Object:

**Ascending (default):**
```powershell
Get-Process | Sort-Object CPU
```

**Descending:**
```powershell
Get-Process | Sort-Object CPU -Descending
```

**Multiple properties:**
```powershell
Get-Process | Sort-Object Company, CPU -Descending
```

**Unique:**
```powershell
Get-Process | Sort-Object Company -Unique
```

### Group-Object:

**Basic grouping:**
```powershell
Get-Service | Group-Object Status
```

**No elements (count only):**
```powershell
Get-Service | Group-Object Status -NoElement
```

**Multiple properties:**
```powershell
Get-ChildItem | Group-Object Extension, {$_.Length -gt 1MB}
```

---

**[Document continues with sections 5-25...]**

Due to length limitations, the complete 150+ page document continues. Would you like me to:
1. Continue with the next sections (Files, Variables, Operators, etc.)?
2. Create the complete document and save it directly?


# 5. Working with Files and Folders

## 5.1 Creating Files and Folders

### New-Item Cmdlet:

**Create a file:**
```powershell
New-Item -Path C:\Temp\test.txt -ItemType File
```

**Step-by-step explanation:**
1. Creates empty file at specified path
2. Returns FileInfo object
3. Overwrites if file exists (with -Force)

**Create file with content:**
```powershell
New-Item -Path C:\Temp\test.txt -ItemType File -Value "Hello World"
```

**Create directory:**
```powershell
New-Item -Path C:\Temp\MyFolder -ItemType Directory
```

**Create nested directories:**
```powershell
New-Item -Path C:\Temp\Level1\Level2\Level3 -ItemType Directory -Force
# -Force creates parent directories if needed
```

**Multiple items:**
```powershell
# Multiple files
"file1.txt", "file2.txt", "file3.txt" | ForEach-Object {
    New-Item -Path "C:\Temp\$_" -ItemType File
}

# Multiple directories
$folders = "Logs", "Scripts", "Backups"
$folders | ForEach-Object {
    New-Item -Path "C:\Admin\$_" -ItemType Directory
}
```

**Using mkdir (alias):**
```powershell
mkdir C:\Temp\NewFolder
# Equivalent to: New-Item -ItemType Directory
```

### Practical Examples:

**Create project structure:**
```powershell
$projectRoot = "C:\Projects\MyApp"
$folders = @(
    "$projectRoot\src"
    "$projectRoot\tests"
    "$projectRoot\docs"
    "$projectRoot\bin"
    "$projectRoot\lib"
)

$folders | ForEach-Object {
    New-Item -Path $_ -ItemType Directory -Force
}

# Create README
New-Item -Path "$projectRoot\README.md" -ItemType File -Value "# MyApp Project"
```

**Create log file with timestamp:**
```powershell
$logFile = "C:\Logs\Log_$(Get-Date -Format 'yyyyMMdd_HHmmss').txt"
New-Item -Path $logFile -ItemType File -Value "Log started: $(Get-Date)`n"
```

## 5.2 Copying Files and Folders

### Copy-Item Cmdlet:

**Copy file:**
```powershell
Copy-Item -Path C:\Source\file.txt -Destination C:\Destination\
# Aliases: cp, copy, cpi
```

**Copy and rename:**
```powershell
Copy-Item -Path C:\Source\file.txt -Destination C:\Destination\newname.txt
```

**Copy directory:**
```powershell
Copy-Item -Path C:\SourceFolder -Destination C:\DestFolder -Recurse
# -Recurse copies all contents
```

**Copy with filter:**
```powershell
Copy-Item -Path C:\Source\*.txt -Destination C:\Destination\
```

**Copy with force (overwrite):**
```powershell
Copy-Item -Path C:\Source\file.txt -Destination C:\Destination\ -Force
```

**Copy with exclusion:**
```powershell
Copy-Item -Path C:\Source\* -Destination C:\Destination\ -Exclude *.tmp, *.bak -Recurse
```

### Advanced Copy Examples:

**Copy with progress:**
```powershell
$files = Get-ChildItem C:\Source -Recurse
$total = $files.Count
$current = 0

foreach ($file in $files) {
    $current++
    Write-Progress -Activity "Copying files" -Status "$current of $total" -PercentComplete (($current/$total)*100)
    Copy-Item $file.FullName -Destination "C:\Destination\" -Force
}
```

**Copy newer files only:**
```powershell
$source = "C:\Source"
$dest = "C:\Destination"

Get-ChildItem $source -Recurse -File | ForEach-Object {
    $destFile = $_.FullName.Replace($source, $dest)
    
    if (-not (Test-Path $destFile) -or $_.LastWriteTime -gt (Get-Item $destFile).LastWriteTime) {
        $destFolder = Split-Path $destFile
        if (-not (Test-Path $destFolder)) {
            New-Item -Path $destFolder -ItemType Directory -Force | Out-Null
        }
        Copy-Item $_.FullName -Destination $destFile -Force
        Write-Host "Copied: $($_.Name)"
    }
}
```

**Backup with date stamp:**
```powershell
$source = "C:\Important\file.txt"
$backup = "C:\Backups\file_$(Get-Date -Format 'yyyyMMdd_HHmmss').txt"
Copy-Item -Path $source -Destination $backup
```

## 5.3 Moving Files and Folders

### Move-Item Cmdlet:

**Move file:**
```powershell
Move-Item -Path C:\Source\file.txt -Destination C:\Destination\
# Aliases: mv, move, mi
```

**Move and rename:**
```powershell
Move-Item -Path C:\Source\file.txt -Destination C:\Destination\newname.txt
```

**Move directory:**
```powershell
Move-Item -Path C:\SourceFolder -Destination C:\DestFolder
```

**Move with wildcard:**
```powershell
Move-Item -Path C:\Source\*.log -Destination C:\Logs\
```

**Move with force:**
```powershell
Move-Item -Path C:\Source\file.txt -Destination C:\Destination\file.txt -Force
```

### Practical Examples:

**Move old files:**
```powershell
# Move files older than 30 days to archive
$oldFiles = Get-ChildItem C:\Logs | Where-Object {$_.LastWriteTime -lt (Get-Date).AddDays(-30)}
$oldFiles | Move-Item -Destination C:\Archive\Logs\
```

**Organize files by extension:**
```powershell
$source = "C:\Downloads"
$dest = "C:\Organized"

Get-ChildItem $source -File | ForEach-Object {
    $ext = $_.Extension.TrimStart('.')
    if ($ext -eq '') { $ext = "NoExtension" }
    
    $targetFolder = Join-Path $dest $ext
    if (-not (Test-Path $targetFolder)) {
        New-Item -Path $targetFolder -ItemType Directory | Out-Null
    }
    
    Move-Item $_.FullName -Destination $targetFolder
}
```

## 5.4 Deleting Files and Folders

### Remove-Item Cmdlet:

**Delete file:**
```powershell
Remove-Item -Path C:\Temp\file.txt
# Aliases: rm, del, erase, rd (for directories)
```

**Delete without confirmation:**
```powershell
Remove-Item -Path C:\Temp\file.txt -Force
```

**Delete directory and contents:**
```powershell
Remove-Item -Path C:\Temp\OldFolder -Recurse -Force
```

**Delete with wildcard:**
```powershell
Remove-Item -Path C:\Temp\*.tmp
```

**Delete by criteria:**
```powershell
# Delete files older than 30 days
Get-ChildItem C:\Logs | 
    Where-Object {$_.LastWriteTime -lt (Get-Date).AddDays(-30)} | 
    Remove-Item -Force

# Delete empty folders
Get-ChildItem C:\Temp -Recurse -Directory | 
    Where-Object {(Get-ChildItem $_.FullName).Count -eq 0} | 
    Remove-Item -Force
```

**Safe delete with confirmation:**
```powershell
Remove-Item -Path C:\Important\* -Confirm
```

**WhatIf (test without deleting):**
```powershell
Remove-Item -Path C:\Temp\* -Recurse -WhatIf
```

### Practical Examples:

**Clean temp files:**
```powershell
$tempPaths = @(
    "$env:TEMP",
    "C:\Windows\Temp",
    "C:\Windows\SoftwareDistribution\Download"
)

foreach ($path in $tempPaths) {
    Get-ChildItem $path -Recurse -Force -ErrorAction SilentlyContinue | 
        Remove-Item -Force -Recurse -ErrorAction SilentlyContinue
}
```

**Delete files by size:**
```powershell
# Delete files larger than 100MB
Get-ChildItem C:\Temp -Recurse -File | 
    Where-Object {$_.Length -gt 100MB} | 
    Remove-Item -Force
```

## 5.5 Renaming Files and Folders

### Rename-Item Cmdlet:

**Rename file:**
```powershell
Rename-Item -Path C:\Temp\old.txt -NewName new.txt
# Alias: ren, rni
```

**Rename directory:**
```powershell
Rename-Item -Path C:\OldFolder -NewName NewFolder
```

### Bulk Rename Examples:

**Add prefix:**
```powershell
Get-ChildItem C:\Temp\*.txt | ForEach-Object {
    Rename-Item $_.FullName -NewName "Backup_$($_.Name)"
}
```

**Change extension:**
```powershell
Get-ChildItem C:\Temp\*.txt | ForEach-Object {
    Rename-Item $_.FullName -NewName ($_.Name -replace '\.txt$', '.log')
}
```

**Remove spaces:**
```powershell
Get-ChildItem C:\Temp | ForEach-Object {
    $newName = $_.Name -replace ' ', '_'
    Rename-Item $_.FullName -NewName $newName
}
```

**Add date:**
```powershell
Get-ChildItem C:\Logs\*.log | ForEach-Object {
    $date = $_.LastWriteTime.ToString('yyyyMMdd')
    $newName = "$($_.BaseName)_$date$($_.Extension)"
    Rename-Item $_.FullName -NewName $newName
}
```

**Sequential numbering:**
```powershell
$files = Get-ChildItem C:\Photos\*.jpg
$count = 1

foreach ($file in $files) {
    $newName = "Photo_{0:D4}{1}" -f $count, $file.Extension
    Rename-Item $file.FullName -NewName $newName
    $count++
}
```

## 5.6 Reading and Writing Files

### Get-Content (Read):

**Read entire file:**
```powershell
Get-Content -Path C:\file.txt
# Aliases: cat, gc, type
```

**Read first N lines:**
```powershell
Get-Content -Path C:\file.txt -TotalCount 10
# or: -First 10 (PS 3.0+)
```

**Read last N lines:**
```powershell
Get-Content -Path C:\file.txt -Tail 10
# or: -Last 10 (PS 3.0+)
```

**Read as single string:**
```powershell
Get-Content -Path C:\file.txt -Raw
```

**Monitor file (like tail -f):**
```powershell
Get-Content -Path C:\Logs\app.log -Wait -Tail 10
```

### Set-Content (Write/Overwrite):

**Write to file:**
```powershell
Set-Content -Path C:\file.txt -Value "Hello World"
```

**Write array:**
```powershell
$data = @("Line 1", "Line 2", "Line 3")
Set-Content -Path C:\file.txt -Value $data
```

**Write from pipeline:**
```powershell
Get-Process | Select-Object Name, CPU | Set-Content C:\processes.txt
```

### Add-Content (Append):

**Append to file:**
```powershell
Add-Content -Path C:\file.txt -Value "New line"
```

**Append multiple lines:**
```powershell
Add-Content -Path C:\log.txt -Value "$(Get-Date): Operation completed"
```

### Out-File (Formatted Output):

**Save to file:**
```powershell
Get-Process | Out-File C:\processes.txt
```

**Append:**
```powershell
Get-Service | Out-File C:\services.txt -Append
```

**Encoding:**
```powershell
Get-Content file.txt | Out-File newfile.txt -Encoding UTF8
```

**Width:**
```powershell
Get-Process | Out-File C:\processes.txt -Width 200
```

### Practical File Operations:

**Log function:**
```powershell
function Write-Log {
    param(
        [string]$Message,
        [string]$LogFile = "C:\Logs\script.log"
    )
    
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "[$timestamp] $Message"
    Add-Content -Path $LogFile -Value $logEntry
}

# Usage
Write-Log "Script started"
Write-Log "Processing files..."
Write-Log "Script completed"
```

**Find and replace in file:**
```powershell
$file = "C:\config.txt"
$content = Get-Content $file
$content = $content -replace 'oldvalue', 'newvalue'
Set-Content -Path $file -Value $content
```

**Merge files:**
```powershell
$files = Get-ChildItem C:\Logs\*.log
$combined = foreach ($file in $files) {
    Get-Content $file.FullName
}
Set-Content -Path C:\Logs\combined.log -Value $combined
```

## 5.7 Testing Paths

### Test-Path:

**Check if exists:**
```powershell
Test-Path C:\file.txt
# Returns: True or False
```

**Check file:**
```powershell
Test-Path C:\file.txt -PathType Leaf
```

**Check directory:**
```powershell
Test-Path C:\Folder -PathType Container
```

**With wildcard:**
```powershell
Test-Path C:\Temp\*.log
```

**Registry:**
```powershell
Test-Path HKLM:\SOFTWARE\MyApp
```

### Conditional File Operations:

```powershell
if (Test-Path C:\file.txt) {
    Remove-Item C:\file.txt
}

if (-not (Test-Path C:\Backups)) {
    New-Item -Path C:\Backups -ItemType Directory
}
```

## 5.8 Getting File/Folder Information

### Get-Item:

**File info:**
```powershell
Get-Item C:\file.txt
```

**Properties:**
```powershell
$file = Get-Item C:\file.txt
$file.Name
$file.Length
$file.LastWriteTime
$file.CreationTime
$file.Extension
$file.FullName
$file.Directory
```

**All properties:**
```powershell
Get-Item C:\file.txt | Format-List *
```

### Get-ItemProperty:

**Specific property:**
```powershell
(Get-ItemProperty C:\file.txt).Length
```

### Resolve-Path:

**Get absolute path:**
```powershell
Resolve-Path .\file.txt
```

**Wildcard resolution:**
```powershell
Resolve-Path C:\Windows\*.exe
```

### Split-Path:

**Get parent directory:**
```powershell
Split-Path C:\Folder\file.txt
# Output: C:\Folder
```

**Get filename:**
```powershell
Split-Path C:\Folder\file.txt -Leaf
# Output: file.txt
```

**Get extension:**
```powershell
[System.IO.Path]::GetExtension("C:\file.txt")
# Output: .txt
```

**Get filename without extension:**
```powershell
[System.IO.Path]::GetFileNameWithoutExtension("C:\file.txt")
# Output: file
```

### Join-Path:

**Combine paths:**
```powershell
Join-Path C:\Folder file.txt
# Output: C:\Folder\file.txt
```

**Multiple joins:**
```powershell
Join-Path C:\ -ChildPath Users\Administrator\Documents
```

---

# 6. Variables and Data Types

## 6.1 Creating Variables

### Variable Basics:

**Create variable:**
```powershell
$variableName = value
```

**Examples:**
```powershell
$name = "John"
$age = 30
$price = 19.99
$isActive = $true
```

### Variable Naming Rules:

✅ **Valid:**
```powershell
$myVariable
$my_variable
$MyVariable
$variable123
$_variable
```

❌ **Invalid:**
```powershell
$123variable    # Can't start with number
$my-variable    # Hyphen not allowed
$my variable    # Space not allowed
```

### Variable Scope Prefixes:

```powershell
$local:var      # Local scope
$script:var     # Script scope
$global:var     # Global scope
$private:var    # Private scope
```

## 6.2 Data Types

### Common Data Types:

**String:**
```powershell
$text = "Hello World"
$multiline = @"
Line 1
Line 2
Line 3
"@
```

**Integer:**
```powershell
$number = 42
$largeNum = 1000000
```

**Double (Decimal):**
```powershell
$price = 19.99
$result = 3.14159
```

**Boolean:**
```powershell
$isTrue = $true
$isFalse = $false
```

**Array:**
```powershell
$array = @(1, 2, 3, 4, 5)
$names = @("Alice", "Bob", "Charlie")
$mixed = @(1, "two", 3.0, $true)
```

**Hash Table (Dictionary):**
```powershell
$hashtable = @{
    Name = "John"
    Age = 30
    City = "New York"
}
```

**DateTime:**
```powershell
$now = Get-Date
$specific = [DateTime]"2026-02-13"
```

**Null:**
```powershell
$empty = $null
```

### Type Declaration:

**Explicit typing:**
```powershell
[string]$name = "John"
[int]$age = 30
[double]$price = 19.99
[bool]$active = $true
[DateTime]$date = "2026-02-13"
```

**Type enforcement:**
```powershell
[int]$number = "123"    # Converts string to int
[int]$number = "abc"    # ERROR: Cannot convert
```

### Check Type:

```powershell
$var = 42
$var.GetType()

# Output:
# Name        : Int32
# FullName    : System.Int32
```

**Type name only:**
```powershell
$var.GetType().Name
# Output: Int32
```

## 6.3 Working with Strings

### String Basics:

**Single vs Double Quotes:**
```powershell
# Double quotes: variable expansion
$name = "John"
"Hello, $name"          # Output: Hello, John

# Single quotes: literal
'Hello, $name'          # Output: Hello, $name
```

**Escape characters:**
```powershell
"Line 1`nLine 2"       # Newline
"Column1`tColumn2"     # Tab
"Quote: `"Hello`""     # Quote in string
```

### String Operations:

**Concatenation:**
```powershell
$first = "Hello"
$last = "World"

# Using +
$result = $first + " " + $last

# Using -join
$result = $first, $last -join " "

# Using format
$result = "{0} {1}" -f $first, $last

# Using string interpolation
$result = "$first $last"
```

**Length:**
```powershell
$text = "Hello World"
$text.Length          # Output: 11
```

**Upper/Lower Case:**
```powershell
$text.ToUpper()       # HELLO WORLD
$text.ToLower()       # hello world
```

**Substring:**
```powershell
$text = "Hello World"
$text.Substring(0, 5)             # "Hello"
$text.Substring(6)                # "World"
```

**Replace:**
```powershell
$text = "Hello World"
$text.Replace("World", "PowerShell")    # "Hello PowerShell"
```

**Split:**
```powershell
$text = "apple,banana,orange"
$fruits = $text.Split(",")
# Result: @("apple", "banana", "orange")
```

**Trim:**
```powershell
$text = "  Hello World  "
$text.Trim()          # "Hello World"
$text.TrimStart()     # "Hello World  "
$text.TrimEnd()       # "  Hello World"
```

**Contains/StartsWith/EndsWith:**
```powershell
$text = "Hello World"
$text.Contains("World")           # True
$text.StartsWith("Hello")         # True
$text.EndsWith("World")           # True
```

**String Comparison:**
```powershell
$text1 = "Hello"
$text2 = "hello"

$text1 -eq $text2                 # True (case-insensitive)
$text1 -ceq $text2                # False (case-sensitive)
$text1 -like "H*"                 # True (wildcard)
$text1 -match "^H"                # True (regex)
```

### Here-Strings:

**Multi-line strings:**
```powershell
# Double-quoted (variables expanded)
$name = "John"
$message = @"
Hello, $name
This is a multi-line
string with variables.
"@

# Single-quoted (literal)
$literal = @'
This is literal.
$variables are not expanded.
"Quotes" work fine.
'@
```

## 6.4 Working with Arrays

### Creating Arrays:

```powershell
# Empty array
$empty = @()

# With values
$numbers = @(1, 2, 3, 4, 5)
$names = @("Alice", "Bob", "Charlie")
$mixed = @(1, "two", 3.0, $true)

# Range operator
$range = 1..10          # 1, 2, 3, ..., 10
```

### Accessing Elements:

```powershell
$array = @("a", "b", "c", "d", "e")

$array[0]               # "a" (first element)
$array[-1]              # "e" (last element)
$array[1..3]            # "b", "c", "d" (range)
$array[0,2,4]           # "a", "c", "e" (specific indices)
```

### Array Operations:

**Length:**
```powershell
$array.Length
$array.Count
```

**Add elements:**
```powershell
$array = @(1, 2, 3)
$array += 4              # @(1, 2, 3, 4)
$array += 5, 6           # @(1, 2, 3, 4, 5, 6)
```

**Remove elements:**
```powershell
$array = @(1, 2, 3, 4, 5)
$array = $array -ne 3    # Removes 3
# Result: @(1, 2, 4, 5)
```

**Contains:**
```powershell
$array = @(1, 2, 3)
$array -contains 2       # True
2 -in $array             # True
```

**Sort:**
```powershell
$array = @(5, 2, 8, 1, 9)
$sorted = $array | Sort-Object
# Result: @(1, 2, 5, 8, 9)
```

**Unique:**
```powershell
$array = @(1, 2, 2, 3, 3, 3)
$unique = $array | Select-Object -Unique
# Result: @(1, 2, 3)
```

**Reverse:**
```powershell
$array = @(1, 2, 3, 4, 5)
[array]::Reverse($array)
# Result: @(5, 4, 3, 2, 1)
```

### Array Looping:

**ForEach:**
```powershell
$names = @("Alice", "Bob", "Charlie")

foreach ($name in $names) {
    Write-Host "Hello, $name"
}
```

**For:**
```powershell
$array = @(1, 2, 3, 4, 5)

for ($i = 0; $i -lt $array.Length; $i++) {
    Write-Host $array[$i]
}
```

**ForEach-Object:**
```powershell
$array | ForEach-Object {
    Write-Host $_
}
```

## 6.5 Working with Hash Tables

### Creating Hash Tables:

```powershell
# Empty hash table
$hashtable = @{}

# With values
$person = @{
    Name = "John"
    Age = 30
    City = "New York"
}

# Multi-line
$config = @{
    Server = "SQL01"
    Database = "MyDB"
    Port = 1433
    Timeout = 30
}
```

### Accessing Values:

```powershell
$person = @{
    Name = "John"
    Age = 30
}

$person["Name"]         # "John"
$person.Name            # "John"
$person.Age             # 30
```

### Hash Table Operations:

**Add:**
```powershell
$person["Email"] = "john@example.com"
$person.Phone = "555-1234"
```

**Update:**
```powershell
$person["Age"] = 31
$person.Name = "John Smith"
```

**Remove:**
```powershell
$person.Remove("Email")
```

**Check if key exists:**
```powershell
$person.ContainsKey("Name")      # True
$person.ContainsKey("Email")     # False
```

**Get all keys:**
```powershell
$person.Keys
```

**Get all values:**
```powershell
$person.Values
```

**Count:**
```powershell
$person.Count
```

### Looping Hash Tables:

```powershell
$person = @{
    Name = "John"
    Age = 30
    City = "New York"
}

# Method 1
foreach ($key in $person.Keys) {
    Write-Host "$key : $($person[$key])"
}

# Method 2
$person.GetEnumerator() | ForEach-Object {
    Write-Host "$($_.Key) : $($_.Value)"
}
```

### Ordered Hash Tables:

```powershell
# Maintains insertion order
$ordered = [ordered]@{
    First = 1
    Second = 2
    Third = 3
}
```

## 6.6 Automatic Variables

### Common Automatic Variables:

```powershell
$_                  # Current pipeline object
$PSHome             # PowerShell installation directory
$Home               # User's home directory
$PWD                # Current directory (same as Get-Location)
$true / $false      # Boolean values
$null               # Null value
$Error              # Array of error objects
$?                  # Success status of last command
$^                  # First token of last line
$$$                 # Last token of last line
$Args               # Array of undeclared parameters
$Input              # Enumerator of pipeline input
$MyInvocation       # Information about current command
$PSVersionTable     # PowerShell version information
$Host               # Host program information
$PID                # Process ID
$PSCulture          # Current culture
$PSUICulture        # Current UI culture
$ShellId            # Shell identifier
```

### Examples:

```powershell
# Current object in pipeline
Get-Process | Where-Object {$_.CPU -gt 10}

# PowerShell paths
Write-Host "PowerShell installed in: $PSHome"
Write-Host "Your home directory: $Home"

# Error checking
Get-Service NonExistent -ErrorAction SilentlyContinue
if ($?) {
    Write-Host "Success"
} else {
    Write-Host "Failed"
}

# Last error
$Error[0]

# Process ID
Write-Host "Current PowerShell PID: $PID"
```

## 6.7 Environment Variables

### Accessing Environment Variables:

```powershell
# Method 1: $env:
$env:COMPUTERNAME
$env:USERNAME
$env:PATH
$env:TEMP

# Method 2: [Environment]
[Environment]::GetEnvironmentVariable("PATH")
```

### Common Environment Variables:

```powershell
$env:COMPUTERNAME       # Computer name
$env:USERNAME           # Current user
$env:USERDOMAIN         # Domain name
$env:USERPROFILE        # User profile path
$env:HOMEPATH           # Home directory
$env:TEMP               # Temp directory
$env:TMP                # Temp directory
$env:PATH               # Executable search path
$env:PATHEXT            # Executable extensions
$env:PROGRAMFILES       # Program Files directory
$env:SystemRoot         # Windows directory
$env:WINDIR             # Windows directory
$env:PROCESSOR_ARCHITECTURE  # CPU architecture
$env:NUMBER_OF_PROCESSORS    # CPU count
$env:OS                 # Operating system
```

### Setting Environment Variables:

**Current session:**
```powershell
$env:MYVAR = "MyValue"
```

**Permanent (User):**
```powershell
[Environment]::SetEnvironmentVariable("MYVAR", "MyValue", "User")
```

**Permanent (Machine - requires Admin):**
```powershell
[Environment]::SetEnvironmentVariable("MYVAR", "MyValue", "Machine")
```

### Modifying PATH:

**View PATH:**
```powershell
$env:PATH -split ';'
```

**Add to PATH (session):**
```powershell
$env:PATH += ";C:\MyApp\bin"
```

**Add to PATH (permanent):**
```powershell
$oldPath = [Environment]::GetEnvironmentVariable("PATH", "User")
$newPath = $oldPath + ";C:\MyApp\bin"
[Environment]::SetEnvironmentVariable("PATH", $newPath, "User")
```

### List All Environment Variables:

```powershell
Get-ChildItem Env:
```

---

# 7. Operators and Expressions

## 7.1 Arithmetic Operators

```powershell
+       # Addition
-       # Subtraction
*       # Multiplication
/       # Division
%       # Modulus (remainder)
```

**Examples:**
```powershell
10 + 5          # 15
10 - 5          # 5
10 * 5          # 50
10 / 5          # 2
10 % 3          # 1 (remainder)

# Increment/Decrement
$x = 5
$x++            # 6
$x--            # 5
```

## 7.2 Comparison Operators

### Equality:

```powershell
-eq     # Equal
-ne     # Not equal
-gt     # Greater than
-ge     # Greater than or equal
-lt     # Less than
-le     # Less than or equal
```

**Examples:**
```powershell
5 -eq 5         # True
5 -ne 3         # True
10 -gt 5        # True
10 -ge 10       # True
5 -lt 10        # True
5 -le 5         # True
```

### Case-Sensitive:

```powershell
-ceq    # Case-sensitive equal
-cne    # Case-sensitive not equal
-cgt    # Case-sensitive greater than
-cge    # Case-sensitive greater than or equal
-clt    # Case-sensitive less than
-cle    # Case-sensitive less than or equal
```

**Examples:**
```powershell
"Hello" -eq "hello"     # True (case-insensitive)
"Hello" -ceq "hello"    # False (case-sensitive)
```

### Pattern Matching:

```powershell
-like       # Wildcard match
-notlike    # Wildcard not match
-match      # Regex match
-notmatch   # Regex not match
```

**Examples:**
```powershell
# Wildcard
"PowerShell" -like "Power*"         # True
"PowerShell" -like "*Shell"         # True
"PowerShell" -notlike "Bash*"       # True

# Regex
"PowerShell" -match "^Power"        # True
"PowerShell" -match "Shell$"        # True
"ABC123" -match "\d+"               # True
```

### Containment:

```powershell
-contains       # Collection contains value
-notcontains    # Collection doesn't contain value
-in             # Value in collection
-notin          # Value not in collection
```

**Examples:**
```powershell
$array = @(1, 2, 3, 4, 5)

$array -contains 3      # True
$array -notcontains 10  # True
3 -in $array            # True
10 -notin $array        # True
```

## 7.3 Logical Operators

```powershell
-and    # Logical AND
-or     # Logical OR
-xor    # Logical XOR
-not    # Logical NOT
!       # Logical NOT (alias)
```

**Examples:**
```powershell
($true -and $true)      # True
($true -and $false)     # False
($true -or $false)      # True
($false -or $false)     # False
($true -xor $true)      # False
($true -xor $false)     # True
-not $true              # False
!$false                 # True

# Combined
(5 -gt 3) -and (10 -lt 20)      # True
(5 -eq 5) -or (10 -eq 20)       # True
```

## 7.4 Assignment Operators

```powershell
=       # Assign
+=      # Add and assign
-=      # Subtract and assign
*=      # Multiply and assign
/=      # Divide and assign
%=      # Modulus and assign
```

**Examples:**
```powershell
$x = 10
$x += 5         # $x = 15
$x -= 3         # $x = 12
$x *= 2         # $x = 24
$x /= 4         # $x = 6
$x %= 4         # $x = 2
```

## 7.5 String Operators

```powershell
-f      # Format operator
-join   # Join array into string
-split  # Split string into array
-replace # Replace substring
```

**Examples:**
```powershell
# Format
"{0} is {1} years old" -f "John", 30
# Output: John is 30 years old

# Join
$array = @("a", "b", "c")
$array -join ","        # "a,b,c"
$array -join " and "    # "a and b and c"

# Split
"a,b,c" -split ","      # @("a", "b", "c")
"a b c" -split " "      # @("a", "b", "c")

# Replace
"Hello World" -replace "World", "PowerShell"
# Output: Hello PowerShell
```

## 7.6 Type Operators

```powershell
-is     # Is of type
-isnot  # Is not of type
-as     # Convert to type
```

**Examples:**
```powershell
$x = 42
$x -is [int]            # True
$x -isnot [string]      # True

$text = "123"
$number = $text -as [int]   # Converts to int
```

## 7.7 Special Operators

### Range Operator:

```powershell
1..10       # 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
10..1       # 10, 9, 8, 7, 6, 5, 4, 3, 2, 1
```

### Call Operator:

```powershell
& "C:\Program Files\app.exe"
& ".\myscript.ps1"
```

### Dot Source Operator:

```powershell
. .\functions.ps1       # Load functions into current scope
```

### Subexpression Operator:

```powershell
# Execute expression and return result
$message = "You have $(Get-ChildItem *.txt | Measure-Object).Count txt files"
```

### Array Subexpression:

```powershell
# Force result to be array
$result = @(Get-Service -Name NonExistent -ErrorAction SilentlyContinue)
# Even if null, $result is an array
```

---

# 8. Control Flow Structures

## 8.1 If/ElseIf/Else

### Basic If:

```powershell
if (condition) {
    # Code
}
```

**Example:**
```powershell
$number = 10

if ($number -gt 5) {
    Write-Host "$number is greater than 5"
}
```

### If/Else:

```powershell
if (condition) {
    # Code if true
} else {
    # Code if false
}
```

**Example:**
```powershell
$age = 20

if ($age -ge 18) {
    Write-Host "Adult"
} else {
    Write-Host "Minor"
}
```

### If/ElseIf/Else:

```powershell
if (condition1) {
    # Code
} elseif (condition2) {
    # Code
} else {
    # Code
}
```

**Example:**
```powershell
$score = 85

if ($score -ge 90) {
    Write-Host "Grade: A"
} elseif ($score -ge 80) {
    Write-Host "Grade: B"
} elseif ($score -ge 70) {
    Write-Host "Grade: C"
} else {
    Write-Host "Grade: F"
}
```

### Multiple Conditions:

```powershell
$age = 25
$hasLicense = $true

if ($age -ge 18 -and $hasLicense) {
    Write-Host "Can drive"
} else {
    Write-Host "Cannot drive"
}
```

## 8.2 Switch Statement

### Basic Switch:

```powershell
switch (value) {
    condition1 { code }
    condition2 { code }
    default { code }
}
```

**Example:**
```powershell
$day = "Monday"

switch ($day) {
    "Monday" { Write-Host "Start of week" }
    "Friday" { Write-Host "TGIF!" }
    "Saturday" { Write-Host "Weekend!" }
    "Sunday" { Write-Host "Weekend!" }
    default { Write-Host "Midweek" }
}
```

### Switch with Wildcards:

```powershell
switch -Wildcard ($name) {
    "John*" { Write-Host "Name starts with John" }
    "*Smith" { Write-Host "Last name is Smith" }
    default { Write-Host "Other name" }
}
```

### Switch with Regex:

```powershell
switch -Regex ($input) {
    "^\d+$" { Write-Host "Number" }
    "^[a-zA-Z]+$" { Write-Host "Letters only" }
    default { Write-Host "Mixed" }
}
```

### Switch with Array:

```powershell
switch (@(1,2,3,4,5)) {
    {$_ -gt 3} { Write-Host "$_ is greater than 3" }
    {$_ -le 2} { Write-Host "$_ is less than or equal to 2" }
}
```

## 8.3 For Loop

```powershell
for (initialization; condition; increment) {
    # Code
}
```

**Example:**
```powershell
for ($i = 0; $i -lt 10; $i++) {
    Write-Host "Count: $i"
}
```

**Decrement:**
```powershell
for ($i = 10; $i -gt 0; $i--) {
    Write-Host "Countdown: $i"
}
```

**Step by 2:**
```powershell
for ($i = 0; $i -le 20; $i += 2) {
    Write-Host $i  # 0, 2, 4, 6, ..., 20
}
```

## 8.4 ForEach Loop

```powershell
foreach ($item in $collection) {
    # Code
}
```

**Example:**
```powershell
$names = @("Alice", "Bob", "Charlie")

foreach ($name in $names) {
    Write-Host "Hello, $name"
}
```

**With counter:**
```powershell
$items = @("apple", "banana", "orange")
$counter = 1

foreach ($item in $items) {
    Write-Host "$counter. $item"
    $counter++
}
```

## 8.5 While Loop

```powershell
while (condition) {
    # Code
}
```

**Example:**
```powershell
$count = 0

while ($count -lt 5) {
    Write-Host "Count: $count"
    $count++
}
```

**Infinite loop (break to exit):**
```powershell
while ($true) {
    $input = Read-Host "Enter 'quit' to exit"
    if ($input -eq 'quit') {
        break
    }
    Write-Host "You entered: $input"
}
```

## 8.6 Do-While Loop

```powershell
do {
    # Code (runs at least once)
} while (condition)
```

**Example:**
```powershell
$count = 0

do {
    Write-Host "Count: $count"
    $count++
} while ($count -lt 5)
```

## 8.7 Do-Until Loop

```powershell
do {
    # Code (runs at least once)
} until (condition)
```

**Example:**
```powershell
$number = 0

do {
    $number++
    Write-Host "Number: $number"
} until ($number -ge 5)
```

## 8.8 Break and Continue

### Break:

**Exit loop:**
```powershell
for ($i = 0; $i -lt 10; $i++) {
    if ($i -eq 5) {
        break  # Exit loop when i = 5
    }
    Write-Host $i
}
# Output: 0, 1, 2, 3, 4
```

### Continue:

**Skip to next iteration:**
```powershell
for ($i = 0; $i -lt 10; $i++) {
    if ($i % 2 -eq 0) {
        continue  # Skip even numbers
    }
    Write-Host $i
}
# Output: 1, 3, 5, 7, 9
```

### Break with Label:

```powershell
:outer for ($i = 0; $i -lt 3; $i++) {
    for ($j = 0; $j -lt 3; $j++) {
        if ($i -eq 1 -and $j -eq 1) {
            break outer  # Break outer loop
        }
        Write-Host "i=$i, j=$j"
    }
}
```

---

# 9. Functions and Script Blocks

## 9.1 Basic Functions

### Simple Function:

```powershell
function FunctionName {
    # Code
}
```

**Example:**
```powershell
function Say-Hello {
    Write-Host "Hello, World!"
}

# Call function
Say-Hello
```

### Function with Parameters:

```powershell
function Say-Hello {
    param(
        [string]$Name
    )
    Write-Host "Hello, $Name!"
}

# Call
Say-Hello -Name "John"
```

### Multiple Parameters:

```powershell
function Add-Numbers {
    param(
        [int]$Num1,
        [int]$Num2
    )
    $result = $Num1 + $Num2
    Write-Host "Result: $result"
}

# Call
Add-Numbers -Num1 10 -Num2 20
```

### Return Values:

```powershell
function Get-Sum {
    param(
        [int]$Num1,
        [int]$Num2
    )
    return $Num1 + $Num2
}

$result = Get-Sum -Num1 5 -Num2 3
Write-Host "Sum: $result"
```

## 9.2 Advanced Functions

### Full Function Structure:

```powershell
function Verb-Noun {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [string]$Name,
        
        [Parameter()]
        [int]$Age = 0
    )
    
    begin {
        # Initialization
        Write-Verbose "Starting function"
    }
    
    process {
        # Main logic
        Write-Host "Name: $Name, Age: $Age"
    }
    
    end {
        # Cleanup
        Write-Verbose "Function complete"
    }
}
```

### Parameter Attributes:

```powershell
function Test-Parameters {
    param(
        # Mandatory
        [Parameter(Mandatory=$true)]
        [string]$Required,
        
        # With default value
        [Parameter()]
        [int]$Optional = 10,
        
        # Validation
        [Parameter()]
        [ValidateSet("Low", "Medium", "High")]
        [string]$Priority,
        
        # Value range
        [Parameter()]
        [ValidateRange(1,100)]
        [int]$Percentage,
        
        # Not null or empty
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]$Text,
        
        # Pattern validation
        [Parameter()]
        [ValidatePattern("^\d{3}-\d{3}-\d{4}$")]
        [string]$PhoneNumber,
        
        # Script validation
        [Parameter()]
        [ValidateScript({$_ -gt 0})]
        [int]$PositiveNumber,
        
        # Pipeline input
        [Parameter(ValueFromPipeline=$true)]
        [string]$InputObject
    )
    
    process {
        # Function code
    }
}
```

### Pipeline Functions:

```powershell
function Get-SquareRoot {
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline=$true)]
        [double]$Number
    )
    
    process {
        [Math]::Sqrt($Number)
    }
}

# Usage
1..10 | Get-SquareRoot
```

### Comment-Based Help:

```powershell
function Get-SystemInfo {
    <#
    .SYNOPSIS
        Gets system information
    
    .DESCRIPTION
        Retrieves detailed system information including OS, CPU, and memory
    
    .PARAMETER ComputerName
        Name of the computer to query
    
    .EXAMPLE
        Get-SystemInfo
        Gets info for local computer
    
    .EXAMPLE
        Get-SystemInfo -ComputerName SERVER01
        Gets info for remote computer
    
    .NOTES
        Author: Admin
        Date: 2026-02-13
        Version: 1.0
    #>
    [CmdletBinding()]
    param(
        [Parameter()]
        [string]$ComputerName = $env:COMPUTERNAME
    )
    
    # Function code
    $os = Get-CimInstance Win32_OperatingSystem -ComputerName $ComputerName
    $cpu = Get-CimInstance Win32_Processor -ComputerName $ComputerName
    
    [PSCustomObject]@{
        ComputerName = $ComputerName
        OS = $os.Caption
        Version = $os.Version
        CPU = $cpu.Name
        Cores = $cpu.NumberOfCores
        Memory = "{0:N2} GB" -f ($os.TotalVisibleMemorySize/1MB)
    }
}
```

## 9.3 Script Blocks

### Basic Script Block:

```powershell
$scriptBlock = {
    Write-Host "This is a script block"
    Get-Date
}

# Execute
& $scriptBlock
```

### Script Block with Parameters:

```powershell
$scriptBlock = {
    param($Name, $Age)
    Write-Host "$Name is $Age years old"
}

# Execute
& $scriptBlock -Name "John" -Age 30
```

### Using $using:

```powershell
$name = "John"

$scriptBlock = {
    Write-Host "Hello, $using:name"
}

Invoke-Command -ScriptBlock $scriptBlock
```

## 9.4 Practical Function Examples

### Get-FolderSize:

```powershell
function Get-FolderSize {
    <#
    .SYNOPSIS
        Calculate folder size
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [string]$Path
    )
    
    if (-not (Test-Path $Path)) {
        Write-Error "Path not found: $Path"
        return
    }
    
    $size = (Get-ChildItem $Path -Recurse -File | Measure-Object -Property Length -Sum).Sum
    $sizeGB = [math]::Round($size/1GB, 2)
    
    [PSCustomObject]@{
        Path = $Path
        SizeGB = $sizeGB
        FileCount = (Get-ChildItem $Path -Recurse -File).Count
        FolderCount = (Get-ChildItem $Path -Recurse -Directory).Count
    }
}

# Usage
Get-FolderSize -Path C:\Windows
```

### Test-Port:

```powershell
function Test-Port {
    <#
    .SYNOPSIS
        Test if port is open
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [string]$ComputerName,
        
        [Parameter(Mandatory=$true)]
        [int]$Port,
        
        [Parameter()]
        [int]$Timeout = 1000
    )
    
    $tcp = New-Object System.Net.Sockets.TcpClient
    $connect = $tcp.BeginConnect($ComputerName, $Port, $null, $null)
    $wait = $connect.AsyncWaitHandle.WaitOne($Timeout, $false)
    
    if ($wait) {
        try {
            $tcp.EndConnect($connect) | Out-Null
            $result = $true
        } catch {
            $result = $false
        }
    } else {
        $result = $false
    }
    
    $tcp.Close()
    
    [PSCustomObject]@{
        ComputerName = $ComputerName
        Port = $Port
        Open = $result
        TestedAt = Get-Date
    }
}

# Usage
Test-Port -ComputerName "google.com" -Port 80
```

---

**[Document continues...]**

Due to space, I'll save this portion and continue with remaining sections. Let me proceed:

# 10. Error Handling

## 10.1 Try/Catch/Finally

### Basic Try/Catch:

```powershell
try {
    # Code that might fail
    Get-Content C:\NonExistent.txt
} catch {
    # Handle error
    Write-Host "Error occurred: $($_.Exception.Message)" -ForegroundColor Red
}
```

### Try/Catch/Finally:

```powershell
try {
    # Code
    $file = [System.IO.File]::Open("C:\file.txt", 'Open', 'Read')
    # Read file...
} catch {
    Write-Host "Error: $($_.Exception.Message)"
} finally {
    # Always executes (cleanup)
    if ($file) {
        $file.Close()
    }
}
```

### Multiple Catch Blocks:

```powershell
try {
    Get-Content C:\file.txt
} catch [System.IO.FileNotFoundException] {
    Write-Host "File not found"
} catch [System.UnauthorizedAccessException] {
    Write-Host "Access denied"
} catch {
    Write-Host "Unknown error: $($_.Exception.Message)"
}
```

## 10.2 Error Variables

```powershell
# $Error - Array of all errors
$Error[0]               # Most recent error
$Error.Count            # Total errors
$Error.Clear()          # Clear error history

# $_ in catch block
catch {
    $_.Exception        # Exception object
    $_.Exception.Message    # Error message
    $_.InvocationInfo.ScriptLineNumber  # Line number
    $_.InvocationInfo.ScriptName        # Script file
}
```

## 10.3 ErrorAction Parameter

```powershell
# Stop - Terminate on error
Get-Content BadFile.txt -ErrorAction Stop

# Continue - Display error and continue (default)
Get-Content BadFile.txt -ErrorAction Continue

# SilentlyContinue - Suppress error and continue
Get-Content BadFile.txt -ErrorAction SilentlyContinue

# Inquire - Prompt user
Get-Content BadFile.txt -ErrorAction Inquire

# Ignore - Completely ignore error
Get-Content BadFile.txt -ErrorAction Ignore
```

## 10.4 $ErrorActionPreference

```powershell
# Set default error action for session
$ErrorActionPreference = "Stop"      # Stop on all errors
$ErrorActionPreference = "Continue"  # Default

# In script
$ErrorActionPreference = "Stop"
try {
    # All cmdlets will stop on error
    Get-Content BadFile.txt
} catch {
    Write-Host "Caught: $($_.Exception.Message)"
}
```

## 10.5 Throw

```powershell
function Divide-Number {
    param([int]$Numerator, [int]$Denominator)
    
    if ($Denominator -eq 0) {
        throw "Cannot divide by zero!"
    }
    
    return $Numerator / $Denominator
}

try {
    Divide-Number -Numerator 10 -Denominator 0
} catch {
    Write-Host "Error: $_"
}
```

---

# 11. PowerShell Remoting

## 11.1 Enable Remoting

### On Target Computer:

```powershell
# Enable remoting (run as Administrator)
Enable-PSRemoting -Force

# This does:
# 1. Starts WinRM service
# 2. Sets WinRM to automatic startup
# 3. Creates firewall rules
# 4. Creates listener
```

### Verify Configuration:

```powershell
Test-WSMan
Test-WSMan -ComputerName SERVER01
```

## 11.2 One-to-One Remoting

### Interactive Session:

```powershell
# Enter remote session
Enter-PSSession -ComputerName SERVER01

# You're now on SERVER01
# Prompt changes to: [SERVER01]: PS C:\Users\Admin\Documents>

# Run commands on remote computer
Get-Process
Get-Service

# Exit session
Exit-PSSession
```

### With Credentials:

```powershell
$cred = Get-Credential
Enter-PSSession -ComputerName SERVER01 -Credential $cred
```

## 11.3 One-to-Many Remoting

### Invoke-Command:

**Single computer:**
```powershell
Invoke-Command -ComputerName SERVER01 -ScriptBlock {
    Get-Service -Name wuauserv
}
```

**Multiple computers:**
```powershell
$servers = @("SERVER01", "SERVER02", "SERVER03")

Invoke-Command -ComputerName $servers -ScriptBlock {
    Get-Service | Where-Object {$_.Status -eq 'Running'} | Measure-Object
}
```

**With credentials:**
```powershell
$cred = Get-Credential
Invoke-Command -ComputerName SERVER01 -Credential $cred -ScriptBlock {
    Get-Process
}
```

### Passing Variables:

```powershell
$serviceName = "wuauserv"

Invoke-Command -ComputerName SERVER01 -ScriptBlock {
    param($Name)
    Get-Service -Name $Name
} -ArgumentList $serviceName
```

### Using $using:

```powershell
$serviceName = "wuauserv"

Invoke-Command -ComputerName SERVER01 -ScriptBlock {
    Get-Service -Name $using:serviceName
}
```

## 11.4 Persistent Sessions

### New-PSSession:

```powershell
# Create session
$session = New-PSSession -ComputerName SERVER01

# Use session
Invoke-Command -Session $session -ScriptBlock {
    $var = "Hello"
}

Invoke-Command -Session $session -ScriptBlock {
    # $var still exists
    Write-Host $var
}

# Remove session
Remove-PSSession $session
```

### Multiple Sessions:

```powershell
$servers = "SERVER01", "SERVER02", "SERVER03"
$sessions = New-PSSession -ComputerName $servers

# Run command on all
Invoke-Command -Session $sessions -ScriptBlock {
    Get-Service wuauserv
}

# Clean up
Remove-PSSession $sessions
```

## 11.5 Practical Remoting Examples

### Get Disk Space from Multiple Servers:

```powershell
$servers = @("SERVER01", "SERVER02", "SERVER03")

Invoke-Command -ComputerName $servers -ScriptBlock {
    Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" | 
        Select-Object @{N='ComputerName';E={$env:COMPUTERNAME}},
                      DeviceID,
                      @{N='SizeGB';E={[math]::Round($_.Size/1GB,2)}},
                      @{N='FreeGB';E={[math]::Round($_.FreeSpace/1GB,2)}},
                      @{N='PercentFree';E={[math]::Round(($_.FreeSpace/$_.Size)*100,2)}}
} | Format-Table -AutoSize
```

### Install Windows Feature on Multiple Servers:

```powershell
$servers = @("SERVER01", "SERVER02")

Invoke-Command -ComputerName $servers -ScriptBlock {
    Install-WindowsFeature -Name Web-Server -IncludeManagementTools
}
```

---

# 12. Working with Objects

## 12.1 Understanding Objects

### Object Structure:

```powershell
# Get an object
$service = Get-Service -Name wuauserv

# View all properties and methods
$service | Get-Member

# Properties (data)
$service.Name
$service.Status
$service.StartType

# Methods (actions)
$service.Start()
$service.Stop()
$service.Refresh()
```

## 12.2 Select-Object

### Select Properties:

```powershell
Get-Process | Select-Object Name, CPU, WS
```

### Calculated Properties:

```powershell
Get-Process | Select-Object Name,
    @{Name='CPU(sec)';Expression={$_.CPU}},
    @{Name='Memory(MB)';Expression={[math]::Round($_.WS/1MB,2)}}
```

### First/Last/Unique:

```powershell
Get-Process | Select-Object -First 10
Get-Process | Select-Object -Last 5
Get-Service | Select-Object -Unique Status
```

## 12.3 Where-Object

### Filter Objects:

```powershell
# Long form
Get-Service | Where-Object {$_.Status -eq 'Running'}

# Short form (PS 3.0+)
Get-Service | Where Status -eq 'Running'

# Multiple conditions
Get-Process | Where-Object {$_.CPU -gt 10 -and $_.WS -gt 100MB}
```

## 12.4 ForEach-Object

### Process Each Object:

```powershell
Get-Process | ForEach-Object {
    Write-Host "$($_.Name) uses $($_.CPU) CPU"
}

# Short form
Get-Process | % { Write-Host $_.Name }
```

## 12.5 Creating Custom Objects

### PSCustomObject:

```powershell
$obj = [PSCustomObject]@{
    Name = "John"
    Age = 30
    Department = "IT"
}

$obj
$obj.Name
$obj | Get-Member
```

### Array of Custom Objects:

```powershell
$users = @(
    [PSCustomObject]@{Name="Alice"; Age=25; Dept="Sales"}
    [PSCustomObject]@{Name="Bob"; Age=30; Dept="IT"}
    [PSCustomObject]@{Name="Charlie"; Age=35; Dept="HR"}
)

$users | Format-Table
$users | Where-Object {$_.Age -gt 28}
```

---

# 13. Modules and Package Management

## 13.1 Working with Modules

### List Available Modules:

```powershell
Get-Module -ListAvailable
```

### Import Module:

```powershell
Import-Module ModuleName

# Examples
Import-Module ActiveDirectory
Import-Module ServerManager
Import-Module NetAdapter
```

### List Imported Modules:

```powershell
Get-Module
```

### Remove Module:

```powershell
Remove-Module ModuleName
```

### Find Module Commands:

```powershell
Get-Command -Module ActiveDirectory
Get-Command -Module NetAdapter
```

## 13.2 PowerShell Gallery

### Find Modules:

```powershell
Find-Module -Name *Azure*
Find-Module -Tag "Security"
```

### Install Module:

```powershell
Install-Module -Name ModuleName

# Examples
Install-Module -Name Az
Install-Module -Name Pester
Install-Module -Name PSWindowsUpdate
```

### Update Module:

```powershell
Update-Module -Name ModuleName
Update-Module  # Update all
```

### Uninstall Module:

```powershell
Uninstall-Module -Name ModuleName
```

---

# 14. Working with Services

## 14.1 Get-Service

### List Services:

```powershell
Get-Service

# Running only
Get-Service | Where-Object {$_.Status -eq 'Running'}

# Stopped only
Get-Service | Where-Object {$_.Status -eq 'Stopped'}
```

### Specific Service:

```powershell
Get-Service -Name wuauserv
Get-Service -DisplayName "Windows Update"
```

### Multiple Services:

```powershell
Get-Service -Name wuauserv, spooler, bits
```

### Wildcard:

```powershell
Get-Service -Name Win*
```

### Remote Computer:

```powershell
Get-Service -ComputerName SERVER01
Get-Service -Name wuauserv -ComputerName SERVER01, SERVER02
```

## 14.2 Service Status Operations

### Start Service:

```powershell
Start-Service -Name wuauserv

# Multiple services
Start-Service -Name wuauserv, spooler

# With PassThru (show result)
Start-Service -Name wuauserv -PassThru
```

### Stop Service:

```powershell
Stop-Service -Name wuauserv

# Force stop
Stop-Service -Name wuauserv -Force
```

### Restart Service:

```powershell
Restart-Service -Name wuauserv
```

### Suspend/Resume Service:

```powershell
Suspend-Service -Name ServiceName
Resume-Service -Name ServiceName
```

## 14.3 Service Configuration

### Set Startup Type:

```powershell
Set-Service -Name wuauserv -StartupType Automatic
Set-Service -Name wuauserv -StartupType Manual
Set-Service -Name wuauserv -StartupType Disabled
```

### Set Display Name/Description:

```powershell
Set-Service -Name MyService -DisplayName "My Custom Service"
Set-Service -Name MyService -Description "This is my service"
```

## 14.4 Practical Service Examples

### Stop All Print Spooler Services on Multiple Servers:

```powershell
$servers = @("SERVER01", "SERVER02", "SERVER03")

Invoke-Command -ComputerName $servers -ScriptBlock {
    Stop-Service -Name Spooler -Force
}
```

### Find Services Not Set to Automatic:

```powershell
Get-Service | Where-Object {
    $_.StartType -ne 'Automatic' -and 
    $_.Status -eq 'Running'
} | Select-Object Name, StartType, Status
```

### Service Report:

```powershell
Get-Service | Group-Object Status | 
    Select-Object @{N='Status';E={$_.Name}}, Count | 
    Format-Table -AutoSize
```

---

# 15. Managing Processes

## 15.1 Get-Process

### List Processes:

```powershell
Get-Process

# Sort by CPU
Get-Process | Sort-Object CPU -Descending | Select-Object -First 10

# Sort by Memory
Get-Process | Sort-Object WS -Descending | Select-Object -First 10
```

### Specific Process:

```powershell
Get-Process -Name chrome
Get-Process -Name notepad*
Get-Process -Id 1234
```

### Process Details:

```powershell
$proc = Get-Process -Name powershell
$proc.Id                # Process ID
$proc.CPU               # CPU seconds
$proc.WS                # Working Set (memory)
$proc.Threads.Count     # Thread count
$proc.StartTime         # Start time
$proc.Path              # Executable path
```

### Remote Processes:

```powershell
Get-Process -ComputerName SERVER01
```

## 15.2 Start-Process

### Start Application:

```powershell
Start-Process notepad

# With arguments
Start-Process notepad -ArgumentList "C:\file.txt"

# As Administrator
Start-Process powershell -Verb RunAs

# Hidden window
Start-Process app.exe -WindowStyle Hidden

# Wait for exit
Start-Process app.exe -Wait
```

### Start and Redirect Output:

```powershell
Start-Process ping -ArgumentList "google.com" `
    -RedirectStandardOutput "C:\output.txt" `
    -NoNewWindow -Wait
```

## 15.3 Stop-Process

### Stop Process:

```powershell
# By name
Stop-Process -Name notepad

# By ID
Stop-Process -Id 1234

# Force stop
Stop-Process -Name chrome -Force

# Multiple processes
Stop-Process -Name notepad, chrome
```

### With Confirmation:

```powershell
Stop-Process -Name chrome -Confirm
```

## 15.4 Practical Process Examples

### Kill All Instances of Application:

```powershell
Get-Process -Name chrome | Stop-Process -Force
```

### Find Resource-Intensive Processes:

```powershell
Get-Process | Where-Object {$_.CPU -gt 100} | 
    Select-Object Name, CPU, @{N='Memory(MB)';E={[math]::Round($_.WS/1MB,2)}} |
    Sort-Object CPU -Descending
```

### Process Report:

```powershell
Get-Process | Group-Object Company | 
    Where-Object {$_.Name -ne ''} |
    Select-Object Name, Count |
    Sort-Object Count -Descending |
    Select-Object -First 10
```

---

# 16. Registry Operations

## 16.1 Navigate Registry

### Change to Registry:

```powershell
# Navigate to HKEY_LOCAL_MACHINE
Set-Location HKLM:\

# Navigate to HKEY_CURRENT_USER
Set-Location HKCU:\

# Create HKCR drive if needed
New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT
Set-Location HKCR:\
```

### List Registry Keys:

```powershell
Get-ChildItem HKLM:\SOFTWARE
Get-ChildItem HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion
```

## 16.2 Read Registry Values

### Get-ItemProperty:

```powershell
# Read value
Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -Name ProductName

# Read all values
Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion"

# Specific value
(Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion").ProductName
```

### Get-Item:

```powershell
# Get registry key
Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion"
```

## 16.3 Create Registry Keys/Values

### New-Item (Create Key):

```powershell
# Create registry key
New-Item -Path "HKLM:\SOFTWARE\MyApp"

# Create nested keys
New-Item -Path "HKLM:\SOFTWARE\MyApp\Settings" -Force
```

### New-ItemProperty (Create Value):

```powershell
# Create string value
New-ItemProperty -Path "HKLM:\SOFTWARE\MyApp" -Name "Version" -Value "1.0" -PropertyType String

# Create DWORD value
New-ItemProperty -Path "HKLM:\SOFTWARE\MyApp" -Name "Enabled" -Value 1 -PropertyType DWord

# Create binary value
New-ItemProperty -Path "HKLM:\SOFTWARE\MyApp" -Name "Data" -Value ([byte[]](0x01,0x02,0x03)) -PropertyType Binary
```

### Property Types:

- String
- ExpandString
- Binary
- DWord
- MultiString
- QWord

## 16.4 Modify Registry Values

### Set-ItemProperty:

```powershell
# Modify value
Set-ItemProperty -Path "HKLM:\SOFTWARE\MyApp" -Name "Version" -Value "2.0"

# Modify multiple values
Set-ItemProperty -Path "HKLM:\SOFTWARE\MyApp" -Name "Version" -Value "2.0"
Set-ItemProperty -Path "HKLM:\SOFTWARE\MyApp" -Name "Enabled" -Value 1
```

## 16.5 Delete Registry Keys/Values

### Remove-Item:

```powershell
# Delete key
Remove-Item -Path "HKLM:\SOFTWARE\MyApp"

# Delete key and all subkeys
Remove-Item -Path "HKLM:\SOFTWARE\MyApp" -Recurse
```

### Remove-ItemProperty:

```powershell
# Delete value
Remove-ItemProperty -Path "HKLM:\SOFTWARE\MyApp" -Name "Version"
```

## 16.6 Test Registry Existence

```powershell
# Test if key exists
Test-Path "HKLM:\SOFTWARE\MyApp"

# Test if value exists
if (Get-ItemProperty -Path "HKLM:\SOFTWARE\MyApp" -Name "Version" -ErrorAction SilentlyContinue) {
    Write-Host "Version value exists"
}
```

## 16.7 Practical Registry Examples

### Enable Remote Desktop:

```powershell
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' `
    -Name "fDenyTSConnections" -Value 0

Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
```

### Disable Windows Update:

```powershell
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" `
    -Name "NoAutoUpdate" -Value 1
```

### Get Installed Programs:

```powershell
Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* |
    Select-Object DisplayName, DisplayVersion, Publisher, InstallDate |
    Where-Object {$_.DisplayName -ne $null} |
    Sort-Object DisplayName
```

---

# 17. Network Management

## 17.1 Network Adapters

### Get-NetAdapter:

```powershell
# List all adapters
Get-NetAdapter

# Enabled only
Get-NetAdapter | Where-Object {$_.Status -eq 'Up'}

# Specific adapter
Get-NetAdapter -Name "Ethernet"
```

### Enable/Disable Adapter:

```powershell
# Disable
Disable-NetAdapter -Name "Ethernet" -Confirm:$false

# Enable
Enable-NetAdapter -Name "Ethernet"
```

### Rename Adapter:

```powershell
Rename-NetAdapter -Name "Ethernet" -NewName "LAN"
```

## 17.2 IP Configuration

### Get-NetIPAddress:

```powershell
# All IP addresses
Get-NetIPAddress

# IPv4 only
Get-NetIPAddress -AddressFamily IPv4

# Specific adapter
Get-NetIPAddress -InterfaceAlias "Ethernet"
```

### Set Static IP:

```powershell
# Remove DHCP
Remove-NetIPAddress -InterfaceAlias "Ethernet" -Confirm:$false

# Set static IP
New-NetIPAddress -InterfaceAlias "Ethernet" `
    -IPAddress "192.168.1.10" `
    -PrefixLength 24 `
    -DefaultGateway "192.168.1.1"

# Set DNS
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" `
    -ServerAddresses ("8.8.8.8","8.8.4.4")
```

### Enable DHCP:

```powershell
Set-NetIPInterface -InterfaceAlias "Ethernet" -Dhcp Enabled
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ResetServerAddresses
```

## 17.3 DNS Configuration

### Get DNS Servers:

```powershell
Get-DnsClientServerAddress -InterfaceAlias "Ethernet"
```

### Set DNS Servers:

```powershell
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" `
    -ServerAddresses ("8.8.8.8","8.8.4.4")

# Primary only
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" `
    -ServerAddresses "8.8.8.8"
```

### Clear DNS Cache:

```powershell
Clear-DnsClientCache
```

### DNS Lookup:

```powershell
Resolve-DnsName google.com
Resolve-DnsName -Name google.com -Type A
```

## 17.4 Firewall Management

### Get Firewall Rules:

```powershell
Get-NetFirewallRule

# Enabled only
Get-NetFirewallRule | Where-Object {$_.Enabled -eq $true}

# Specific rule
Get-NetFirewallRule -Name "RemoteDesktop-UserMode-In-TCP"

# Search by display name
Get-NetFirewallRule -DisplayName "*Remote Desktop*"
```

### Enable/Disable Rules:

```powershell
# Enable
Enable-NetFirewallRule -DisplayName "Remote Desktop - User Mode (TCP-In)"

# Disable
Disable-NetFirewallRule -DisplayName "Remote Desktop - User Mode (TCP-In)"
```

### Create Firewall Rule:

```powershell
New-NetFirewallRule -DisplayName "Allow Port 8080" `
    -Direction Inbound `
    -LocalPort 8080 `
    -Protocol TCP `
    -Action Allow
```

### Remove Firewall Rule:

```powershell
Remove-NetFirewallRule -DisplayName "Allow Port 8080"
```

### Firewall Profile:

```powershell
# Get firewall status
Get-NetFirewallProfile

# Disable firewall (Domain profile)
Set-NetFirewallProfile -Profile Domain -Enabled False

# Enable firewall
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True
```

## 17.5 Network Testing

### Test-Connection (Ping):

```powershell
# Ping host
Test-Connection google.com

# Count and quiet
Test-Connection google.com -Count 4 -Quiet

# Multiple computers
Test-Connection google.com, 8.8.8.8

# As job
Test-Connection google.com -AsJob
```

### Test-NetConnection:

```powershell
# Test connectivity
Test-NetConnection google.com

# Test specific port
Test-NetConnection google.com -Port 80

# Detailed trace route
Test-NetConnection google.com -TraceRoute

# Detailed diagnostic
Test-NetConnection google.com -InformationLevel Detailed
```

## 17.6 Practical Network Examples

### Get Network Configuration:

```powershell
Get-NetAdapter | ForEach-Object {
    $adapter = $_
    $ip = Get-NetIPAddress -InterfaceIndex $adapter.ifIndex -AddressFamily IPv4
    $dns = Get-DnsClientServerAddress -InterfaceIndex $adapter.ifIndex -AddressFamily IPv4
    
    [PSCustomObject]@{
        Name = $adapter.Name
        Status = $adapter.Status
        IPAddress = $ip.IPAddress
        Gateway = (Get-NetRoute -InterfaceIndex $adapter.ifIndex -DestinationPrefix "0.0.0.0/0").NextHop
        DNS = $dns.ServerAddresses -join ", "
    }
}
```

### Test Port Connectivity:

```powershell
$servers = @{
    "google.com" = 80
    "microsoft.com" = 443
    "192.168.1.1" = 22
}

foreach ($server in $servers.GetEnumerator()) {
    $result = Test-NetConnection -ComputerName $server.Key -Port $server.Value -InformationLevel Quiet
    [PSCustomObject]@{
        Server = $server.Key
        Port = $server.Value
        Open = $result
    }
}
```

---

# 18. User and Group Management

## 18.1 Local Users

### Get Local Users:

```powershell
Get-LocalUser

# Specific user
Get-LocalUser -Name Administrator

# Enabled only
Get-LocalUser | Where-Object {$_.Enabled -eq $true}
```

### Create Local User:

```powershell
# With prompt for password
$password = Read-Host "Enter password" -AsSecureString
New-LocalUser -Name "JohnDoe" -Password $password -FullName "John Doe"

# With password in script
$password = ConvertTo-SecureString "P@ssw0rd" -AsPlainText -Force
New-LocalUser -Name "JohnDoe" -Password $password -FullName "John Doe" -Description "IT Admin"
```

### Modify Local User:

```powershell
# Change description
Set-LocalUser -Name "JohnDoe" -Description "Senior IT Admin"

# Change password
$newPassword = Read-Host "Enter new password" -AsSecureString
Set-LocalUser -Name "JohnDoe" -Password $newPassword

# Disable user
Disable-LocalUser -Name "JohnDoe"

# Enable user
Enable-LocalUser -Name "JohnDoe"
```

### Remove Local User:

```powershell
Remove-LocalUser -Name "JohnDoe"
```

## 18.2 Local Groups

### Get Local Groups:

```powershell
Get-LocalGroup

# Specific group
Get-LocalGroup -Name "Administrators"
```

### Create Local Group:

```powershell
New-LocalGroup -Name "ITAdmins" -Description "IT Administrators"
```

### Add User to Group:

```powershell
Add-LocalGroupMember -Group "Administrators" -Member "JohnDoe"

# Add multiple users
Add-LocalGroupMember -Group "Remote Desktop Users" -Member "JohnDoe", "JaneSmith"
```

### Remove User from Group:

```powershell
Remove-LocalGroupMember -Group "Administrators" -Member "JohnDoe"
```

### Get Group Members:

```powershell
Get-LocalGroupMember -Group "Administrators"
```

### Remove Local Group:

```powershell
Remove-LocalGroup -Name "ITAdmins"
```

## 18.3 Practical User Management Examples

### Create Standard User Account:

```powershell
function New-StandardUser {
    param(
        [Parameter(Mandatory=$true)]
        [string]$Username,
        
        [Parameter(Mandatory=$true)]
        [string]$FullName,
        
        [Parameter(Mandatory=$true)]
        [SecureString]$Password
    )
    
    # Create user
    New-LocalUser -Name $Username -Password $Password -FullName $FullName `
        -Description "Standard User" -PasswordNeverExpires:$false
    
    # Add to Users group
    Add-LocalGroupMember -Group "Users" -Member $Username
    
    Write-Host "User $Username created successfully" -ForegroundColor Green
}

# Usage
$pass = ConvertTo-SecureString "P@ssw0rd123" -AsPlainText -Force
New-StandardUser -Username "jdoe" -FullName "John Doe" -Password $pass
```

### Bulk Create Users from CSV:

```powershell
# CSV format: Username,FullName,Password,Group
# Example: jdoe,John Doe,P@ssw0rd,Users

Import-Csv C:\users.csv | ForEach-Object {
    $password = ConvertTo-SecureString $_.Password -AsPlainText -Force
    
    # Create user
    New-LocalUser -Name $_.Username -Password $password `
        -FullName $_.FullName
    
    # Add to group
    Add-LocalGroupMember -Group $_.Group -Member $_.Username
    
    Write-Host "Created user: $($_.Username)"
}
```

---

# 19. Scheduled Tasks

## 19.1 Get Scheduled Tasks

```powershell
# All tasks
Get-ScheduledTask

# Running tasks
Get-ScheduledTask | Where-Object {$_.State -eq 'Running'}

# Specific task
Get-ScheduledTask -TaskName "MyTask"

# Tasks in specific path
Get-ScheduledTask -TaskPath "\Microsoft\Windows\*"
```

## 19.2 Create Scheduled Task

### Simple Example:

```powershell
$action = New-ScheduledTaskAction -Execute "PowerShell.exe" `
    -Argument "-File C:\Scripts\Backup.ps1"

$trigger = New-ScheduledTaskTrigger -Daily -At 2am

Register-ScheduledTask -TaskName "DailyBackup" `
    -Action $action `
    -Trigger $trigger `
    -Description "Daily backup script"
```

### Advanced Example:

```powershell
# Action
$action = New-ScheduledTaskAction -Execute "PowerShell.exe" `
    -Argument "-ExecutionPolicy Bypass -File C:\Scripts\Maintenance.ps1"

# Trigger (weekly on Monday at 3 AM)
$trigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Monday -At 3am

# Settings
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries `
    -DontStopIfGoingOnBatteries `
    -StartWhenAvailable

# Principal (run as SYSTEM)
$principal = New-ScheduledTaskPrincipal -UserId "SYSTEM" -RunLevel Highest

# Register task
Register-ScheduledTask -TaskName "WeeklyMaintenance" `
    -Action $action `
    -Trigger $trigger `
    -Settings $settings `
    -Principal $principal `
    -Description "Weekly system maintenance"
```

### Trigger Types:

```powershell
# Daily
New-ScheduledTaskTrigger -Daily -At 2am

# Weekly
New-ScheduledTaskTrigger -Weekly -DaysOfWeek Monday, Wednesday -At 3am

# Monthly
New-ScheduledTaskTrigger -Monthly -DaysOfMonth 1 -At 4am

# At logon
New-ScheduledTaskTrigger -AtLogOn

# At startup
New-ScheduledTaskTrigger -AtStartup

# Once
New-ScheduledTaskTrigger -Once -At (Get-Date).AddHours(1)
```

## 19.3 Manage Scheduled Tasks

### Start Task:

```powershell
Start-ScheduledTask -TaskName "MyTask"
```

### Stop Task:

```powershell
Stop-ScheduledTask -TaskName "MyTask"
```

### Enable/Disable Task:

```powershell
Enable-ScheduledTask -TaskName "MyTask"
Disable-ScheduledTask -TaskName "MyTask"
```

### Get Task Info:

```powershell
Get-ScheduledTaskInfo -TaskName "MyTask"
```

### Remove Task:

```powershell
Unregister-ScheduledTask -TaskName "MyTask" -Confirm:$false
```

## 19.4 Practical Scheduled Task Examples

### Daily Log Cleanup:

```powershell
$action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument @"
-Command "Get-ChildItem C:\Logs\*.log | Where-Object {`$_.LastWriteTime -lt (Get-Date).AddDays(-30)} | Remove-Item -Force"
"@

$trigger = New-ScheduledTaskTrigger -Daily -At 1am

Register-ScheduledTask -TaskName "CleanOldLogs" `
    -Action $action `
    -Trigger $trigger `
    -User "SYSTEM" `
    -RunLevel Highest
```

---

# 20. Event Logs

## 20.1 Get Event Logs

### List Available Logs:

```powershell
Get-EventLog -List
Get-WinEvent -ListLog *
```

### Read Event Log:

```powershell
# Get latest 10 events from System log
Get-EventLog -LogName System -Newest 10

# Get events from Application log
Get-EventLog -LogName Application -Newest 20

# Specific event ID
Get-EventLog -LogName System -InstanceId 1074

# Events after specific date
Get-EventLog -LogName System -After (Get-Date).AddDays(-1)

# Error events only
Get-EventLog -LogName System -EntryType Error -Newest 10
```

## 20.2 Get-WinEvent (Recommended)

### Basic Usage:

```powershell
# Latest 10 events
Get-WinEvent -LogName System -MaxEvents 10

# Error events
Get-WinEvent -LogName System | Where-Object {$_.LevelDisplayName -eq 'Error'}
```

### FilterHashtable:

```powershell
# Events in last 24 hours
Get-WinEvent -FilterHashtable @{
    LogName='System'
    StartTime=(Get-Date).AddDays(-1)
}

# Specific Event ID
Get-WinEvent -FilterHashtable @{
    LogName='System'
    ID=1074
}

# Multiple criteria
Get-WinEvent -FilterHashtable @{
    LogName='System'
    Level=2  # Error
    StartTime=(Get-Date).AddHours(-12)
}
```

### Level Values:

- 1 = Critical
- 2 = Error
- 3 = Warning
- 4 = Information

## 20.3 Clear Event Log:

```powershell
Clear-EventLog -LogName Application
Clear-EventLog -LogName System
```

## 20.4 Write to Event Log

### Write-EventLog:

```powershell
# Create source (run once as Admin)
New-EventLog -LogName Application -Source "MyApp"

# Write event
Write-EventLog -LogName Application -Source "MyApp" `
    -EventId 1000 -EntryType Information `
    -Message "Application started successfully"

# Write error
Write-EventLog -LogName Application -Source "MyApp" `
    -EventId 1001 -EntryType Error `
    -Message "An error occurred during processing"
```

## 20.5 Practical Event Log Examples

### Find Recent Errors:

```powershell
Get-WinEvent -FilterHashtable @{
    LogName='System','Application'
    Level=2
    StartTime=(Get-Date).AddDays(-7)
} | Select-Object TimeCreated, LogName, Id, Message | 
    Format-Table -AutoSize
```

### Monitor for Specific Event:

```powershell
# Monitor for system reboots
Get-WinEvent -FilterHashtable @{
    LogName='System'
    ID=1074
    StartTime=(Get-Date).AddDays(-30)
} | ForEach-Object {
    [PSCustomObject]@{
        Time = $_.TimeCreated
        User = $_.Properties[6].Value
        Reason = $_.Properties[0].Value
    }
} | Format-Table -AutoSize
```

### Export Events to CSV:

```powershell
Get-WinEvent -FilterHashtable @{
    LogName='System'
    Level=2,3  # Errors and Warnings
    StartTime=(Get-Date).AddDays(-7)
} | Select-Object TimeCreated, Id, LevelDisplayName, Message |
    Export-Csv C:\Reports\SystemErrors.csv -NoTypeInformation
```

---

# 21. Advanced Scripting Techniques

## 21.1 Parameter Splatting

### What is Splatting:

Instead of long parameter lists, use hash table:

**Without splatting:**
```powershell
New-ADUser -Name "John Doe" -SamAccountName "jdoe" -UserPrincipalName "jdoe@domain.com" -Path "OU=Users,DC=domain,DC=com" -Enabled $true
```

**With splatting:**
```powershell
$userParams = @{
    Name = "John Doe"
    SamAccountName = "jdoe"
    UserPrincipalName = "jdoe@domain.com"
    Path = "OU=Users,DC=domain,DC=com"
    Enabled = $true
}

New-ADUser @userParams
```

### Benefits:

- More readable
- Easier to maintain
- Can build parameters dynamically

## 21.2 Advanced Pipeline Techniques

### Begin/Process/End Blocks:

```powershell
function Get-SquareRoot {
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline=$true)]
        [double]$Number
    )
    
    begin {
        Write-Verbose "Starting calculations"
    }
    
    process {
        [Math]::Sqrt($Number)
    }
    
    end {
        Write-Verbose "Calculations complete"
    }
}

# Usage
1..10 | Get-SquareRoot
```

## 21.3 Jobs and Background Tasks

### Start Job:

```powershell
# Start background job
$job = Start-Job -ScriptBlock {
    Get-Process | Where-Object {$_.CPU -gt 10}
}

# Check status
Get-Job

# Wait for completion
Wait-Job $job

# Get results
Receive-Job $job

# Remove job
Remove-Job $job
```

### Multiple Jobs:

```powershell
$servers = @("SERVER01", "SERVER02", "SERVER03")

# Start jobs for each server
$servers | ForEach-Object {
    Start-Job -Name "DiskSpace_$_" -ScriptBlock {
        param($Server)
        Get-CimInstance Win32_LogicalDisk -ComputerName $Server
    } -ArgumentList $_
}

# Wait for all jobs
Get-Job | Wait-Job

# Get all results
Get-Job | Receive-Job

# Clean up
Get-Job | Remove-Job
```

## 21.4 Workflows (PS 5.1)

```powershell
workflow Restart-Servers {
    param([string[]]$Servers)
    
    foreach -parallel ($server in $Servers) {
        Restart-Computer -ComputerName $server -Force -Wait
    }
}

# Run workflow
Restart-Servers -Servers "SERVER01", "SERVER02", "SERVER03"
```

## 21.5 Classes (PS 5.0+)

```powershell
class Server {
    [string]$Name
    [string]$IPAddress
    [string]$OS
    
    # Constructor
    Server([string]$name, [string]$ip) {
        $this.Name = $name
        $this.IPAddress = $ip
    }
    
    # Method
    [string] ToString() {
        return "$($this.Name) - $($this.IPAddress)"
    }
}

# Usage
$server = [Server]::new("SERVER01", "192.168.1.10")
$server.OS = "Windows Server 2019"
$server.ToString()
```

---

# 22. Active Directory Management

## 22.1 Active Directory Module

### Import Module:

```powershell
Import-Module ActiveDirectory
```

### Check if Module Available:

```powershell
if (Get-Module -ListAvailable -Name ActiveDirectory) {
    Import-Module ActiveDirectory
} else {
    Write-Host "AD module not available" -ForegroundColor Red
}
```

## 22.2 User Management

### Get AD Users:

```powershell
# All users
Get-ADUser -Filter *

# Specific user
Get-ADUser -Identity jdoe

# Users in OU
Get-ADUser -Filter * -SearchBase "OU=Users,DC=domain,DC=com"

# Enabled users only
Get-ADUser -Filter {Enabled -eq $true}

# With properties
Get-ADUser -Identity jdoe -Properties *
```

### Create AD User:

```powershell
$password = ConvertTo-SecureString "P@ssw0rd123" -AsPlainText -Force

New-ADUser -Name "John Doe" `
    -GivenName "John" `
    -Surname "Doe" `
    -SamAccountName "jdoe" `
    -UserPrincipalName "jdoe@domain.com" `
    -Path "OU=Users,DC=domain,DC=com" `
    -AccountPassword $password `
    -Enabled $true `
    -ChangePasswordAtLogon $true
```

### Modify AD User:

```powershell
# Change properties
Set-ADUser -Identity jdoe -Description "IT Administrator"
Set-ADUser -Identity jdoe -Department "IT" -Title "System Administrator"

# Disable account
Disable-ADAccount -Identity jdoe

# Enable account
Enable-ADAccount -Identity jdoe

# Reset password
$newPass = ConvertTo-SecureString "NewP@ssw0rd" -AsPlainText -Force
Set-ADAccountPassword -Identity jdoe -NewPassword $newPass -Reset

# Unlock account
Unlock-ADAccount -Identity jdoe
```

### Remove AD User:

```powershell
Remove-ADUser -Identity jdoe -Confirm:$false
```

## 22.3 Group Management

### Get AD Groups:

```powershell
# All groups
Get-ADGroup -Filter *

# Specific group
Get-ADGroup -Identity "Domain Admins"

# Groups in OU
Get-ADGroup -Filter * -SearchBase "OU=Groups,DC=domain,DC=com"
```

### Create AD Group:

```powershell
New-ADGroup -Name "IT Admins" `
    -GroupScope Global `
    -GroupCategory Security `
    -Path "OU=Groups,DC=domain,DC=com" `
    -Description "IT Administrators"
```

### Group Membership:

```powershell
# Get members
Get-ADGroupMember -Identity "Domain Admins"

# Add member
Add-ADGroupMember -Identity "IT Admins" -Members jdoe

# Remove member
Remove-ADGroupMember -Identity "IT Admins" -Members jdoe -Confirm:$false

# Get user's groups
Get-ADPrincipalGroupMembership -Identity jdoe
```

## 22.4 Computer Accounts

### Get AD Computers:

```powershell
# All computers
Get-ADComputer -Filter *

# Specific computer
Get-ADComputer -Identity "COMPUTER01"

# Computers in OU
Get-ADComputer -Filter * -SearchBase "OU=Workstations,DC=domain,DC=com"

# Enabled only
Get-ADComputer -Filter {Enabled -eq $true}
```

### Computer Properties:

```powershell
# Get last logon
Get-ADComputer -Identity "COMPUTER01" -Properties LastLogonDate |
    Select-Object Name, LastLogonDate

# Get operating system
Get-ADComputer -Filter * -Properties OperatingSystem |
    Select-Object Name, OperatingSystem
```

## 22.5 Organizational Units

### Get OUs:

```powershell
Get-ADOrganizationalUnit -Filter * |
    Select-Object Name, DistinguishedName
```

### Create OU:

```powershell
New-ADOrganizationalUnit -Name "IT Department" `
    -Path "DC=domain,DC=com" `
    -Description "IT Department OU"
```

## 22.6 Practical AD Examples

### Bulk Create Users from CSV:

```powershell
# CSV: FirstName,LastName,Username,Department,Title
Import-Csv C:\users.csv | ForEach-Object {
    $password = ConvertTo-SecureString "TempP@ss123" -AsPlainText -Force
    
    $params = @{
        Name = "$($_.FirstName) $($_.LastName)"
        GivenName = $_.FirstName
        Surname = $_.LastName
        SamAccountName = $_.Username
        UserPrincipalName = "$($_.Username)@domain.com"
        Path = "OU=Users,DC=domain,DC=com"
        AccountPassword = $password
        Enabled = $true
        ChangePasswordAtLogon = $true
        Department = $_.Department
        Title = $_.Title
    }
    
    New-ADUser @params
    Write-Host "Created user: $($_.Username)"
}
```

### Find Inactive Computers:

```powershell
$days = 90
$cutoff = (Get-Date).AddDays(-$days)

Get-ADComputer -Filter * -Properties LastLogonDate |
    Where-Object {$_.LastLogonDate -lt $cutoff} |
    Select-Object Name, LastLogonDate, Enabled |
    Export-Csv C:\Reports\InactiveComputers.csv -NoTypeInformation
```

### Get Locked Out Users:

```powershell
Search-ADAccount -LockedOut |
    Select-Object Name, SamAccountName, LockedOut, LastLogonDate
```

---

# 23. Disk and Storage Management

## 23.1 Get Disk Information

### Get-Disk:

```powershell
# All disks
Get-Disk

# Specific disk
Get-Disk -Number 0
```

### Get-Volume:

```powershell
# All volumes
Get-Volume

# Specific drive
Get-Volume -DriveLetter C
```

### Get-Partition:

```powershell
# All partitions
Get-Partition

# Partitions on disk 0
Get-Partition -DiskNumber 0
```

## 23.2 Disk Space Monitoring

### Get-CimInstance Win32_LogicalDisk:

```powershell
Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" |
    Select-Object DeviceID,
        @{N='SizeGB';E={[math]::Round($_.Size/1GB,2)}},
        @{N='FreeGB';E={[math]::Round($_.FreeSpace/1GB,2)}},
        @{N='PercentFree';E={[math]::Round(($_.FreeSpace/$_.Size)*100,2)}}
```

### Remote Disk Space:

```powershell
$servers = @("SERVER01", "SERVER02", "SERVER03")

Invoke-Command -ComputerName $servers -ScriptBlock {
    Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" |
        Select-Object @{N='Server';E={$env:COMPUTERNAME}},
                      DeviceID,
                      @{N='SizeGB';E={[math]::Round($_.Size/1GB,2)}},
                      @{N='FreeGB';E={[math]::Round($_.FreeSpace/1GB,2)}}
}
```

## 23.3 Disk Management

### Initialize Disk:

```powershell
Initialize-Disk -Number 1 -PartitionStyle GPT
```

### Create Partition:

```powershell
New-Partition -DiskNumber 1 -UseMaximumSize -DriveLetter E
```

### Format Volume:

```powershell
Format-Volume -DriveLetter E -FileSystem NTFS -NewFileSystemLabel "Data"
```

### Complete New Disk Setup:

```powershell
# Initialize
Initialize-Disk -Number 1 -PartitionStyle GPT

# Create partition
New-Partition -DiskNumber 1 -UseMaximumSize -DriveLetter E

# Format
Format-Volume -DriveLetter E -FileSystem NTFS -NewFileSystemLabel "Data" -Confirm:$false
```

---

# 24. Performance Monitoring

## 24.1 Performance Counters

### Get-Counter:

```powershell
# CPU usage
Get-Counter '\Processor(_Total)\% Processor Time'

# Memory available
Get-Counter '\Memory\Available MBytes'

# Disk activity
Get-Counter '\PhysicalDisk(_Total)\% Disk Time'
```

### List Available Counters:

```powershell
Get-Counter -ListSet Processor
Get-Counter -ListSet Memory
Get-Counter -ListSet "Network Interface"
```

### Monitor Multiple Counters:

```powershell
$counters = @(
    '\Processor(_Total)\% Processor Time'
    '\Memory\Available MBytes'
    '\PhysicalDisk(_Total)\% Disk Time'
)

Get-Counter -Counter $counters -SampleInterval 2 -MaxSamples 10
```

## 24.2 System Performance Report

```powershell
function Get-SystemPerformance {
    [CmdletBinding()]
    param(
        [string]$ComputerName = $env:COMPUTERNAME
    )
    
    $os = Get-CimInstance Win32_OperatingSystem -ComputerName $ComputerName
    $cpu = Get-CimInstance Win32_Processor -ComputerName $ComputerName
    $disk = Get-CimInstance Win32_LogicalDisk -ComputerName $ComputerName -Filter "DriveType=3"
    
    [PSCustomObject]@{
        ComputerName = $ComputerName
        CPUUsage = (Get-Counter "\Processor(_Total)\% Processor Time" -ComputerName $ComputerName).CounterSamples.CookedValue
        MemoryUsedGB = [math]::Round(($os.TotalVisibleMemorySize - $os.FreePhysicalMemory)/1MB, 2)
        MemoryTotalGB = [math]::Round($os.TotalVisibleMemorySize/1MB, 2)
        MemoryPercentUsed = [math]::Round((($os.TotalVisibleMemorySize - $os.FreePhysicalMemory) / $os.TotalVisibleMemorySize) * 100, 2)
        Uptime = (Get-Date) - $os.LastBootUpTime
        Disks = $disk | Select-Object DeviceID, @{N='FreeGB';E={[math]::Round($_.FreeSpace/1GB,2)}}
    }
}

Get-SystemPerformance
```

---

# 25. Security and Best Practices

## 25.1 Security Best Practices

### 1. Use Execution Policy:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### 2. Never Store Passwords in Plain Text:

**❌ Bad:**
```powershell
$password = "MyPassword123"
```

**✅ Good:**
```powershell
$securePassword = Read-Host "Enter password" -AsSecureString
```

### 3. Use Credentials Properly:

```powershell
# Prompt for credentials
$cred = Get-Credential

# Use credentials
Invoke-Command -ComputerName SERVER01 -Credential $cred -ScriptBlock {
    Get-Service
}
```

### 4. Validate Input:

```powershell
function Get-UserInput {
    param(
        [ValidatePattern('^\w+$')]
        [string]$Username,
        
        [ValidateRange(1,100)]
        [int]$Age
    )
    # Function code
}
```

### 5. Use Try/Catch:

```powershell
try {
    Get-Content C:\file.txt -ErrorAction Stop
} catch {
    Write-Error "Failed to read file: $_"
}
```

## 25.2 Scripting Best Practices

### 1. Comment Your Code:

```powershell
<#
.SYNOPSIS
    Script description
.DESCRIPTION
    Detailed description
.PARAMETER Name
    Parameter description
.EXAMPLE
    Example usage
#>
```

### 2. Use Consistent Naming:

```powershell
# Functions: Verb-Noun
function Get-SystemInfo { }

# Variables: camelCase or PascalCase
$userName = "john"
$ServerList = @()
```

### 3. Error Handling:

```powershell
$ErrorActionPreference = "Stop"

try {
    # Critical operations
} catch {
    Write-Error $_
    # Cleanup
} finally {
    # Always executes
}
```

### 4. Use Write-Verbose for Logging:

```powershell
function Do-Something {
    [CmdletBinding()]
    param()
    
    Write-Verbose "Starting process..."
    # Do work
    Write-Verbose "Process complete"
}

Do-Something -Verbose
```

### 5. Modular Code:

```powershell
# Break into functions
function Get-Data { }
function Process-Data { }
function Export-Data { }

# Main script
$data = Get-Data
$processed = Process-Data $data
Export-Data $processed
```

## 25.3 Performance Best Practices

### 1. Filter Left:

**❌ Slow:**
```powershell
Get-ChildItem -Recurse | Where-Object {$_.Extension -eq '.log'}
```

**✅ Fast:**
```powershell
Get-ChildItem -Recurse -Filter *.log
```

### 2. Use ArrayList for Large Collections:

**❌ Slow:**
```powershell
$array = @()
1..10000 | ForEach-Object {
    $array += $_  # Creates new array each time
}
```

**✅ Fast:**
```powershell
$list = [System.Collections.ArrayList]::new()
1..10000 | ForEach-Object {
    $list.Add($_) | Out-Null
}
```

### 3. Avoid Select-Object in Loops:

**❌ Slow:**
```powershell
foreach ($item in $collection) {
    $name = ($item | Select-Object Name).Name
}
```

**✅ Fast:**
```powershell
foreach ($item in $collection) {
    $name = $item.Name
}
```

---

# Appendix: Quick Reference

## Essential Commands

### Navigation:
```powershell
Get-Location / pwd / gl        # Current location
Set-Location / cd / sl         # Change location
Push-Location / pushd          # Save and change
Pop-Location / popd            # Return to saved
```

### Files:
```powershell
Get-ChildItem / ls / dir / gci # List items
New-Item                       # Create item
Remove-Item / rm / del         # Delete item
Copy-Item / cp / copy          # Copy item
Move-Item / mv / move          # Move item
Rename-Item / ren              # Rename item
Get-Content / cat / type       # Read file
Set-Content                    # Write file
Add-Content                    # Append file
```

### Processes:
```powershell
Get-Process / ps / gps         # List processes
Start-Process / start          # Start process
Stop-Process / kill            # Stop process
```

### Services:
```powershell
Get-Service / gsv              # List services
Start-Service / sasv           # Start service
Stop-Service / spsv            # Stop service
Restart-Service / rsv          # Restart service
Set-Service                    # Configure service
```

### System:
```powershell
Get-ComputerInfo               # Computer info
Get-HotFix                     # Installed updates
Restart-Computer               # Restart
Stop-Computer                  # Shutdown
```

### Network:
```powershell
Get-NetAdapter                 # Network adapters
Get-NetIPAddress               # IP addresses
Test-Connection / ping         # Ping host
Test-NetConnection             # Test port
```

## Common Operators

### Comparison:
```powershell
-eq, -ne                       # Equal, Not Equal
-gt, -ge, -lt, -le            # Greater/Less than
-like, -notlike                # Wildcard match
-match, -notmatch              # Regex match
-contains, -notcontains        # Collection contains
-in, -notin                    # Item in collection
```

### Logical:
```powershell
-and, -or, -xor, -not, !      # Logical operators
```

### String:
```powershell
-join, -split                  # Join/Split
-replace                       # Replace
-f                            # Format
```

## Pipeline Cmdlets

```powershell
Where-Object / where / ?       # Filter objects
ForEach-Object / foreach / %   # Process each object
Select-Object / select         # Select properties
Sort-Object / sort             # Sort objects
Group-Object / group           # Group objects
Measure-Object / measure       # Count/Calculate
```

## Formatting

```powershell
Format-Table / ft              # Table format
Format-List / fl               # List format
Format-Wide / fw               # Wide format
Out-GridView / ogv             # Grid view
Out-File                       # Save to file
Export-Csv                     # Export CSV
ConvertTo-Html                 # Convert to HTML
```

---

# Conclusion

This guide has covered PowerShell from basics to advanced topics specifically for Windows Server 2019 and system administration. Key areas include:

- **Fundamentals**: Cmdlets, pipeline, variables, operators
- **File System**: Creating, copying, moving, deleting files
- **Control Flow**: Loops, conditions, error handling
- **Functions**: Creating reusable code
- **Remoting**: Managing multiple servers
- **Active Directory**: User and computer management
- **Services & Processes**: System management
- **Networking**: Network configuration and testing
- **Monitoring**: Performance and event logs
- **Best Practices**: Security and efficiency

## Next Steps:

1. **Practice regularly** - Use PowerShell daily for admin tasks
2. **Read documentation** - `Get-Help` is your friend
3. **Write scripts** - Automate repetitive tasks
4. **Learn modules** - Explore specific product modules (AD, Exchange, etc.)
5. **Join community** - PowerShell.org, Reddit, Stack Overflow

## Resources:

- **Microsoft Docs**: https://docs.microsoft.com/powershell
- **PowerShell Gallery**: https://www.powershellgallery.com
- **PowerShell.org**: https://powershell.org
- **GitHub**: https://github.com/PowerShell

---

**Document Version**: 1.0  
**Last Updated**: February 13, 2026  
**Target Platform**: Windows Server 2019, PowerShell 5.1+

---

*This comprehensive guide provides the foundation needed for Windows Server administration and IT infrastructure management with PowerShell.*