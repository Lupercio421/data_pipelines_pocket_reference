-- Active: 1685384646340@@danny-dppr-pg.cqxcxanvhef4.us-east-1.rds.amazonaws.com@5432@airflowdb@public
-- WITH orders_by_day AS (
--     SELECT
--     CAST(OrderDate as DATE) as order_date,
--     count(*) as order_count
--     FROM orders
--     GROUP BY CAST(OrderDate AS DATE)
-- ),
-- order_count_zscore AS(
--     SELECT 
--     order_date, 
--     order_count,
--     (order_count - avg(order_count) over ()) / (stddev(order_count) over ()) as z_score 
--     FROM orders_by_day
-- )
-- SELECT ABS(z_score) as twosided_score
-- FROM order_count_zscore
-- WHERE
--     order_date = 
--     CAST(current_timestamp as DATE) - INTERVAL '1 day';

WITH orders_by_day AS (
  SELECT
    CAST(OrderDate AS DATE) AS order_date,
    COUNT(*) AS order_count
  FROM Orders
  GROUP BY CAST(OrderDate AS DATE)
),
order_count_zscore AS (
  SELECT
    order_date,
    order_count,
    (order_count - avg(order_count) over ())
     / (stddev(order_count) over ()) as z_score
  FROM orders_by_day
)
SELECT ABS(z_score) AS twosided_score
FROM order_count_zscore
WHERE
  order_date =
    CAST(current_timestamp AS DATE)
    - interval '1 day';