-- 코드를 입력하세요
SELECT flavor
FROM (SELECT *
      FROM first_half
      UNION ALL
      SELECT *
      FROM july) temp
GROUP BY flavor
ORDER BY SUM(total_order) desc
limit 3;
