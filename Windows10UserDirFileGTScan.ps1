<#

A simple script to list files within a user directory with size greater than X

#>


echo "Pick a size: "
$S = Read-Host 
echo "Select a user: "
$U = Read-Host 
$D = "C:\Users\"
$P = "$D$U"
#echo "Debug only: Path to scan: $P"
echo "Scanning for files greater than $S in a directory: $P"

Get-ChildItem -Path $P -Recurse | Where-Object {$_.Length -gt $S}
#Get-ChildItem -Path $P -Recurse | Where-Object {$_.Length -gt $S} | Measure-Object
