-- 코드를 입력하세요
SELECT LEFT(product_code, 2) as category, COUNT(product_id) as products 
FROM product
GROUP BY 1
ORDER BY 1;