-- 코드를 입력하세요
SELECT writer_id, nickname, concat_WS(' ',city, street_address1, street_address2) as '전체주소', CONCAT_WS('-', LEFT(tlno, 3), SUBSTRING(tlno,4,4), SUBSTRING(tlno,8,4)) as '전화번호'
FROM used_goods_board b
    JOIN used_goods_user u ON b.writer_id = u.user_id
GROUP BY writer_id
HAVING COUNT(writer_id) >= 3
ORDER BY writer_id desc;
