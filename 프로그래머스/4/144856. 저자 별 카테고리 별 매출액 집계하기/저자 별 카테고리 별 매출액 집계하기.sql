-- 코드를 입력하세요
SELECT a.author_id, max(author_name) as author_name, category, sum(sales * price) as total_sales
FROM book b
    JOIN author a ON b.author_id = a.author_id
    JOIN (SELECT book_id, sales
          FROM book_sales
          WHERE date_format(sales_date, '%Y-%m') = '2022-01') as bs ON b.book_id = bs.book_id
GROUP BY author_id, category
ORDER BY 1, 3 desc;