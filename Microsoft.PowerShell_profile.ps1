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

function gitFetch { git status}
Set-Alias -name gstatus -Value gitFetch


function dupdateFunction {
    $MSBuild = "C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\MSBuild\Current\Bin\MSBuild.exe"
	$GitRepo = "C:\Users\CKoch\Documents\Source\arcos_rosterapps_database"
	$LocalDeploysDir = "C:\Users\CKoch\Documents\Source\LocalDeploys"
	$BuildDebugDirectory="$LocalDeploysDir\AutoBuilds\RosterAppsDatabase\Debug"
	$DatabasePublishProfile = "$LocalDeploysDir\RosterApps.Database.publish.local.xml"
	
	# Get latest ------------------------------------------------------------------------------

	git --git-dir=$GitRepo\.git --work-tree=$GitRepo fetch
	git --git-dir=$GitRepo\.git --work-tree=$GitRepo pull

	# Build dacpac ------------------------------------------------------------------------------

	$parameters = @(
        "$GitRepo\RosterApps.Database\RosterApps.Database.sqlproj",
        '/p:Configuration=Debug',
        "/p:PublishProfile=`"$DatabasePublishProfile`"",
        "/p:CurrentDirectory=`"$BuildDebugDirectory`"",
        "/p:OutDir=`"$BuildDebugDirectory`"" 
	)
	
	& $MSBuild @parameters
	if(!($LASTEXITCODE -eq 0)) {
		throw "Fatal: MSBuild failed"
	}

	# Deploy dacpac ------------------------------------------------------------------------------

	$SqlPackage = "C:\Program Files\Microsoft SQL Server\150\DAC\bin\SqlPackage.exe"

	$parameters = @(
			'/Action:Publish',
			"/SourceFile:`"$BuildDebugDirectory\RosterApps.Database.dacpac`""
			"/Profile:`"$DatabasePublishProfile`"" 
	)

	Write-Host "Info: Deploying RosterApps.Database"
	& $SqlPackage @parameters
	if(!($LASTEXITCODE -eq 0)) {
		throw "Fatal: SqlPackage failed"
	}

}
Set-Alias -name dupdate -Value dupdateFunction 


function ngBuildWatch { ngReal build --watch }
Set-Alias -name bwatch -Value ngBuildWatch

function runRstrap { iisexpress /path:C:\Users\CKoch\Documents\Source\arcos_rosterapps_new\RosterApps.Web }
Set-Alias -name rrun -Value runRstrap

function merge { pushd C:\Users\CKoch\Documents\Source\Merge\ }
Set-Alias -name merge -Value merge

function functions {
	Write-Host "source, eprofile, profilehome, ra, ram, server, rapi, rad, rauth, gpull, gfetch, pstatus, dupdate, bwatch, merge, rrun"
}