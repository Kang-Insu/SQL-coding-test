with a as (
    select id, ifnull(length, 10) as length
    from fish_info
    )

select count(a.id) fish_count, max(a.length) max_length, fi.fish_type
from a
    left join fish_info fi on a.id = fi.id
group by 3
having avg(a.length) >= 33
order by 3;