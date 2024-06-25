# with a as (
#     select fish_type, count(id) as fish_count
#     from fish_info
#     group by 1)

# select fish_count, fish_name
# from a
#     join fish_name_info fni on a.fish_type = fni.fish_type
# order by 1 desc;

select count(id) as fish_count, fish_name
from fish_info fi
    join fish_name_info fni on fi.fish_type = fni.fish_type
group by 2
order by 1 desc;

