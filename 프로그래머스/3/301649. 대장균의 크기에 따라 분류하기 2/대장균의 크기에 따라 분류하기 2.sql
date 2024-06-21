with a as (
    select id, percent_rank() over (order by size_of_colony) as size_rank
from ecoli_data
)

select ed.id,
    case when size_rank >= 0.75 then 'CRITICAL'
    when size_rank >= 0.5 and size_rank < 0.75 then 'HIGH'
    when size_rank >= 0.25 and size_rank < 0.5 then 'MEDIUM'
    when size_rank >= 0 and size_rank < 0.25 then 'LOW'
    end as colony_name
from ecoli_data ed
    join a on ed.id = a.id
order by ed.id;