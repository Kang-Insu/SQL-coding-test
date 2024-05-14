-- 코드를 작성해주세요
select it.item_id, ii.item_name, ii.rarity
from item_info ii
    join item_tree it on ii.item_id = it.item_id
where it.parent_item_id in (select ii.item_id
                    from item_info as ii
                    where rarity = 'rare')
order by 1 desc;