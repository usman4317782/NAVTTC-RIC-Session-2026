# PowerShell Lab Exercise: Automated Employee Onboarding System

---

## Lab Information
**Instructor:** Hafiz Muhammad Usman  
**Date:** February 14, 2026  
**Subject:** System Administration and IT Infrastructure  
**Difficulty Level:** Medium  
**Duration:** 90-120 minutes  
**Environment:** Individual Windows 10 machine (no network required)

---

## Problem Statement

You are a newly hired IT administrator at **"SmartTech Solutions"**, a software development company. The HR department has just completed recruitment for 12 new employees across four departments: Development, Marketing, Finance, and Support. 

Your manager wants you to demonstrate your PowerShell automation skills by creating a complete user management system that works on a standalone Windows 10 machine. Since the company is expanding, they want to see how you would automate repetitive administrative tasks rather than doing everything manually through the Windows GUI.

**Your Challenge:**

Create a PowerShell-based solution that can:

1. **Store employee information systematically** - You need to maintain a list of 12 new employees with their details (names, usernames, departments, and job titles)

2. **Automatically create user accounts** - Build a PowerShell script that reads employee data and creates local user accounts on your Windows 10 machine without manual intervention

3. **Generate professional reports** - Create automated reports showing which accounts were created, their current status, and other relevant information

4. **Manage account status** - Develop functionality to disable accounts (for employees on leave) and re-enable them when needed

5. **Search and organize users** - Build a tool to search and filter users by department or other criteria

6. **Document everything** - Keep track of all actions performed and maintain proper logs

---

## Business Scenario Context

In real IT environments:
- Companies hire employees in batches (onboarding)
- System administrators need to create accounts quickly and accurately
- Manual account creation is time-consuming and prone to errors
- Automation saves time and ensures consistency
- Reports and logs are essential for auditing and compliance
- Accounts need to be managed (disabled/enabled) based on employee status

Your solution should demonstrate that you understand these real-world requirements.

---

## Employee Information to Process

You need to create accounts for these 12 employees:

### Development Department (4 employees)
- A senior developer
- A junior developer  
- A quality assurance engineer
- A DevOps engineer

### Marketing Department (3 employees)
- A digital marketing specialist
- A content writer
- A graphic designer

### Finance Department (3 employees)
- A financial analyst
- An accountant
- A payroll officer

### Support Department (2 employees)
- A technical support specialist
- A customer service representative

---

## Technical Requirements

### What You Have:
- Windows 10 Operating System (your own laptop/desktop)
- Windows PowerShell (built-in)
- Notepad or any text editor
- Internet access (only for reading documentation if needed)
- Administrator access to your machine

### What You Cannot Use:
- Any paid software or tools
- Network servers or domain controllers
- Third-party automation tools
- Virtual machines (work on your physical machine only)
- Active Directory (use local accounts only)

---

## Your Deliverables

You must create and demonstrate:

### 1. Data Storage
- A properly formatted file containing all employee information
- The file should be easy to read and modify

### 2. PowerShell Scripts
Create separate scripts for:
- **Main Creation Script**: Automates bulk user account creation
- **Report Generator**: Creates detailed reports of user accounts
- **Account Manager**: Disables or enables user accounts
- **Search Tool**: Finds users by department or other criteria

### 3. Reports and Logs
Generate:
- A summary report showing creation status (success/failure)
- A detailed report with all user account properties
- A log file documenting all actions performed

### 4. Documentation
Provide:
- A summary document explaining what you did
- Instructions on how to run each script
- Screenshots proving successful execution
- Reflection on challenges faced and solutions applied

---

## Learning Objectives

By completing this lab, you will learn to:

1. **Automate User Management**
   - Create local user accounts using PowerShell
   - Understand user account properties and attributes
   - Manage user account lifecycle (create, disable, enable)

2. **Work with Data Files**
   - Store structured data in appropriate formats
   - Import and export data using PowerShell
   - Process data in loops

3. **PowerShell Scripting**
   - Write functional PowerShell scripts
   - Implement error handling
   - Use parameters to make scripts flexible
   - Work with cmdlets: `New-LocalUser`, `Get-LocalUser`, `Set-LocalUser`, `Disable-LocalUser`, `Enable-LocalUser`

4. **Generate Reports**
   - Extract system information
   - Format data for professional reports
   - Export data to readable formats

5. **Apply IT Best Practices**
   - Document your work properly
   - Create maintainable and reusable scripts
   - Implement basic security measures
   - Keep audit logs

---

## Expected Learning Outcomes

After completing this lab, you will be able to:
- Independently automate user account management tasks
- Write PowerShell scripts that solve real IT problems
- Create professional administrative reports
- Troubleshoot common issues in PowerShell
- Demonstrate practical system administration skills
- Explain the benefits of automation over manual processes

---

## Tasks Breakdown

### Phase 1: Planning and Preparation
- Understand the requirements completely
- Decide on the data structure for employee information
- Plan your folder structure for organizing files
- Open PowerShell with appropriate permissions

### Phase 2: Data Organization
- Create a structured file with all 12 employees' information
- Include: Full Name, Username, Department, and Job Title
- Ensure data is properly formatted and can be imported into PowerShell
- Verify you can read the data successfully

### Phase 3: User Account Creation
- Write a PowerShell script that reads your employee data
- Create local user accounts for all 12 employees
- Set appropriate passwords (use a secure default password)
- Handle errors gracefully (e.g., if a user already exists)
- Display progress messages during execution
- Generate a summary report

### Phase 4: Reporting and Verification
- Create a script that generates a detailed report of all created users
- Include account status, properties, and other relevant information
- Export the report in a format that can be easily reviewed
- Verify all accounts were created correctly

### Phase 5: Account Management
- Build functionality to disable specific user accounts
- Build functionality to re-enable disabled accounts
- Test both operations
- Confirm the status changes

### Phase 6: Search and Filter
- Create a tool to search users by department
- Show statistics (how many users per department, enabled vs disabled)
- Make the search results easy to read

### Phase 7: Documentation
- Create a comprehensive summary of your work
- Document all scripts and their purposes
- Take screenshots of successful executions
- Write a reflection on what you learned

---

## Success Criteria

Your solution will be considered successful if:

✅ All 12 user accounts are created on your local machine  
✅ Scripts execute without errors  
✅ Reports are generated successfully and contain accurate information  
✅ You can disable and re-enable accounts using your scripts  
✅ Search functionality works correctly  
✅ All files are organized in a logical folder structure  
✅ Documentation is complete and professional  
✅ You can explain every part of your solution  

---

## Assessment Rubric

### Script Functionality (40 points)
- All scripts run without errors (15 points)
- All 12 users created successfully (15 points)
- Account management (disable/enable) works (10 points)

### Code Quality (25 points)
- Proper use of PowerShell cmdlets (10 points)
- Error handling implemented (8 points)
- Code is readable with comments (7 points)

### Reporting and Documentation (20 points)
- Reports generated correctly (10 points)
- Complete documentation provided (10 points)

### Problem-Solving Skills (15 points)
- Creative approach to challenges (7 points)
- Evidence of troubleshooting (8 points)

**Total: 100 points**

---

## Important Guidelines

### DO:
✓ Work independently on your own machine  
✓ Test each script before moving to the next phase  
✓ Use meaningful names for files, folders, and variables  
✓ Add comments to explain your code  
✓ Create backups of your work  
✓ Keep your workspace organized  
✓ Take screenshots of successful executions  

### DON'T:
✗ Use the GUI to create accounts manually  
✗ Skip error handling  
✗ Forget to run PowerShell as Administrator  
✗ Delete system accounts or modify existing Windows accounts  
✗ Use overly complex solutions when simple ones work  
✗ Copy code without understanding it  

---

## Hints and Tips

1. **Getting Started**: Create a dedicated folder (e.g., C:\LabExercise) for all your work

2. **Data Format**: Think about what format makes data easy to import into PowerShell (Hint: Think spreadsheet-like)

3. **Passwords**: You'll need to create secure passwords in PowerShell (look up `ConvertTo-SecureString`)

4. **Checking Work**: Use Windows Computer Management (lusrmgr.msc) to visually verify accounts were created

5. **Error Handling**: Use Try-Catch blocks to handle errors gracefully

6. **Testing**: Start by creating 2-3 test users first, then scale to all 12

7. **PowerShell Help**: Use `Get-Help <cmdlet-name> -Full` to learn about commands

8. **Progress Tracking**: Use `Write-Host` with different colors to show progress

---

## Troubleshooting Common Issues

**If you encounter errors:**
1. Check if PowerShell is running as Administrator
2. Verify your data file is in the correct location
3. Ensure usernames don't already exist
4. Check if your syntax is correct
5. Read error messages carefully—they usually tell you what's wrong

**Need help?**
- Use `Get-Help` command in PowerShell
- Check Microsoft PowerShell documentation online
- Review error messages carefully
- Test small pieces of code separately

---

## Submission Requirements

Submit the following in a single folder:

1. **All PowerShell scripts** (.ps1 files)
2. **Employee data file**
3. **All generated reports** (CSV or text files)
4. **Screenshots** showing:
   - Script execution
   - Created user accounts
   - Generated reports
5. **Documentation file** (Word/PDF) containing:
   - Lab summary
   - Step-by-step explanation of your approach
   - Challenges faced and how you solved them
   - Reflection on learning experience
   - Instructions to run your scripts

---

## Time Management Suggestion

- Planning and Setup: 10 minutes
- Data Organization: 15 minutes
- User Creation Script: 30 minutes
- Reporting Script: 20 minutes
- Account Management Scripts: 20 minutes
- Search Tool: 15 minutes
- Documentation and Screenshots: 20 minutes
- Buffer for troubleshooting: 20 minutes

**Total: 150 minutes (2.5 hours)**

---

## Extension Challenges (For Advanced Students)

If you complete early, try these additional challenges:

1. Generate random secure passwords for each user instead of using the same password
2. Create a menu-driven system where you can choose different operations
3. Add functionality to modify existing user properties
4. Implement detailed logging that timestamps every action
5. Create a script to remove all lab users when you're done (cleanup script)
6. Export your entire user database and create a script to recreate it on another machine

---

## Real-World Application

After this lab, you will understand how:
- IT teams onboard new employees efficiently
- Automation reduces human error in repetitive tasks
- Scripts can be reused and modified for different scenarios
- Documentation and reporting are crucial in IT operations
- PowerShell is a powerful tool for Windows system administration

These skills directly apply to entry-level system administrator and IT support roles.

---

## Final Notes

- This is an individual assignment—work independently
- Focus on understanding concepts, not just completing tasks
- Your ability to explain your solution is as important as the solution itself
- Ask questions if you're stuck (but try troubleshooting first)
- Save your work frequently
- Be creative in your approach while meeting all requirements

**Remember**: In real IT jobs, you'll often receive requirements like this and need to figure out the implementation yourself. This lab simulates that experience!

---

**Good luck, and enjoy learning PowerShell automation!**

---

**Instructor Contact:**  
Hafiz Muhammad Usman  
February 14, 2026