# 판매날짜, 상품id, 유저id, 판매량
(SELECT date_format(sales_date, '%Y-%m-%d') as sales_date, product_id, user_id, sales_amount
FROM online_sale
WHERE date_format(sales_date, '%Y-%m') = '2022-03')
UNION ALL
(SELECT date_format(sales_date, '%Y-%m-%d') as sales_date, product_id, null as user_id, sales_amount
 FROM offline_sale
 WHERE date_format(sales_date, '%Y-%m') = '2022-03')
ORDER BY sales_date, product_id, user_id;