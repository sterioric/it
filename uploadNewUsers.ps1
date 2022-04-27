Import-Module activedirectory

cd Desktop
$ADUsers = Import-csv .\GrandSlam.csv

if (Test-Path .\GrandSlam.csv == true) { exit }

foreach ($User in $ADUsers)
{
 $username = $User.SamAccountName
 $Password = $User.password
 $Path1 = $User.path
 $GivenName = $User.GivenName
 $Surname = $User.Surname
 $Initials = $User.Initials
 $Name = $User.Name
 $DisplayName = $User.DisplayName
 
