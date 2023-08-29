Test migration for Portfolio Group

Migrate sample subfolder contents to sharepoint

On fucl-odmig01:

# Scan

```
PS O:\Scripts> . .\process-funcs.ps1

PS O:\Scripts> Connect-SPOService -url https://liveuclac-admin.sharepoint.com -Credential $admincred
PS O:\Scripts> import-module microsoft.sharepoint.migrationtool.powershell
PS O:\Scripts> Register-SPMTMigration -SPOCredential $admincred -Force -scanonly $true -WorkingFolder 'D:\GroupMigration'
PS O:\Scripts> $site = "https://liveuclac.sharepoint.com/sites/PMOGroup"
PS O:\Scripts> $source = "\\ad.ucl.ac.uk\groupfolders\ISD_ITPPD_Portfolio_Management\Master Financial Plans\2022-23\"
PS O:\Scripts> $targlist = "Documents"
PS O:\Scripts> $targpath = "MigrationTest"
PS O:\Scripts>
PS O:\Scripts> Add-SPMTTask -FileShareSource $source -TargetSiteUrl $site -TargetList $targlist -TargetListRelativePath $targpath
PS O:\Scripts> $result = Start-SPMTMigration
PS O:\Scripts> $result

PS O:\Scripts> Stop-SPMTMigration
PS O:\Scripts> Unregister-SPMTMigration
```

# Try it

```
PS O:\Scripts> . .\process-funcs.ps1                                                                                    PS O:\Scripts> Connect-SPOService -url https://liveuclac-admin.sharepoint.com -Credential $admincred
PS O:\Scripts> Import-Module microsoft.sharepoint.migrationtool.powershell
PS O:\Scripts> Register-SPMTMigration -SPOCredential $admincred -Force -scanonly $false -WorkingFolder 'D:\GroupMigration'
PS O:\Scripts> $site = "https://liveuclac.sharepoint.com/sites/PMOGroup"
PS O:\Scripts> $source = "\\ad.ucl.ac.uk\groupfolders\ISD_ITPPD_Portfolio_Management\Master Financial Plans\2022-23\"
PS O:\Scripts> $targlist = "Documents"
PS O:\Scripts> $targpath = "MigrationTest"
PS O:\Scripts> Add-SPMTTask -FileShareSource $source -TargetSiteUrl $site -TargetList $targlist -TargetListRelativePath $targpath
PS O:\Scripts> $result = Start-SPMTMigration
PS O:\Scripts> explorer \\ad\groupfolders\ISD_ITPPD_Portfolio_Management
PS O:\Scripts> Stop-SPMTMigration
Stopping an in-progress session will take some time, please wait patiently. If you want to stop the session by force, please close this window!
PS O:\Scripts> Unregister-SPMTMigration
```


