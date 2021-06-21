

-- error log


EXEC Xp_readerrorlog    0,    1,    N'dbcc',    N'traceon'  
-- first 0 means look in latest file , next 1 means error log 2 means agent log

exec xp_readerrorlog 0, 1, N'DBCC', N'3604', '20200401', '20200401 18:00';
exec xp_readerrorlog 0, 1, N'DBCC', N'3604', '20200401', '20200401 12:00', 'DESC'
EXEC Xp_readerrorlog    0,    1,   N'simple' ,    N'' , '2020-08-27 11:50:36.990' , '2020-08-28 11:57:37.990','desc'

-----------------------------



declare @endtime as datetime = getdate()
declare @starttime as datetime = getdate() -1

print @starttime
print @endtime

EXEC Xp_readerrorlog    0,    1,   N'' ,    N'' , @starttime , @endtime,'desc'
-- first 0 means look in latest file , next 1 means error log 2 means agent log

--AG faliover message
 --The state of the local availability replica in availability group
 
 