-- mark database offline 
use master
go

ALTER DATABASE dbname set offline
 with rollback immediate

--get file details
sp_helpdb dbname

--note details and copy for reference

--move database files (copy and paste)
--change logical pointer on master database

USE master;
ALTER DATABASE dbname
MODIFY FILE (name='dbname'
             ,filename='E:\db.mdf')

			 ALTER DATABASE epo
MODIFY FILE (name='db_log'
             ,filename='E:\db_log.LDF')


--turn database back online 
ALTER DATABASE dbname set online
 with rollback immediate
