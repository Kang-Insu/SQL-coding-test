-- 코드를 입력하세요
# 1. 생산일자가 2022년5월인 식품 구하기
# 2. 총매출은 price*amount을 더한것
SELECT fp.product_id, fp.product_name, SUM(price * amount) as total_price
FROM food_product as fp
    JOIN food_order as fo ON fp.product_id = fo.product_id
WHERE date_format(produce_date, '%Y-%m') = '2022-05' 
GROUP BY product_name
ORDER BY 3 desc, 1;