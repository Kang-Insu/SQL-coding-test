-- 코드를 입력하세요
SELECT order_id, product_id, date_format(out_date,'%Y-%m-%d'), 
    CASE WHEN date_format(out_date,'%m-%d') <= '05-01' THEN '출고완료'
    WHEN date_format(out_date,'%m-%d') > '05-01' THEN '출고대기'
    ELSE '출고미정' END '출고여부'
FROM food_order
ORDER BY 1;