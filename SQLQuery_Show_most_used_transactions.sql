select 
qs.execution_count,
qt.text,
qt.dbid,
dbname=db_name(qt.dbid),
qt.objectid,
qs.total_rows,
qs.last_rows,
qs.min_rows,
qs.max_rows,
qs.total_elapsed_time
from sys.dm_exec_query_stats as qs
cross apply sys.dm_exec_sql_text(qs.sql_handle) as qt
where qs.last_execution_time>='10/31/2016 14:00'
order by 1 desc