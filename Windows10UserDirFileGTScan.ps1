<#

A simple script to list files within a user directory with size greater than X

#>


echo "Pick a size: "
$S = Read-Host 
echo "Select a user: "
$U = Read-Host 
$D = "C:\Users\"
$P = "$D$U"
#echo "Path to scan: $P"

Get-ChildItem -Path $P -Recurse | Where-Object {$_.Length -gt $S}
#Get-ChildItem -Path $P -Recurse | Where-Object {$_.Length -gt $S} | Measure-Object
