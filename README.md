# Run and monitor long running tasks with Azure Functions and Azure Container Instances

1. Send request to `POST /api/jobs?code=<functions_code>` to start a job (executes `RequestJob` function). It responds with a 202 status code and a location header. It also triggers `StartJob` function via a queue.
1. Send `GET` request to the location to get job status and logs (executes `GetJobStatus` function).
    - Returns status 202 if job is still in progress
    - Returns status 200 if job is complete

## Resources

For more information, see the [blog post](https://dev.to/azure/event-driven-serverless-containers-with-powershell-azure-functions-and-azure-container-instances-e9b).

* [PowerShell for Azure Functions announcement](https://azure.microsoft.com/blog/serverless-automation-using-powershell-preview-in-azure-functions/?WT.mc_id=functionspowershellrunaci-github-antchu)
* [Azure Functions developers guide for PowerShell](https://docs.microsoft.com/azure/azure-functions/functions-reference-powershell?WT.mc_id=functionspowershellrunaci-github-antchu)
* [PowerShell Functions quickstart](https://docs.microsoft.com/azure/azure-functions/functions-create-first-function-powershell?WT.mc_id=functionspowershellrunaci-github-antchu)
