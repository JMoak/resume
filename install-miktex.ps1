<#
This will need to be run from elevated command prompt.
#>

$url = "https://miktex.org/download/ctan/systems/win32/miktex/setup/windows-x64/basic-miktex-23.4-x64.exe"
$output = "$PSScriptRoot\basic-miktex-20.6.29-x64.exe"
$start_time = Get-Date

Write-Output "https://miktex.org/download/ctan/systems/win32/miktex/setup/windows-x64/basic-miktex-23.4-x64.exe"
$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, $output)

Write-Output "Download Complete"
Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"

./basic-miktex-20.6.29-x64.exe
