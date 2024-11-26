declare @max_no int;
set @max_no = 10;

with collections as (
	select 
		1 as number
	union all
	select 
		number + 1 
	from collections
	where number < @max_no
)
select 
* 
from collections
