$VDOTPath = "C:\VDOT"
$VDOTZipFolder = "Virtual-Desktop-Optimization-Tool-3.0.2009.0"
$VDOTUrl = "https://github.com/The-Virtual-Desktop-Team/Virtual-Desktop-Optimization-Tool/archive/refs/tags/3.0.2009.0.zip"

Write-Host "AVD Optimise: Creating $VDOTPath"
New-Item -Path $VDOTPath -ItemType Directory -ErrorAction SilentlyContinue

Write-Host "AVD Optimise: Downloading VDOT zip"
Invoke-WebRequest -Uri $VDOTUrl -OutFile "$VDOTPath\Virtual-Desktop-Optimization-Tool.zip"

Write-Host "AVD Optimise: Unblocking VDOT zip"
Unblock-File "$VDOTPath\Virtual-Desktop-Optimization-Tool.zip"

Write-Host "AVD Optimise: Expanding VDOT zip"
Expand-Archive -LiteralPath "$VDOTPath\Virtual-Desktop-Optimization-Tool.zip" -DestinationPath $VDOTPath -Force

Write-Host "AVD Optimise: Setting execution policy"
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process

Write-Host "AVD Optimise: Running Windows VDOT"
. "$VDOTPath\$VDOTZipFolder\Windows_VDOT.ps1" -Optimizations All -Verbose -AcceptEula
