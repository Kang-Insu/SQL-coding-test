-- 코드를 입력하세요
WITH RECURSIVE cts AS(
    SELECT 0 AS n
    UNION ALL
    SELECT n + 1
    FROM cts
    WHERE n < 23)
    
SELECT cts.n AS hour, COUNT(animal_id) AS count
FROM cts
    LEFT JOIN animal_outs a ON cts.n = hour(a.datetime)
GROUP BY cts.n;