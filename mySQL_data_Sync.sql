set quoted_identifier on
go
--sync data between two tables in the same db, Mysql
create procedure [dbo].sync AS
--new data into current ROWS
insert into [pathfinder]
([Name])
from [pathfindertemp]
where [name] not in (select [name] from [pathfinder])
--update matching COLUMNS
--t2 is the target table, t1 the source table
update t2
set t2.name = t1.name
	t2.email = t1.email
	t2.age = t1.age
	t2.job_title = t2.job_title
from [pathfinder] as t2
inner join [pathfindertemp] as t1
on t2.[name] = t1.[name]
go