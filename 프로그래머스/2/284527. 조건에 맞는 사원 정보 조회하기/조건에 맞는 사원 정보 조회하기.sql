with a as (
    select sum(score) as score, emp_no
    from hr_grade
    group by emp_no)
    
select a.score, he.emp_no, he.emp_name, he.position, he.email
from hr_employees he
    join a on he.emp_no = a.emp_no
where a.score in (select max(score)
                 from a);