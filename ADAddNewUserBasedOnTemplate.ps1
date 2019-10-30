<#
A simple script to create a user based on a template in a given OU
#>

##
## MENU
##

Write-Host "1 - Accounting"
Write-Host "2 - BackOffice"
Write-Host "3 - Consulting"
<#
add menu entries as many as needed
#>

[int]$MenuItem = Read-Host -Prompt 'Select a proper option'

##
## MENU LOGIC
##

if($MenuItem -eq 1){
    $samaccount_to_copy = 'template_accounting'
    Write-Host "Adding NEW user in OU based on a * $samaccount_to_copy *"
    $new_ou_DN = 'OU PATH HERE, LIKE: OU=accounting,OU=Users,DC=example,DC=com'    
}
elseif($MenuItem -eq 2){
    $samaccount_to_copy = 'template_backoffice'
    Write-Host "Adding NEW user in OU based on a * $samaccount_to_copy *"
    $new_ou_DN = 'OU PATH HERE, LIKE: OU=backoffice,OU=Users,DC=example,DC=com'   
}
elseif($MenuItem -eq 3){
    $samaccount_to_copy = 'template_consulting'
    Write-Host "Adding NEW user in OU based on a * $samaccount_to_copy *"
    $new_ou_DN = 'OU PATH HERE, LIKE: OU=consulting,OU=Users,DC=example,DC=com'   
}
<#
add menu entries as many as needed
#>
else {
    Write-Host "Wrong selection"
}

    $new_samaccountname = Read-Host -Prompt 'Enter a user logon (ie. 12345): '
    $new_firstname = Read-Host -Prompt 'Enter a First name (ie. Jan): '
    $new_lastname = Read-Host -Prompt 'Enter a Last name (ie. Kowalski): '
    $new_displayname = $new_firstname + ' ' + $new_lastname
    $new_name = $new_displayname
    $new_user_logon_name = $new_samaccountname + '@example.com'
    $new_password = 'new_password_goes_here'
    $new_description = $new_displayname
    $enable_user_after_creation = $true
    $password_never_expires = $false
    $cannot_change_password = $false

$ad_account_to_copy = Get-Aduser $samaccount_to_copy -Properties memberOf

$params = @{'SamAccountName' = $new_samaccountname;
            'Instance' = $ad_account_to_copy;
            'DisplayName' = $new_displayname;
            'GivenName' = $new_firstname;
            'SurName' = $new_lastname;
            'PasswordNeverExpires' = $password_never_expires;
            'CannotChangePassword' = $cannot_change_password;
            'Description' = $new_description;
            'Enabled' = $enable_user_after_creation;
            'UserPrincipalName' = $new_user_logon_name;
            'AccountPassword' = (ConvertTo-SecureString -AsPlainText $new_password -Force);
            }

## Create the new user account
New-ADUser -Name $new_name @params

## Mirror all the groups the original account was a member of
$ad_account_to_copy.Memberof | % {Add-ADGroupMember $_ $new_samaccountname }

## Move the new user account into the assigned OU
Get-ADUser $new_samaccountname| Move-ADObject -TargetPath $new_ou_DN
