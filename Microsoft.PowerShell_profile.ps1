Push-Location -Path $HOME\Documents\Source
Import-Module C:\Users\Ckoch\Documents\PowerShell\Modules\posh-git\1.0.0\posh-git.psd1
. (Join-Path $((Get-Module psreadline).ModuleBase) "SamplePSReadLineProfile.ps1")

Import-Module oh-my-posh
#Set-Theme Star - TODO get this to have git info
Set-Theme Paradox

Import-Module InvokeBuild
set-alias ib invoke-build

Import-Module cd-extras


if ($env:UserDomain -eq "ARCOSHQ") {
	. $Env:HOME\PowerShell\work.ps1
}
function cl($path) { cd $path; ls; }
function dw { get-childitem $args | format-wide }

function grep {
<#
.SYNOPSIS
  Searches for matches in files
.DESCRIPTION
  grep forsomething -path .\subfolder -filter *.cs
#>
  param(
    [Parameter(Position=0, Mandatory=1)]
    [string]$pattern,
    [string]$path='.',
    [string]$filter=$null
  )
  $excludes = '*.exe', '*.dll', '*.pdb', '*.resx', '*.doc',
    '*.pdf', '*.map', '*.bmp', '*.png', '*.jpg', '*.psd',
    '*.db', '*.jar', '*.zip', '*.fla', '*.gif', '*.sqlite',
    '*.cache', '*.resources'
  dir -r -path $path -filter $filter -exclude $excludes |
    select-string $pattern
}

function ff([string] $filter) { dir -r -filter $filter }
function su {
  Start-Process 'PowerShell.exe' -Verb runas -WorkingDir $pwd -ARg "-noexit -command & cd $pwd"
}

# Windows Terminal settings.json
function eTerminalSettings {
	 code $Env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json
}

function eProfileWorkSpace {
  code $Env:HOME\PowerShell
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

function gitCOFile {
   param(
      $file
   )
   $filePathWithBackslashes = $file.Replace("/", "\")

   git checkout $filePathWithBackslashes
}

function gitBranchFromLatest{
   param(
      $release_branch,
      $feature_branch_RAPD,
      $bugfix_branch_RAPD
   )
  
   git checkout $release_branch
   git fetch
   git pull

   if($feature_branch_RAPD) {
    git checkout -b feature/RAPD-$feature_branch_RAPD
   }

   if($bugfix_branch_RAPD) {
    git checkout -b bugfix/RAPD-$bugfix_branch_RAPD
   }
}

function gitMergeLatest {
   param(
      $release_branch,
      $feature_branch_RAPD,
      $bugfix_branch_RAPD
   )
  
   git checkout $release_branch
   git fetch
   git pull

   if($feature_branch_RAPD) {
    git checkout feature/RAPD-$feature_branch_RAPD
   }

   if($bugfix_branch_RAPD) {
    git checkout bugfix/RAPD-$bugfix_branch_RAPD
   }
   
  git merge $release_branch
}

# PowerShell parameter completion shim for the dotnet CLI
Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
     param($commandName, $wordToComplete, $cursorPosition)
         dotnet complete --position $cursorPosition "$wordToComplete" | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
         }
 }

# Shows navigable menu of all options when hitting Tab
 Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
 Set-PSReadlineOption -EditMode vi


 function functions{
   Get-Content $PSCommandPath | Select-String function | Sort-Object | Write-Host
   Write-Host '-----------------------[Work Settings]------------------------------'
   Get-Content $Env:HOME\PowerShell\work.ps1 | Select-String function | Sort-Object | Write-Host
 }

 function projectsPrint {
   Write-Host "Main work repos Documents\Source for more use workProjects command"
   Write-Host "Educational repos: Documents\Personal\Projects"
 }

 function workProjects {
   Write-Host "TODO"
 }

 function educationalProjects {
  Get-ChildItem $Env:HOME\Personal\Projects
 }

function cdeducational {Push-Location -Path C:\Users\CKoch\Documents\Personal\Projects}

function coolCommands {
  write-host "Get-PSReadLineKeyHandler - show all key mappings"
}

#Set-PSDebug -Trace 0

function AddLine {
    param(
        $rootPath,
        $fileExtension,
        $lineToAdd
    )

    get-childitem $rootPath\*$fileExtension -recurse | ` 
        foreach-object { 
                write-host $_ && "$lineToAdd`r`n" + (get-content  $_.FullName | out-string) | ` 
                set-content $_.FullName 
            }
}

function RunAddLine {
     AddLine -rootPath "C:\Users\CKoch\Documents\Source\arcos_rosterapps_new\RosterApps.Web\" -fileExtension ".aspx.cs" -lineToAdd "using RosterApps.Web.WebSecurity;"
}

function RemoveLine {
    param(
        $rootPath,
        $fileExtension,
        $lineToRemove
    )

    get-childitem $rootPath\*$fileExtension -recurse | ` 
        foreach-object { 
                write-host $_ && (get-content  $_.FullName) | ` 
                where-object { 
                    $_ -notmatch "$lineToRemove"
                } | `

                set-content $_.FullName 
            }
}


function runRemoveLine {
    RemoveLine -rootPath "C:\Users\CKoch\Documents\Source\arcos_rosterapps_new\RosterApps.Web\" -fileExtension ".aspx.cs" -lineToRemove "private UserIdentity _user = "
}