# This powershell script is used to delete logs that are generated via IIS
# You may decide to stop iis before triggering this
# Remember to start iis if you decide on stopping iis before executing this script
$IISLogFolders = 'C:\inetpub\logs\LogFiles'

# stop IIS before deleting logs
 iisreset /stop
foreach ($LogFolder in $IISLogFolders)
{
    if (test-path $LogFolder) 
	{
		Try{
			Remove-Item -Path $LogFolder -Force -Recurse
		}
		Catch{
			Write-Error "Logfile delete failed:" $_
			Exit 1
		}
    }
}
# start IIS after deleting logs
 iisreset /start