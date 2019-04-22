using namespace System.Net

param($Request, $TriggerMetadata)

$JobId = $Request.Params.JobId

$JobStatus = Get-AzContainerGroup -ResourceGroupName $env:ResourceGroupName -Name $JobId
$JobLogs = Get-AzContainerInstanceLog -ResourceGroupName powershell-func-aci -ContainerGroupName $JobId

If ($JobStatus.State -eq "Succeeded") {
    $StatusCode = [HttpStatusCode]::OK
} ElseIf ($JobStatus.State -eq "Failed") {
    $StatusCode = [HttpStatusCode]::InternalServerError
} Else {
    $StatusCode = [HttpStatusCode]::Accepted
}

Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
    StatusCode = $StatusCode
    Headers = @{
        "Content-type" = "application/json"
    }
    Body = @{
        "state" = $JobStatus.State
        "logs" = $JobLogs
    }
})
