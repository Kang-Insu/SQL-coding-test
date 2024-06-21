with recursive generation as (
    select id, parent_id, 1 as gen
    from ecoli_data
    where parent_id is null
    
    union all
    
    select ed.id, ed.parent_id, g.gen + 1 as gen
    from ecoli_data ed
        join generation g on ed.parent_id = g.id
)

# select count(id) as count, gen as generation
# from generation
# group by 2
# order by 2;

select count(g.id) count, gen as generation
from generation g
    left join ecoli_data ed on g.id = ed.parent_id
where ed.parent_id is null
group by 2
order by 2;