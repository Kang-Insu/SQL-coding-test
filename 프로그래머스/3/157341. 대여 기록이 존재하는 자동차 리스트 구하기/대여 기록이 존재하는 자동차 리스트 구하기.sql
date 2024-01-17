-- 코드를 입력하세요
SELECT distinct c.car_id
FROM car_rental_company_car c
    JOIN car_rental_company_rental_history h ON c.car_id = h.car_id
WHERE c.car_type = '세단' AND month(start_date) = 10
ORDER BY 1 desc;