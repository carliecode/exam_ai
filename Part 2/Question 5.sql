with employeetable as (
    select 1 as id, 1 as empid, 0 as parentid, 'main parent yogi' as description union all
    select 2, 2, 0, 'main parent ron' union all
    select 3, 3, 0, 'main parent don' union all
    select 4, 4, 2, 'child jaz' union all
    select 5, 5, 2, 'child rat' union all
    select 6, 6, 1, 'child tom' union all
    select 7, 7, 1, 'child jerry' union all
    select 8, 8, 3, 'child din' union all
    select 9, 9, 3, 'child minny' union all
    select 10, 10, 3, 'child micky' union all
    select 11, 11, 3, 'child goofy' union all
    select 12, 12, 3, 'child daisy' union all
    select 13, 13, 6, 'sub child popey' union all
    select 14, 14, 6, 'sub child zen' union all
    select 15, 15, 6, 'sub child shin chan' union all
    select 16, 16, 8, 'sub child doremon' union all
    select 17, 17, 8, 'sub child pikachu' union all
    select 18, 18, 8, 'sub child tweety'
),
employeetree as
(    -- anchor
    select 
        empid, 
        parentid, 
        description, 
        cast(empid as varchar(50)) as levelid
    from employee
    where parentid = 0

    union all

    -- recursive
    select
        e.empid, 
        e.parentid, 
        e.description, 
        cast(cast(t.levelid as varchar(50)) + '>' + cast(e.empid as varchar(50)) as varchar(50)) as levelid
    from employee e
    inner join employeetree t on e.parentid = t.empid
)
select *
from employeetree
order by levelid
