Import-Module sqlserver
# TODO add check for Install-Module sqlserver
$SqlServerInstance = "localhost"
$Database = "RosterApps_Alpha"

function sql {
	param (
		$query
	)
	Invoke-Sqlcmd -ServerInstance $SqlServerInstance -Database $Database -Query $query
}

function deleteAllEVB {
	$query = @'
delete  from EnhancedBidPackageOption
GO
delete from EnhancedBidPackage_LiabilityDays
GO
delete from PackageBidGroup_WorkGroups
GO
delete from PackageBidGroup_LiabilityGroups
GO
delete from PackageBidgroup
GO
delete from EnhancedBidPackage
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
delete from EnhancedBidPackageAcknowledgment
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

function deleteAllSelections {
    param (
        $employeeID
    )

	# Work in progress this does not work as expected
    $sqlFile = "$Env:HOME\PowerShell\sprocs\EVB_DeleteAllSelections.sql"
	Invoke-Sqlcmd -ServerInstance $SqlServerInstance -Database $Database -InputFile $sqlFile -Variable @("employeeID=$employeeID")
     
}


function EVBFunctions {
    Write-Host "deleteAllSelections - delete cart for user and all preferences"
}
