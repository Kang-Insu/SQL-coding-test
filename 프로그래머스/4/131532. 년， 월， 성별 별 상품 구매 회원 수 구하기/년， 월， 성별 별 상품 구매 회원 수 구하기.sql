-- 코드를 입력하세요
SELECT year(sales_date) as year, month(sales_date) as month, gender, COUNT(distinct ui.user_id) as users
FROM user_info ui
    JOIN online_sale os ON ui.user_id = os.user_id
WHERE NOT gender is null
GROUP BY year, month, gender
ORDER BY 1,2,3;