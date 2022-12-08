# Input bindings are passed in via powershell param block
# parameters to the stored procedure were set in app settings
param($Timer, $ChangeTrackingHealth)

# get first item from changetrackinghealth array
$ChangeTrackingHealth = $ChangeTrackingHealth[0]

# check CT_Rows is greater than 1000000
if ($ChangeTrackingHealth.CT_Rows -gt 1000000) {
    # do something like send an email or alert
    Write-Host "Warning!"
    Write-Host "Change Tracking Rows is greater than 1000000"
}
else {
    Write-Host "Change Tracking health is ok"
}
