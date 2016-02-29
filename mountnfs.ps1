Get-Datacenter |  get-cluster Clusername | get-host | foreach {

    New-Datastore -Nfs -VMHost $_.Name -Name DatastoreName -Path NfsPath -NfsHost NFSHostOrIP
}