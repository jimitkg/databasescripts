--Check port number and IP address of instance
SELECT SERVERNAME = CONVERT(NVARCHAR(128),SERVERPROPERTY('SERVERNAME'))   
,LOCAL_NET_ADDRESS AS 'IPAddressOfSQLServer'  
,local_tcp_port  AS 'PortNumber' 
 FROM SYS.DM_EXEC_CONNECTIONS WHERE SESSION_ID = @@SPID
