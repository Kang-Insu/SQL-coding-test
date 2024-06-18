select id, ifnull(child_count,0) child_count
from ecoli_data ed
    left join (select parent_id, count(parent_id) as child_count
            from ecoli_data
            group by parent_id) a on ed.id = a.parent_id
;
