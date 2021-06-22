--=========================================================
--import data from excel
--========================================================
--using openrowset

USE [master]
GO

EXEC master.dbo.sp_MSset_oledb_prop N'Microsoft.Jet.OLEDB.4.0' , N'AllowInProcess' , 1
GO

EXEC master.dbo.sp_MSset_oledb_prop N'Microsoft.Jet.OLEDB.4.0' , N'DynamicParameters' , 1
GO

insert into db1.dbo.openquerytest
select * from openrowset('Microsoft.ACE.OLEDB.12.0','Excel 8.0;Database=C:\Book1.xlsx', [Sheet1$])

SELECT *
FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0', 'Excel 12.0;Database=C:\Temp\Test.xlsx;', 'SELECT * FROM [Sheet1$]')


--File Type (extension)                               Extended Properties
---------------------------------------------------------------------------------
--Excel 97-2003 Workbook (.xls)                       "Excel 8.0"
--Excel 2007-2010 Workbook (.xlsx)                    "Excel 12.0 Xml"
--Excel 2007-2010 Macro-enabled workbook (.xlsm)      "Excel 12.0 Macro"
--Excel 2007-2010 Non-XML binary workbook (.xlsb)     "Excel 12.0"

---Using linked server

exec sp_addlinkedserver 'ImportDataExcelAce',
'Jet 12.0', 'Microsoft.ACE.OLEDB.12.0','C:\Book1.xlsx',NULL,'Excel 12.0'

truncate table openquerytest

insert into openquerytest
select * from openquery(ImportDataExcelAce, 'select * from [Sheet2$]')