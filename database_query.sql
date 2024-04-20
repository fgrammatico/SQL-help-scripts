select
 SQL_Server_Version = @@version,
 SQL_Server_Edition = serverproperty('Edition'),
 SQL_Server_Name = serverproperty('ServerName'),
 Database_Name = a.Name,
 Maximum_Database_Size_MB = case when serverproperty('EngineEdition') in (1, 4) then case when cast(serverproperty('ProductVersion') as nvarchar(128)) like '8.%' then '2048 MB' when cast(serverproperty('ProductVersion') as nvarchar(128)) like '9.%' then '4096 MB' when cast(serverproperty('ProductVersion') as nvarchar(128)) like '10.0%' then '4096 MB' else '10240 MB' end else 'Effectively no limit' end,
 Data_Size_MB = convert(decimal(12,2),round(fileproperty(a.name,'SpaceUsed')/128.000,2)),
 Available_Growth_MB = case when serverproperty('EngineEdition') in (1, 4) then case when cast(serverproperty('ProductVersion') as nvarchar(128)) like '8.%' then 2048 when cast(serverproperty('ProductVersion') as nvarchar(128)) like '9.%' then 4096 when cast(serverproperty('ProductVersion') as nvarchar(128)) like '10.0%' then 4096 else 10240 end end - convert(decimal(12,2),round(fileproperty(a.name,'SpaceUsed')/128.000,2))
from
 sys.sysfiles a
where
 a.name not like '%_log';
