select 
    case when month(differentiation_date) >= 1 and month(differentiation_date) < 4 then '1Q'
    when month(differentiation_date) >= 4 and month(differentiation_date) < 7 then '2Q'
    when month(differentiation_date) >= 7 and month(differentiation_date) < 10 then '3Q'
    else '4Q' end as QUARTER, 
    count(id) as ecoli_count
from ecoli_data
group by 1
order by 1;