using namespace System.Net

param($Request, $TriggerMetadata)

$ContainerName = (New-Guid).ToString()
$StatusUrl = "/api/jobs/$($ContainerName)"

Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
    StatusCode = [HttpStatusCode]::Accepted
    Headers = @{
        "Location" = $StatusUrl
        "Content-type" = "application/json"
    }
    Body = $StatusUrl
})

Push-OutputBinding -Name JobQueue -Value $ContainerName
