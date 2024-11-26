with countries as (
    select 'Sri Lanka' as title  union
    select 'Australia' union
    select 'India' union
    select 'Pakistan'
)
select 
    c1.title as title1, 
    c2.title as title2 
from countries c1 
join countries c2 
on 
    (c1.title = 'India' and c2.title in ('Sri Lanka', 'Australia', 'Pakistan')) or
    (c1.title = 'Sri Lanka' and c2.title in ('Australia', 'Pakistan')) or
    (c1.title = 'Australia' and c2.title = 'Pakistan')
order by 
    case 
        when c1.title = 'India' then 1
        when c1.title = 'Sri Lanka' then 2
        when c1.title = 'Australia' then 3
    end,
    case 
        when c1.title = 'India' and c2.title = 'Sri Lanka' then 1
        when c1.title = 'India' and c2.title = 'Australia' then 2
        when c1.title = 'India' and c2.title = 'Pakistan' then 3
        when c1.title = 'Sri Lanka' and c2.title = 'Australia' then 4
        when c1.title = 'Sri Lanka' and c2.title = 'Pakistan' then 5
        when c1.title = 'Australia' and c2.title = 'Pakistan' then 6
    end;
/*
joining these tables produces the said output
i observed however that for me to get it sorted
as exactly as i have it in the question, I had
to implement case conditions for the order clause
*/