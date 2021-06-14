--------------------------------------------------------
--Change owner of all databases to SA
--------------------------------------------------------

declare @dbtable table (id int identity(1,1), DBName nvarchar(50)) 

insert into @dbtable
select d.name from sys.databases d
where d.owner_sid <> 0x01 and is_read_only = 0

declare @ID int,  @DB varchar(100), @SQL varchar(max)

select @ID = MIN(ID) from @dbtable 
while @ID is not null
begin
      Select @DB = DBName  from @dbtable where id = @id
      select @SQL = 'ALTER AUTHORIZATION ON DATABASE::[' + @DB + '] To [sa];'
      --exec (@SQL)
      Print @SQL
      select @ID = MIN(ID) from @dbtable where ID > @ID
end
