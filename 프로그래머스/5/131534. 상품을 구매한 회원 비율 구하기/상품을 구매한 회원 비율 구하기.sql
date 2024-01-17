-- 코드를 입력하세요
# WITH ui_os_join AS (
# SELECT year(sales_date) as year, month(sales_date) as month, COUNT(distinct os.user_id) as purchased_users,
# FROM user_info ui
#     JOIN online_sale os ON ui.user_id = os.user_id
# WHERE year(joined) = 2021
# GROUP BY year(sales_date), month(sales_date))

# SELECT year, month, purchased_users, ROUND(purchased_users / COUNT(distinct user_id), 1)
# FROM ui_os_join, user_info
# ORDER BY year, month;

# WITH temp_01 AS (
# SELECT user_id, joined
# FROM user_info
# WHERE year(joined) = 2021)

# SELECT year(sales_date) as year, month(sales_date) month, COUNT(distinct os.user_id) as purchased_users, ROUND(COUNT(distinct os.user_id) / sum(temp_01.cnt_user), 1)
# FROM temp_01
#     LEFT JOIN online_sale os ON os.user_id = temp_01.user_id
# GROUP BY 1, 2
# ORDER BY 1, 2;

# 21년 가입한 전체 회원 수는 user_Info에서만 구할 수 있다
# 조인할 경우 inner 조인이 되서 값을 구할 수 없다
# user_info테이블에서 count할 경우 값은 나오지만 user_id가 1개만 나와서 조인 할 수 없다
# user_info 데이터를 그대로 가져오면서 count user_info할 수 있는 방법은 뭘까

SELECT year(sales_date) as year, month(sales_date) as month, COUNT(distinct os.user_id) as purchased_users, ROUND(COUNT(distinct os.user_id) / (SELECT COUNT(user_id) FROM user_info WHERE year(joined) = 2021), 1)
FROM user_info ui
    JOIN online_sale os ON ui.user_id = os.user_id
WHERE year(joined) = 2021
GROUP BY 1, 2
ORDER BY 1, 2;