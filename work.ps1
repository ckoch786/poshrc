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
        '/p:NoWarn=SQL70588, SQL71502, SQL71588',
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

	git --git-dir=$GitRepoDatabase\.git --work-tree=$GitRepoDatabase  checkout $branch
	git --git-dir=$GitRepoDatabase\.git --work-tree=$GitRepoDatabase  fetch
	git --git-dir=$GitRepoDatabase\.git --work-tree=$GitRepoDatabase  pull 

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

$SqlServerInstance = "CKOCH"
$Database = "RosterApps_Alpha"

function sql {
	param (
		$query
	)
	Invoke-Sqlcmd -ServerInstance $SqlServerInstance -Database $Database -Query $query
}

function deleteAllEVB {
	$query = @'
delete from PackageWorkGroup_SeniorityRankRule
GO
delete from PackageWorkGroup_ParentChildMapping
GO
delete from PackageWorkgroup
GO
delete from EnhancedBidRoundOption
GO
delete from EnhancedBidRoundOptionHistory
GO
delete from EnhancedEmployeeStatusCharge
GO
delete from EnhancedLeftOverAccrualHoursOptions
GO
delete from EnhancedTimeChargedPerBidPreferenceOptions
GO
delete from EnhancedBidRoundAcknowledgment
GO
delete from EnhancedBidPreference
GO
delete from EnhancedBidRound_AvailableOpening
GO
delete from EnhancedBidRound_LiabilityLevelOption
GO
delete from EnhancedBidPreferenceCart
GO
delete from EmployeeParticipation
GO
delete from EnhancedBidRoundParticipationOverride
GO
delete from EnhancedBidRound
GO
delete from EnhancedBidPackageOption
GO
delete from EnhancedBidPackage_NotificationSettings
GO
delete from EnhancedBidPackage
'@
	sql $query
}