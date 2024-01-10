-- 코드를 입력하세요
SELECT product_code, SUM(price*sales_amount) as sales
FROM product p
    JOIN offline_sale os ON p.product_id = os.product_id
GROUP BY 1
ORDER BY 2 desc, 1;