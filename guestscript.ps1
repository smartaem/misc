#        $VMs = Get-VM VMNAME | Where {$_.PowerState -eq "PoweredOn"}
#        Foreach ($VM in $VMS){
#              $VCName = $VM.Name
#              $WinName = $VM.Guest.Hostname
#              If ($WinName -ne $VCName) {
#                    $renamecomputer = "wmic path win32_computersystem where ""Name='%computername%'"" CALL rename name='$VCName'"
#                    Invoke-VMScript -VM $VM -GuestUser "Administrator" -GuestPassword "vmware" -ScriptType Bat -ScriptText $renamecomputer
#                    restart-vmguest -VM $VM -Confirm:$false
#              }
#        }
