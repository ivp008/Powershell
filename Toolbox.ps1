Get-WindowsFeature -ComputerName vs09 -Name web-* | where installstate -eq installed | Export-Clixml C:\temp\.63_IIS.xml
Compare-Object -ReferenceObject (Get-WindowsFeature -ComputerName vs09 -Name web-* | where installstate -eq installed) -DifferenceObject (Get-WindowsFeature -ComputerName vs10 -Name web-* | where installstate -eq installed) -Property name

 Get-EventLog -LogName system -Newest 20 -source adp94xx | ConvertTo-Html -As Table | Out-File D:\temp\powershell\SH01_adp94xx_errors.htm

 Get-VirtualDisk -FriendlyName "Tiered" | Get-StorageTier

 Get-WmiObject -Class Win32_OperatingSystem |Select csname, Description

 # Powershell 4.0 - Windows 2012 and R2
Get-WindowsFeature -ComputerName vs09 -Name web-* | where installstate -eq installed | Export-Clixml C:\temp\.63_IIS.xml

# Powershell 3.0 - Windows 2008 R2
Get-WindowsFeature -Name web-* | where installed -eq true | Export-Clixml C:\temp\VM-IC-2008R2-03_IIS.xml

Compare-Object -ReferenceObject (Get-WindowsFeature -ComputerName vs09 -Name web-* | where installstate -eq installed) -DifferenceObject (Get-WindowsFeature -ComputerName vs10 -Name web-* | where installstate -eq installed) -Property name

copy-item C:\temp\VM-IC-2008R2-03_IIS.xml -Destination '\\192.168.11.40\d$\temp\powershell'

Invoke-Command -cn $myservers {Get-EventLog system -new 3} | sort timewritten | format-table -Property timewritten, message, pscomputername -AutoSize

ls

register-packagesource -Name chocolatey -Provider PSModule -Trusted -Location http://chocolatey.org/api/v2/ -Verbose