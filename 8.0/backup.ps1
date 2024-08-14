<#
    .NOTES
    ===============================================================================
    | Created By:       Alex Ackerman
    | Date:             13 SEPT 2023
    | Organization:     Korea Battle Simulation Center
    | Last Modified By: Alex Ackerman
    | Last Modified:    13 SEPT 2023
    ===============================================================================
    
    .DESCRIPTION
    Starts a file-based backup of a vCenter Server to a backup server

    .SYNOPSIS
    Backup of the vCenter Configuration to an external server

#>
param(
    [string] $vCenterServer = "vcs.kten.test",
    [string] $backupServer = "ceist-fs-01.kten.test",
    [string] $backupType = "SMB",
    [string] $folder = "smb://ceist-fs-01.kten.test/vcs-backup/current"
    [string] $backupServerUser = "KTENT\backup"
    [string]
)


New-ApplianceBackupJob -Server $vCenterServer -BackupServer $backupServer -BackupServerType $backupType -FolderPath $folder 
