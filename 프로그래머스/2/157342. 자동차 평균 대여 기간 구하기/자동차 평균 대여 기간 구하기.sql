-- 코드를 입력하세요
SELECT car_id, ROUND(AVG(datediff(end_date,start_date)+1),1)
FROM car_rental_company_rental_history
GROUP BY car_id
HAVING AVG(datediff(end_date, start_date)+1) >= 7
ORDER BY 2 desc, 1 desc;