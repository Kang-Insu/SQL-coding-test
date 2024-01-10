-- 코드를 입력하세요
SELECT ai.name, ai.datetime
FROM animal_ins ai
    LEFT JOIN animal_outs ao ON ai.animal_id = ao.animal_id
WHERE ao.datetime is null AND (SELECT COUNT(ai.animal_id)
                               FROM animal_ins ai
                                LEFT JOIN animal_outs ao ON ai.animal_id = ao.animal_id
                                WHERE ao.datetime is null
                               ) >= 3
ORDER BY ai.datetime
limit 3;