with student_scores as ( 
    select 'Jyoti' as studentname, 'Maths' as subjectname, 90 as marks union all 
    select 'Hritik', 'Maths', 85 union all 
    select 'Arun', 'Maths', 90 union all 
    select 'Jyoti', 'English', 70 union all 
    select 'Arun', 'English', 85 union all 
    select 'Jyoti', 'Science', 70
), students as (
    select
        distinct studentname 
    from student_scores 
), subjects as (
    select 
        distinct subjectname
    from student_scores
), student_subjects as (
    select 
        studentname, subjectname
    from students
    cross apply subjects 
)
select 
    profiles.studentname,
    profiles.subjectname,
    scores.marks
from student_subjects profiles
left join student_scores scores
on profiles.studentname = scores.studentname
and profiles.subjectname = scores.subjectname
order by profiles.studentname