<#
A simple script to list files within a given directory with size greater than x
#>

# MENU
Write-Host "1 - With static HOME directory: $HOME"
Write-Host "2 - With customized HOME directory"
Write-Host "3 - With fully customized directory"
[int]$MenuItem = Read-Host -Prompt 'Select a proper option'

if($MenuItem -eq 1){
    Write-Host "1 - selected"
    $P = $HOME
    $S = Read-Host -Prompt 'Pick a size to search for (greater than ; in MB)'
}
elseif($MenuItem -eq 2){
    Write-Host "2 - selected"
    $U = Read-Host -Prompt 'Select a username'
    $D = "C:\Users\"
    $P = "$D$U"
    $S = Read-Host -Prompt 'Pick a size to search for (greater than ; in MB)'
}
elseif($MenuItem -eq 3){
    Write-Host "3 - selected"
    $P = Read-Host -Prompt 'Select a path to scan'
    $S = Read-Host -Prompt 'Pick a size to search for (greater than ; in MB)'
}
else {
    Write-Host "Wrong selection"
}

Write-Host "Scanning for files greater than $S in a directory: $P"

$LargeFiles = Get-ChildItem -Path $P -Recurse | Where-Object {$_.Length -gt $S} 
$LargeFilesCount = $LargeFiles | Measure-Object | Select-Object -ExpandProperty Count
foreach ($i in $LargeFiles) {
    Write-Host "$i"
}
Write-Host "W sumie $LargeFilesCount plikow"
