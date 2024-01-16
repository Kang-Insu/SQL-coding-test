-- 코드를 입력하세요
WITH temp01 AS (
SELECT member_id, count(member_id) as cnt
FROM rest_review
GROUP BY member_id
HAVING cnt = (SELECT count(member_id) as cnt
             FROM rest_review
             GROUP BY member_id
             ORDER BY cnt desc
             LIMIT 1)
)

SELECT member_name, review_text, date_format(review_date, '%Y-%m-%d') as review_date
FROM member_profile as mp
    JOIN rest_review as rr ON mp.member_id = rr.member_id
    JOIN temp01 ON mp.member_id = temp01.member_id
ORDER BY review_date, review_text;