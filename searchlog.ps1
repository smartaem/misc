
$vmhost = Get-VMHost 'a0200-psvi01q.ise.pos.net'
$keys = Get-LogType -VMHost $vmhost
$keys | ft -AutoSize

#----------Search Single Host
$logs = $vmhost | Get-Log -Key 'hostd'
$logs.Entries | Select-String -Pattern "SearchPattern"

#----------Searching Multiple Hosts
$vmhosts = Get-VMHost -Location (Get-Datacenter *)
$logs = $vmhosts | Get-Log -Key 'hostd'
$logs.Entries | Select-String -Pattern "error"

