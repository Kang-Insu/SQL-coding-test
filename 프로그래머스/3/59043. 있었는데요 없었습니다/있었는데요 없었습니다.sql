-- 코드를 입력하세요
SELECT ai.animal_id, ai.name
FROM animal_ins ai
    JOIN animal_outs ao ON ai.animal_id = ao.animal_id
WHERE ai.datetime >= ao.datetime
ORDER BY ai.datetime;