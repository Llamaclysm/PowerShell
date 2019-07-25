$bloatware = @(
    "*xbox*"
    "*office*"
)

foreach ($bloat in $bloatware) {
    Get-AppxPackage -allusers $bloat | Remove-AppxPackage -allusers
}
