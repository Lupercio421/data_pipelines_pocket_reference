-- Active: 1685384646340@@danny-dppr-pg.cqxcxanvhef4.us-east-1.rds.amazonaws.com@5432@airflowdb@public
CREATE TABLE IF NOT EXISTS orders_by_day AS
SELECT 
    CAST(OrderDate as DATE) as order_date
    COUNT(*) AS order_count
FROM orders
GROUP BY CAST(orderdate as DATE);
