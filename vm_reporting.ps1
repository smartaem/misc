$server = @("P2505V-PAYX01A","R1501V-D01R01B","R1502V-D05C01A") 

#report vm host and datastore
$result = @()
 foreach ($vm in $server){
 	$result += Get-VM $vm | select Name,@{Name="Cluster"; Expression = {get-cluster -host $_.Host }}, @{Name ="Datastore"; Expression ={get-datastore -VM $vm }}
}

#find IP address
$server | foreach{ Get-View -ViewType virtualmachine -filter @{"name" = "$_"} | select name,@{Name = "VM IP"; expression = {$_.guest.ipaddress}}} | FT –AutoSize
