EXEC MASTER..xp_fixeddrives
GO

SELECT DISTINCT dovs.logical_volume_name AS LogicalName,
dovs.volume_mount_point AS Drive,
CONVERT(INT,dovs.available_bytes/1048576.0) AS FreeSpaceInMB
FROM sys.master_files mf
CROSS APPLY sys.dm_os_volume_stats(mf.database_id, mf.FILE_ID) dovs
ORDER BY FreeSpaceInMB ASC
GO

SELECT DISTINCT DB_NAME(dovs.database_id) DBName,
dovs.logical_volume_name AS LogicalName,
dovs.volume_mount_point AS Drive,
CONVERT(INT,dovs.available_bytes/1048576.0) AS FreeSpaceInMB
FROM sys.master_files mf
CROSS APPLY sys.dm_os_volume_stats(mf.database_id, mf.FILE_ID) dovs
ORDER BY FreeSpaceInMB ASC
GO

SELECT DISTINCT DB_NAME(dovs.database_id) DBName,
mf.physical_name PhysicalFileLocation,
dovs.logical_volume_name AS LogicalName,
dovs.volume_mount_point AS Drive,
CONVERT(INT,dovs.available_bytes/1048576.0) AS FreeSpaceInMB
FROM sys.master_files mf
CROSS APPLY sys.dm_os_volume_stats(mf.database_id, mf.FILE_ID) dovs
ORDER BY FreeSpaceInMB ASC
GO


SELECT DISTINCT DB_NAME(dovs.database_id) DBName,
mf.physical_name PhysicalFileLocation,
dovs.logical_volume_name AS LogicalName,
dovs.volume_mount_point AS Drive,
CONVERT(INT,dovs.available_bytes/1048576.0/1024.0) AS FreeSpaceInGB,
CONVERT(INT,dovs.total_bytes/1024.0/1024.0/1024.0) AS TotSpaceGB,
CONVERT(INT,dovs.available_bytes/1048576.0) AS FreeSpaceInMB,
CONVERT(INT,dovs.total_bytes/1024.0/1024.0) AS TotalSpaceInMB
FROM sys.master_files mf
CROSS APPLY sys.dm_os_volume_stats(mf.database_id, mf.FILE_ID) dovs
ORDER BY FreeSpaceInGB ASC

GO
