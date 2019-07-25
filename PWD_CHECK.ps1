[CmdletBinding()]
param (
[Parameter (Mandatory=$true)]
[string]$UserName
)

$query = Get-ADUser $UserName -Properties PasswordExpired, PasswordNeverExpires

   if ($query.PasswordExpired -eq $false) {
    Write-Host -ForegroundColor Green "Account's Password is still valid"
        if ($query.PasswordNeverExpires -eq $false) {
            Write-Host -ForegroundColor Green "Password is set to Expire"
        }
        else {
            Write-Host -ForegroundColor Yellow  -BackgroundColor Black "Password is set to NEVER Expire"
        }
   }
else {
    Write-Host -ForegroundColor Red -BackgroundColor Black "Password has expired. Time for a change"
}
