-- Active: 1685384646340@@danny-dppr-pg.cqxcxanvhef4.us-east-1.rds.amazonaws.com@5432@airflowdb@public
WITH daily_revenue_zscore AS (
    SELECT
    order_date, 
    total_revenue,
    (total_revenue - avg(total_revenue) over ()) / (stddev(total_revenue) over ()) as z_score
    FROM revenue_by_day
)
SELECT ABS(z_score) AS twosided_score
FROM daily_revenue_zscore
WHERE
order_date = CAST('2020-10-05' as DATE) - INTERVAL '1 day';