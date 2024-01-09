-- 코드를 입력하세요
SELECT a.category, a.price, a.product_name
FROM food_product as a
    JOIN (SELECT category, max(price) as max_price
         FROM food_product
         WHERE category IN ('과자','국','김치','식용유')
         GROUP BY category) as b ON a.category = b.category AND a.price = b.max_price
GROUP BY category
ORDER BY max_price desc;