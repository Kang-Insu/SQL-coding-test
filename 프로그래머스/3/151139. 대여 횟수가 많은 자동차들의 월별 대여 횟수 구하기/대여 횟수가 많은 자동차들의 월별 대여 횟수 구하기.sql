-- 코드를 입력하세요
SELECT month(start_date) as month, car_id, COUNT(history_id) as records
FROM car_rental_company_rental_history
WHERE car_id IN (SELECT car_id
                FROM car_rental_company_rental_history
                WHERE date_format(start_date, '%Y-%m') between '2022-08' AND '2022-10'
                GROUP BY car_id
                HAVING COUNT(history_id) >= 5)
            AND date_format(start_date, '%Y-%m') BETWEEN '2022-08' AND '2022-10'
GROUP BY month, car_id
HAVING COUNT(history_id) >= 1
ORDER BY month, car_id desc;