with a as (
    select hd.dept_id, round(avg(sal), 0) as avg_sal
    from hr_department hd
        join hr_employees he on hd.dept_id = he.dept_id
    group by 1)

select hd.dept_id, dept_name_en, avg_sal
from hr_department hd
    join a on hd.dept_id = a.dept_id
order by 3 desc;