with a as (
    select emp_no, avg(score) as score
    from hr_grade
    group by emp_no)

select he.emp_no, he.emp_name, 
    case when score >= 96 then 'S'
    when score >= 90 then 'A'
    when score >= 80 then 'B'
    else 'C' end as grade,
    case when score >= 96 then sal * 0.2
    when score >= 90 then sal * 0.15
    when score >= 80 then sal * 0.1
    else 0 end bonus
from hr_employees he
    join a on he.emp_no = a.emp_no
order by 1;
