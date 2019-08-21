<#
A simple script to list files within a given directory with size greater than X
#>


$S = Read-Host -Prompt 'Pick a size to search for (greater than ; in MB)'
# static home dir
#$P = $HOME
# set a customized dir @C:\Users\XXX\
$U = Read-Host -Prompt 'Select a username'
#$U = $env:USERNAME
$D = "C:\Users\"
$P = "$D$U"
# set a fully customized dir
#$P = Read-Host -Prompt 'Select a path'
# debug section only - just ignore 
#echo "Path to scan: $P"
Write-Host "Scanning for files greater than $S in a directory: $P"

$LargeFiles = Get-ChildItem -Path $P -Recurse | Where-Object {$_.Length -gt $S} 
$LargeFilesCount = $LargeFiles | Measure-Object | Select-Object -ExpandProperty Count
foreach ($i in $LargeFiles) {
    Write-Host "$i"
}
Write-Host "$LargeFilesCount files total."
