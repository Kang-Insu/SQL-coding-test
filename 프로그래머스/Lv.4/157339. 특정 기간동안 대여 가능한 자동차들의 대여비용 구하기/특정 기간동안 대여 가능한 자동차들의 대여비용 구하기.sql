-- 코드를 입력하세요
# SELECT car_id, car_type, fee
# FROM car_rental_company_car c
#     JOIN car_rental_company_rental_history h ON c.car_id = h.car_id
#     JOIN car_rental_company_discount_plan p ON c.car_type = p.car_type
# WHERE c.car_type IN ('SUV','세단') AND start_date <= '2022-11-01' AND end_date >= '2022-11-30' AND

SELECT cc.car_id, cc.car_type,
    ROUND(cc.daily_fee * 30 / 100 * (100 - (SELECT discount_rate
                                          FROM car_rental_company_discount_plan
                                          WHERE car_type = cc.car_type AND duration_type = '30일 이상'))) as fee
FROM car_rental_company_car cc
    JOIN car_rental_company_rental_history ch ON cc.car_id = ch.car_id
WHERE cc.car_type IN ('SUV','세단') AND
    (cc.car_id not in (SELECT car_id
                     FROM car_rental_company_rental_history
                     WHERE start_date <= '2022-11-01' AND end_date >= '2022-11-01'))
GROUP BY cc.car_id
HAVING fee >= 500000 AND fee <= 2000000
ORDER BY fee desc, car_type, car_id desc;