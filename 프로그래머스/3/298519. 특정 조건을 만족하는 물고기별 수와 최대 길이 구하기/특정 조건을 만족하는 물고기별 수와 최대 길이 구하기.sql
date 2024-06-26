select count(id) fish_count, max(length) max_length, fish_type
from fish_info
group by 3
having avg(ifnull(length,10)) >= 33
order by 3;