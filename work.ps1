<# 
	Work 
#>

. $Env:HOME\PowerShell\sql.ps1

<#
	Example paths:
	-pathToRosterAppsWeb C:\source\worktrees\arcos_rosterapps_new\master\RosterApps.Web
	-pathToConfigs C:\Users\CKoch\Documents\Source\Config

	TODO trim off trailing '\' if they are passed in. Or is there a better way to work with paths?
#>
function createSymLinks {
	param (
		$fullPathToRosterAppsWeb,
		$fullPathToConfigs
	)

	if(!(Test-Path $fullPathToRosterAppsWeb)) { throw "$fullPathToRosterAppsWeb does not exist! Double check path." }
	if(!(Test-Path $fullPathToConfigs)) { throw "$fullPathToConfigs does not exist! Double check path." }

	$raConfigsDir = "$fullPathToRosterAppsWeb\Config" 
	New-Item -ItemType SymbolicLink -Path $raConfigsDir\appSettings.config -Target "$fullPathToConfigs\appSettings.config"
	New-Item -ItemType SymbolicLink -Path $raConfigsDir\connectionStrings.config -Target "$fullPathToConfigs\connectionStrings.config"
	New-Item -ItemType SymbolicLink -Path $raConfigsDir\qciF/amework.config -Target "$fullPathToConfigs\qciFramework.config"

	$ssoDir = "$fullPathToRosterAppsWeb\bin\sso"

	if(!(Test-Path $ssoDir)){
		mkdir $ssoDir
	}
	
	$templates = "$raConfigsDir\templatesToDeployToBin"
	New-Item -ItemType SymbolicLink -Path $ssoDir\metadata.xml -Target "$templates\metadata.xml"
	New-Item -ItemType SymbolicLink -Path $ssoDir\saml2.xml -Target "$templates\saml2.xml"
	New-Item -ItemType SymbolicLink -Path $ssoDir\ssoSettings.xml -Target "$templates\ssoSettings.xml"
}

function freshCheckOutRosterApps {
	param (
		$fullPathToSource,
		$fullPathToConfigs
	)

	if(!(Test-Path $fullPathToSource)) { throw "$fullPathToSource does not exist! Double check path." }
	
	$answer = Read-Host "Have you backed up your Config directory in RosterApps.Web? { y or n }"

	if($answer -eq "n" -Or $answer -eq "N") {
		throw "Backup your config directory before continuing."
	}

	$pathToRA = "$fullPathToSource\arcos_rosterapps_new"
	$dateTimeNow = get-date -f "yyyy-MM-dd_HH_mm_ss"
	$newName = "arcos_rosterapps_new_$dateTimeNow"

	if(Test-Path $pathToRA) {
		Write-Host "renaming existing $pathToRA to $newName, delete after fresh checkout if desired."
		Rename-Item $pathToRA "$fullPathToSource\$newName" 
	}

	Push-Location $fullPathToSource
	git clone "https://git.rostermonster.com/scm/ara/arcos_rosterapps_new.git"
	Pop-Location
	Write-Host "creating symlinks for Configs and bin\sso"
	createSymLinks -fullPathToRosterAppsWeb "$pathToRA\RosterApps.Web" -fullPathToConfigs "$fullPathToConfigs"
}

function cdra {Push-Location -Path C:\Users\CKoch\Documents\Source\arcos_rosterapps_new\RosterApps.Web\}
Set-Alias -Name ra -Value cdra

function cdram {Push-Location -Path C:\Users\CKoch\Documents\Source\mobile\www}
Set-Alias -Name ram -Value cdram

# Run mobile app out of www
function server {http-server -o}

function cdrapi {Push-Location -Path C:\Users\CKoch\Documents\Source\mobile-api}
Set-Alias -Name rapi -Value cdrapi

function deployautomation {Push-Location -Path C:\Users\Ckoch\Documents\Source\deployautomation }

function cdrauth {Push-Location -Path C:\Users\CKoch\Documents\Source\authenticationapi}
Set-Alias -Name rauth -Value cdrauth

function cdrad {Push-Location -Path C:\Users\CKoch\Documents\Source\arcos_rosterapps_database\}
Set-Alias -Name rad -Value cdrad

function cdprojects {Push-Location -Path C:\Users\CKoch\Documents\Personal\Projects}
Set-Alias -Name projects -Value cdprojects

$GitRepoDatabase = "C:\Users\CKoch\Documents\Source\arcos_rosterapps_database"

<#
To Use this function you must:
1. install Sql Server Developer addition and setup a local database, I just leave the default settings then you can connect
to it with 'localhost' as the servername in ssms. 
2. restore a decrypted database for RosterApps, at the time of this commit I have one that still works ;P 
3. first install SqlPackage.exe from Microsoft
4. copy the LocalDeploys directory to anywhere you'd like but updatet he $LocalDeployDir variable below
5. Update TargetConnectionString and TargetDatabaseName RosterApps.Database.publish.local.xml to match your local stepup
6. Update path to your local repo GitRepoDatabase variable above

Option things to setup:
1. add msbuild bin to your PATH in the environment variables
2. add C:\Program Files\Microsoft SQL Server\160\DAC\bin to your path if it is the same on your machine
#>
function dupdateFunction {
    $MSBuild = "C:\Program Files\Microsoft Visual Studio\2022\Professional\MSBuild\Current\Bin\MSBuild.exe"
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

	$SqlPackage = "C:\Program Files\Microsoft SQL Server\160\DAC\bin\SqlPackage.exe"

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

function dupdateConfigurationFunction {
    $MSBuild = "C:\Program Files\Microsoft Visual Studio\2022\Professional\MSBuild\Current\Bin\MSBuild.exe"
	$LocalDeploysDir = "C:\Users\CKoch\Documents\Source\LocalDeploys"
	$BuildDebugDirectory="$LocalDeploysDir\AutoBuilds\RosterAppsConfigurationDatabase\Debug"
	$DatabasePublishProfile = "$LocalDeploysDir\RosterAppsConfiguration.Database.publish.local.xml"
	
	# Get latest ------------------------------------------------------------------------------

	git --git-dir=$GitRepoDatabase\.git --work-tree=$GitRepoDatabase  fetch
	git --git-dir=$GitRepoDatabase\.git --work-tree=$GitRepoDatabase  pull

	# Build dacpac ------------------------------------------------------------------------------
	# Build warning SQL70588: WITH CHECK | NOCHECK option for existing data check enforcement is ignored.
	# Build warning SQL71502: Procedure: [dbo].[EnhancedBidRound_AvailableOpening_Get] has an unresolved reference to object --- EVB Only? No
	# Build warning SQL71558: The object reference [dbo].[EnhancedBidPackage_NotificationSettings].[NotificationTimeFrameAmount] differs only by case from the object definition

	$parameters = @(
        "$GitRepoDatabase\RosterAppsConfiguration.Database\RosterAppsConfiguration.Database.sqlproj",
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

	$SqlPackage = "C:\Program Files\Microsoft SQL Server\160\DAC\bin\SqlPackage.exe"

	$parameters = @(
			'/Action:Publish',
			"/SourceFile:`"$BuildDebugDirectory\RosterAppsConfiguration.Database.dacpac`""
			"/Profile:`"$DatabasePublishProfile`"" 
	)

	Write-Host "Info: Deploying RosterApps.Database"
	& $SqlPackage @parameters
	if(!($LASTEXITCODE -eq 0)) {
		throw "Fatal: SqlPackage failed"
	}

}
Set-Alias -name dupdateConfiguration -Value dupdateConfigurationFunction 

function ngBuildWatchEVB {
	ngReal build --watch EnhancedVacationBidding	
}

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

function gitBranchFromLatestWebAndDB {
   param (
      $release_branch,
      $feature_branch_RAPD,
      $bugfix_branch_RAPD
   )

	getReleaseWeb $release_branch
	getReleaseDatabase $release_branch

	if($feature_branch_RAPD) {
		localGitWeb checkout '-b' feature/RAPD-$feature_branch_RAPD
		localGitDB checkout '-b' feature/RAPD-$feature_branch_RAPD
	}

	if($bugfix_branch_RAPD) {
		localGitWeb checkout '-b' bugfix/RAPD-$bugfix_branch_RAPD 
		localGitDB checkout '-b' bugfix/RAPD-$bugfix_branch_RAPD
	}
}

function localGitWeb {
	param (
		$command,
		$flag,
		$branch
	)

	git --git-dir=$GitRepoMain\.git --work-tree=$GitRepoMain $command $flag $branch
}

function localGitDB {
	param (
		$command,
		$flag,
		$branch
	)

	git --git-dir=$GitRepoDatabase\.git --work-tree=$GitRepoDatabase $command $flag $branch
}

function gitMergeLatestWebAndDB {
	param (
		$release_branch,
		$feature_branch_RAPD,
		$bugfix_branch_RAPD
	)

	getReleaseWeb $release_branch
	getReleaseDatabase $release_branch

	if($feature_branch_RAPD) {
		localGitWeb checkout feature/RAPD-$feature_branch_RAPD
		localGitDB checkout feature/RAPD-$feature_branch_RAPD
	}

	if($bugfix_branch_RAPD) {
		localGitWeb checkout bugfix/RAPD-$bugfix_branch_RAPD 
		localGitDB checkout bugfix/RAPD-$bugfix_branch_RAPD
	}

	localGitWeb merge $release_branch
	localGitDB merge $release_branch
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
			$warning = $_.Line.Trim().Split(' ')[2] -replace '.$'
			$warnings.Add($warning)
		}

		$warnings | Sort-Object | Get-Unique
}