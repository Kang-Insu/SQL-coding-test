-- 코드를 입력하세요
SELECT animal_id, name
FROM animal_ins
WHERE animal_type = 'dog' AND name like '%el%'
ORDER BY 2;