-- 코드를 입력하세요
SELECT b.category, sum(sales) as sales
FROM book as b
    JOIN book_sales as bs ON b.book_id = bs.book_id
WHERE date_format(bs.sales_date, '%Y-%m') = '2022-01'
GROUP BY b.category
ORDER BY b.category;