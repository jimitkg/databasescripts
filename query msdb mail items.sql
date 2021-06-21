
-- get emails log from msdb database

select top 100 * from msdb..sysmail_allitems
order by sent_date desc

--fetch registered mail profiles 

select * from msdb..sysmail_account