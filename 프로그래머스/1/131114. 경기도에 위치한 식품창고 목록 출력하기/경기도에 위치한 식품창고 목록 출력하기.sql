-- 코드를 입력하세요
SELECT warehouse_id, warehouse_name, address, ifnull(freezer_yn,'N') as FREEZER_YN
FROM food_warehouse
WHERE address like '경기도%';