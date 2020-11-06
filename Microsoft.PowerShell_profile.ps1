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

function cdra {Push-Location -Path C:\Users\CKoch\Documents\Source\arcos_rosterapps_new\RosterApps.Web\}
Set-Alias -Name ra -Value cdra

function cdram {Push-Location -Path C:\Users\CKoch\Documents\Source\RosterAppsMobile\RosterAppsMobile\www}
Set-Alias -Name ram -Value cdram

# Run mobile app out of www
function server {http-server -o}

function cdrapi {Push-Location -Path C:\Users\CKoch\Documents\Source\mobile-api}
Set-Alias -Name rapi -Value cdrapi

function cdrauth {Push-Location -Path C:\Users\CKoch\Documents\Source\RosterApps.Authenticate.API}
Set-Alias -Name rauth -Value cdrauth

function cdrad {Push-Location -Path C:\Users\CKoch\Documents\Source\arcos_rosterapps_database\}
Set-Alias -Name rad -Value cdrad

# Git 
function gitPull { git pull}
Set-Alias -name gpull -Value gitPull

function gitFetch { git fetch}
Set-Alias -name gfetch -Value gitFetch

function functions {
	Write-Host "source, eprofile, profilehome, ra, ram, server, rapi, rad, rauth, gp, gf"
}
