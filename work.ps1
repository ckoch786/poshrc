<# 
	Work 
#>

. $Env:HOME\PowerShell\sql.ps1


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

function cdprojects {Push-Location -Path C:\Users\CKoch\Documents\Personal\Projects}
Set-Alias -Name projects -Value cdprojects

$GitRepoDatabase = "C:\Users\CKoch\Documents\Source\arcos_rosterapps_database"

function dupdateFunction {
    $MSBuild = "C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\MSBuild\Current\Bin\MSBuild.exe"
	$LocalDeploysDir = "C:\Users\CKoch\Documents\Source\LocalDeploys"
	$BuildDebugDirectory="$LocalDeploysDir\AutoBuilds\RosterAppsDatabase\Debug"
	$DatabasePublishProfile = "$LocalDeploysDir\RosterApps.Database.publish.local.xml"
	
	# Get latest ------------------------------------------------------------------------------

	git --git-dir=$GitRepoDatabase\.git --work-tree=$GitRepoDatabase  fetch
	git --git-dir=$GitRepoDatabase\.git --work-tree=$GitRepoDatabase  pull

	# Build dacpac ------------------------------------------------------------------------------
	# Build warning SQL70588: WITH CHECK | NOCHECK option for existing data check enforcement is ignored.
	# Build warning SQL71502: Procedure: [dbo].[EnhancedBidRound_AvailableOpening_Get] has an unresolved reference to object --- EVB Only? No
	# Build warning SQL71558: The object reference [dbo].[EnhancedBidPackage_NotificationSettings].[NotificationTimeFrameAmount] differs only by case from the object definition

	$parameters = @(
        "$GitRepoDatabase\RosterApps.Database\RosterApps.Database.sqlproj",
        '/p:Configuration=Debug',
        "/p:PublishProfile=`"$DatabasePublishProfile`"",
        #'/p:NoWarn=SQL70588, SQL71502, SQL71588',
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

$GitRepoMain = "C:\Users\CKoch\Documents\Source\arcos_rosterapps_new"
function getRelease { 

	param (
		$branch
	)
	
	getReleaseDatabase $branch
	getReleaseWeb $branch
}

function getReleaseDatabase {
	param (
		$branch
	)

	git --git-dir=$GitRepoDatabase\.git --work-tree=$GitRepoDatabase  checkout $branch
	git --git-dir=$GitRepoDatabase\.git --work-tree=$GitRepoDatabase  fetch
	git --git-dir=$GitRepoDatabase\.git --work-tree=$GitRepoDatabase  pull 
	
}

function getReleaseWeb {
	param (
		$branch
	)
	
	git --git-dir=$GitRepoMain\.git --work-tree=$GitRepoMain  checkout $branch 
	git --git-dir=$GitRepoMain\.git --work-tree=$GitRepoMain  fetch
	git --git-dir=$GitRepoMain\.git --work-tree=$GitRepoMain  pull
}

function g2104 {
	getRelease 21.04
}

function g2106 {
	getRelease 21.06
}

function g2108 {
	getRelease 21.08
}

function g2110 {
	getRelease 21.10
}

function g2112 {
	getRelease 21.12
}

function g2114 {
	getRelease 21.14
}

function g2116 {
	getRelease 21.16
}

function g2118 {
	getRelease 21.18
}

function g2122 {
	getRelease 21.22
}

function g2124 {
	getRelease 21.24
}
function g2126 {
	getRelease 21.26
}
function g2128 {
	getRelease 21.28
}
function g2130 {
	getRelease 21.30
}

function g2132 {
	getRelease 21.32
}

function g2134 {
	getRelease 21.34
}

function g2136 {
	getRelease 21.36
}
function g2137 {
	getRelease 21.37
}


# URL example to create a PR on a specific release branch
#https://git.rostermonster.com/projects/ARA/repos/arcos_rosterapps_new/pull-requests?create&sourceBranch=refs/heads/bugfix/RAPD-8383&targetBranch=refs/heads/21.42

<#
	Need a new object type that includes feature/bug branch name, and release branch name, and link to JIRA?

	Example of bitbucket JIRA url https://git.rostermonster.com/plugins/servlet/jira-integration/issues/RAPD-8169

	object will have push and merge methods

	base object will have branch form latest and take a release branch

https://docs.microsoft.com/en-us/powershell/scripting/learn/deep-dives/everything-about-arrays?view=powershell-7.1
https://gist.github.com/kevinblumenfeld/4a698dbc90272a336ed9367b11d91f1c
#>

# TODO make a function that pulls out the Error lines
function getWarningMessages() {
	param (
		$msBuildOutput
	)

	$warningLines = Select-String -Path $msBuildOutput -Pattern 'warning CS'
	$warnings = New-Object Collections.Generic.List[string]

	$warningLines | Sort-Object |
		ForEach-Object {
			$warning = $_.Line.Trim().Split(' ')[2] -replace '.$' -replace 'CS'
			$warnings.Add($warning)
		}

		$warnings | Sort-Object | Get-Unique
}