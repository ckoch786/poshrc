Push-Location -Path $HOME\Documents\Source
Import-Module C:\Users\Ckoch\Documents\PowerShell\Modules\posh-git\1.0.0\posh-git.psd1
. (Join-Path $((Get-Module psreadline).ModuleBase) "SamplePSReadLineProfile.ps1")


# Aliases

function sourcefunc {. C:\Users\CKoch\Documents\PowerShell\Microsoft.PowerShell_profile.ps1}
Set-Alias -Name source -Value sourcefunc

function editProfile {code $PROFILE}
Set-Alias -Name eprofile -Value editProfile

function pushprofilehome { Push-Location -Path C:\Users\CKoch\Documents\PowerShell}
Set-Alias -Name profilehome -Value pushprofilehome

function cdra {Push-Location -Path C:\Users\CKoch\Documents\Source\arcos_rosterapps_new\}
Set-Alias -Name ra -Value cdra

function cdram {Push-Location -Path C:\Users\CKoch\Documents\Source\RosterAppsMobile\RosterAppsMobile}
Set-Alias -Name ram -Value cdram

function cdrapi {Push-Location -Path C:\Users\CKoch\Documents\Source\mobile-api}
Set-Alias -Name rapi -Value cdrapi

