    
<#
A simple script to list files within a user directory with size greater than X
#>


echo "Pick a size: "
$S = Read-Host 
# static home dir
#$P = $HOME
# set a customized dir C:\Users\XXX\
echo "Select a user: "
$U = Read-Host 
$D = "C:\Users\"
$P = "$D$U"
# set a fully customized dir
echo "Select a path: "
$P = Read-Host 
# debug section only - just ignore 
#echo "Path to scan: $P"
echo "Scanning for files greater than $S in a directory: $P"

Get-ChildItem -Path $P -Recurse | Where-Object {$_.Length -gt $S}
Get-ChildItem -Path $P -Recurse | Where-Object {$_.Length -gt $S} | Measure-Object -Property length -Minimum -Maximum -Average -Sum
