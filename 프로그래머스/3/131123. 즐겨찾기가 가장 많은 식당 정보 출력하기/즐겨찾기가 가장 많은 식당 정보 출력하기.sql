-- 코드를 입력하세요
SELECT a.food_type, rest_id, rest_name, a.favorites
FROM rest_info a 
    join (SELECT food_type, max(favorites) as favorites
         FROM rest_info
         GROUP BY food_type) as b
    on a.food_type = b.food_type and a.favorites = b.favorites
ORDER BY food_type desc;