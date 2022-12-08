using namespace System.Net

# Input bindings are passed in via param block.
param($Request, $TriggerMetadata, $ChangeTrackingHealth)

# Write to the Azure Functions log stream.
Write-Host "PowerShell HTTP trigger function processed a request."

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



# Associate values to output bindings by calling 'Push-OutputBinding'.
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
    StatusCode = [HttpStatusCode]::OK
    Body = $ChangeTrackingHealth
})
