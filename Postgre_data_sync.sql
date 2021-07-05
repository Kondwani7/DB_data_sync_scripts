create extension dblink;
--create a table that shall act as a copy to go to the destination db;
create table pathfinder as
select *
from dblink('host = localhost,
			user=postgres,
			password=yourpassword,
			dbname=source_db',
		   'select * from pathfindertemp')
			--the link table with the columns that match the files in your temp file
			as linktable(id int,
						name text,
						email text,
						age int,
						job_title text,
						company text)