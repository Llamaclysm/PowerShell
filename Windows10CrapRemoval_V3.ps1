<#

A command to get an app that should be removed:
    Get-AppxPackage -allusers | Select Name, PackageFullName

Not on the list (various reasons):
    "*office*"

#>
$bloatware = @(
    "*Bing*"
    "*office*"
    "*Facebook*"
    "*Linkedin*"
    "*xbox*"
    "*twitter*"
    "*zune*"
    "*solitaire*"
    "*netflix*"
    "*skype*"
    "*Sketchable*"
    "*yourphone*"
    "*freshpaint*"
    "*MixedReality*"
    "*Microsoft3DViewer*"
    "*print3D*"
    "*windowscommunicationsapps*"
    "*Microsoft.People*"
    "*Microsoft.Messaging*"
    "*Microsoft.Windows.Photos*"
    "*Microsoft.YourPhone*"
    "*Microsoft.MsixPackagingTool*"
    "*dropbox*"
    "*CandyCrush*"
    "*windowsphone*"
    "*AutodeskSketchBook*"
    "*Xboxapp*"
    "Microsoft.XboxIdentityProvider"
    "Microsoft.Xbox.TCUI"
    "Microsoft.XboxSpeechToTextOverlay"
    "Microsoft.OneConnect"
    "Microsoft.XboxGamingOverlay"
    "DellInc.DellDigitalDelivery" 
)

foreach ($bloat in $bloatware) {
    Write-Host "$bloat"
    Get-AppxPackage -allusers $bloat | Remove-AppxPackage -allusers
}
