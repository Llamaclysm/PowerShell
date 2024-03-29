<#
A simple script to list files within a given directory with size greater than x
#>

# MENU
Write-Host "1 - With static HOME directory: $HOME"
Write-Host "2 - With customized HOME directory"
Write-Host "3 - With fully customized directory"
[int]$MenuItem = Read-Host -Prompt 'Select a proper option'

# LOGIC
if($MenuItem -eq 1){
    Write-Host "Scanning with static HOME directory: $HOME"
    $P = $HOME
}
elseif($MenuItem -eq 2){
    Write-Host "Scanning with customized HOME directory"
    $U = Read-Host -Prompt 'Select a username'
    $P = "C:\Users\$U"
}
elseif($MenuItem -eq 3){
    Write-Host "Scanning with fully customized directory"
    $P = Read-Host -Prompt 'Select a path to scan'
}
else {
    Write-Host "Wrong selection"
}

$S = Read-Host -Prompt 'Pick a size to search for (greater than ; in MB ; eg. 500MB)'
Write-Host "Scanning for files greater than $S in a directory: $P"

# MAGIC
$LargeFiles = Get-ChildItem -Path $P -Recurse | Where-Object {$_.Length -gt $S} 
$LargeFilesCount = $LargeFiles | Measure-Object | Select-Object -ExpandProperty Count
foreach ($item in $LargeFiles) {
    Write-Host "$item"
}
[Int64]$totalSize = 0
foreach ($file in $LargeFiles) {
    $totalSize += $file.Length
}
Write-Host "$LargeFilesCount files greater than $S , with a total size of $($totalSize /1GB) GB"
