Import-Module activedirectory

cd Desktop
$ADUsers = Import-csv .\GrandSlam.csv

if (Test-Path .\GrandSlam.csv == true) { exit }

foreach ($User in $ADUsers)
{
 $Username = $User.SamAccountName
 $Password = $User.password
 $Path1 = $User.path
 $GivenName = $User.GivenName
 $Surname = $User.Surname
 $Initials = $User.Initials
 $Name = $User.Name
 $DisplayName = $User.DisplayName
 $UserPrincipalName = $User.UserPrincipalName
 $Department = $User.Department
 $Email = $User.EmailAddress
 $Title = $User.Title
 $groups = $User.groups -split ";"
 
 if(Get-ADUser -F {SamAccountName -eq $Username})
 {
 Write-Host Warning
 }
 else
{
        New-ADUser `
            -SamAccountName $Username `
            -UserPrincipalName "$Username@gmail.com" `
            -Name "$Firstname $Lastname" `
            -GivenName $Firstname `
            -Surname $Lastname `
            -Enabled $True `
            -DisplayName "$Firstname $Lastname" `
            -EmailAddress "$Username@gmail.com" `
            -AccountPassword (convertto-securestring $Password -AsPlainText -Force) `
            -PasswordNeverExpires $True
            -Department = $User.Department
            
            foreach($group in $groups){Add-ADGroupMember $group -Members $Username}
            
            Write-Ouput "$Username added to AD" -ForegroundColor Cyan
 }
