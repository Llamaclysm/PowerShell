<#

A simple script to rename a computer to meet a company naming standard;

Variables used:
    $pc - a variable to be used as a laptop / pc modifier
    $vm - a variable to be used as a virtual machine modifier
    $dvm - a variable to be used as a dev virtual machine modifier
    $s - serial number 

#> 

clear

$pc = "PC"
$vm = "vm-i-"
$dvm = "dev-vm-i-"

$s = Get-WmiObject win32_bios | Select-Object -ExpandProperty SerialNumber

echo "Local System Serial number : $s"
echo "Local System New Name : $pc$s"

# already in AD 
Rename-Computer -NewName "$pc$s"

# 
add-computer –domainname "PutYourDomainNameHere"  -restart
