param([string] $JobId, $TriggerMetadata)

New-AzContainerGroup -ResourceGroupName $env:ResourceGroupName -Name $JobId `
    -Image alpine -OsType Linux `
    -Command "/bin/sh -c `"for i in ``seq 1 30``; do sleep 1; echo `$i; done`"" `
    -RestartPolicy Never
