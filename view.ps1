 Get-View -ViewType HostSystem -Property Name, Summary.Runtime.ConnectionState, Summary.Runtime.PowerState, `
 Summary.Hardware.NumCpuCores, Summary.Hardware.CpuMhz, Summary.Hardware.MemorySize | Format-Table Name, @{Label="ConnectionState"; `
 Expression={$_.Summary.Runtime.ConnectionState}}, @{Label="PowerState"; Expression={$_.Summary.Runtime.PowerState}}, @{Label="NumCPU"; `
 Expression={$_.Summary.Hardware.NumCpuCores}}, @{Label="CPU (Ghz)"; Expression={[math]::round($_.Summary.Hardware.CpuMhz/1000, 1)}}, `
 @{Label="MemoryGB"; Expression={[math]::Round(($_.Summary.Hardware.MemorySize)/1GB, 0)}} -AutoSize

 measure-command { Get-View -ViewType HostSystem -Property Name, Summary.Runtime.ConnectionState, Summary.Runtime.PowerState, `
 Summary.Hardware.NumCpuCores, Summary.Hardware.CpuMhz, Summary.Hardware.MemorySize | Format-Table Name, @{Label="ConnectionState"; `
 Expression={$_.Summary.Runtime.ConnectionState}}, @{Label="PowerState"; Expression={$_.Summary.Runtime.PowerState}}, @{Label="NumCPU"; `
 Expression={$_.Summary.Hardware.NumCpuCores}}, @{Label="CPU (Ghz)"; Expression={[math]::round($_.Summary.Hardware.CpuMhz/1000, 1)}}, `
 @{Label="MemoryGB"; Expression={[math]::Round(($_.Summary.Hardware.MemorySize)/1GB, 0)}} -AutoSize  }

 Get-VMHost
 measure-command {Get-VMHost}

Get-View -ViewType VirtualMachine -Property Name, Runtime.PowerState, `
  Config.Hardware.NumCPU, Config.Hardware.MemoryMB   | Format-Table Name, @{Label="PowerState"; Expression = {$_.Runtime.PowerState} }, `
                                                                          @{Label="Num CPUs"; Expression = {$_.Config.Hardware.NumCPU} }, `
                                                                          @{Label="MemoryGB"; Expression = {[math]::Round(($_.Config.Hardware.MemoryMB)/1GB, 0)} } -AutoSize 

#######
Measure-Command {
        Get-View -ViewType VirtualMachine  -Property Name, Runtime.PowerState, `
        Config.Hardware.NumCPU, Config.Hardware.MemoryMB   | Format-Table Name, @{Label="PowerState"; Expression = {$_.Runtime.PowerState} }, `
                                                                          @{Label="Num CPUs"; Expression = {$_.Config.Hardware.NumCPU} }, `
                                                                         @{Label="MemoryGB"; Expression = {[math]::Round(($_.Config.Hardware.MemoryMB)/1GB, 0)} } -AutoSize 

    }

   

Get-VM
 Measure-Command {get-vm}

 $view = Get-View -ViewType VirtualMachine -filter @{"Name" = "OR10SVM-UAPP02"}