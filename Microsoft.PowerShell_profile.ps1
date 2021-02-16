Push-Location -Path $HOME\Documents\Source
Import-Module C:\Users\Ckoch\Documents\PowerShell\Modules\posh-git\1.0.0\posh-git.psd1
. (Join-Path $((Get-Module psreadline).ModuleBase) "SamplePSReadLineProfile.ps1")

Import-Module oh-my-posh
Set-Theme Star

if ($env:UserDomain -eq "ARCOSHQ") {
	. $Env:HOME\PowerShell\work.ps1
}

# Windows Terminal settings.json 
function eTerminalSettings {
	 code $Env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json
}

function eVSCodeSettings {
	code $Env:APPDATA\Code\User\settings.json
}

# Aliases
function sourcefunc {. $Env:HOME\PowerShell\Microsoft.PowerShell_profile.ps1}
Set-Alias -Name source -Value sourcefunc

function editProfile {code $PROFILE}
Set-Alias -Name eprofile -Value editProfile

function pushprofilehome { Push-Location -Path $Env:HOME\PowerShell}
Set-Alias -Name profilehome -Value pushprofilehome

# Git 
function gitPull { git pull}
Set-Alias -name gpull -Value gitPull

function gitFetch { git fetch}
Set-Alias -name gfetch -Value gitFetch

function gitFetch { git status}
Set-Alias -name gstatus -Value gitFetch

# PowerShell parameter completion shim for the dotnet CLI
Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
     param($commandName, $wordToComplete, $cursorPosition)
         dotnet complete --position $cursorPosition "$wordToComplete" | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
         }
 }
