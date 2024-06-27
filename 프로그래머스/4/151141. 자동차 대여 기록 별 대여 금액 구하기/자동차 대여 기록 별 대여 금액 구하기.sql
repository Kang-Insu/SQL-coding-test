# with a as (
# select plan_id, car_type, substring_index(duration_type,'일',1) as duration_type, substring_index(discount_rate,'%',1) / 100 as discount_rate
# from car_rental_company_discount_plan
# )
# select case when datediff(end_date - start_date)+1 >= 7 and datediff(end_date - start_date)+1 < 30 then 5
# from car_rental_company_rental_history;

with a as (
    select h.history_id, c.car_id, c.daily_fee, c.car_type, 
        case when datediff(end_date, start_date)+1 >= 90 then '90일 이상'
        when datediff(end_date, start_date)+1 >= 30 then '30일 이상'
        when datediff(end_date, start_date)+1 >= 7 then '7일 이상'
        else '7일 미만' end as date_diff
    from car_rental_company_rental_history h
        join car_rental_company_car c on h.car_id = c.car_id
)
        
select a.history_id, round((datediff(end_date,start_date) + 1) * (1 - (ifnull(discount_rate,0) / 100)) * a.daily_fee, 0) as fee
from a
    left join car_rental_company_discount_plan p on a.car_type = p.car_type and a.date_diff = p.duration_type
    join car_rental_company_rental_history h on a.history_id = h.history_id
where a.car_type = '트럭'
group by history_id
order by 2 desc, 1 desc;