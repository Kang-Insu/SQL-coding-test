-- 코드를 입력하세요
SELECT ugu.user_id, ugu.nickname, price
FROM (SELECT writer_id, sum(price) as price
      FROM used_goods_board
      WHERE status = 'done'
      GROUP BY writer_id
      HAVING price >= 700000) as ugb
    JOIN used_goods_user as ugu ON ugb.writer_id = ugu.user_id
ORDER BY price;