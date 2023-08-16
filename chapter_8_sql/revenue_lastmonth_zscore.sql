-- Active: 1685384646340@@danny-dppr-pg.cqxcxanvhef4.us-east-1.rds.amazonaws.com@5432@airflowdb@public
-- This is a validation you might run on Oct 1 to check to make sure that revenue from Sept. is within your expected range on past histroy
WITH revenue_by_day AS (
  SELECT
    date_part('month', orderdate) AS order_month,
    SUM(ordertotal) AS total_revenue
  FROM Orders
  WHERE
    orderdate > date_trunc('month',current_timestamp - interval '12 months')
    AND
    orderdate < date_trunc('month', current_timestamp)
  GROUP BY date_part('month', orderdate)
),
daily_revenue_zscore AS (
  SELECT
    order_month,
    total_revenue,
    (total_revenue - avg(total_revenue) over ())
     / (stddev(total_revenue) over ()) as z_score
  FROM revenue_by_day
)
SELECT ABS(z_score) AS twosided_score
FROM daily_revenue_zscore
WHERE order_month = date_part('month',date_trunc('month',current_timestamp - interval '1 months'));select
    *
from
    orders;