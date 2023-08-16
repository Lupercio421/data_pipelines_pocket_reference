-- Active: 1685384646340@@danny-dppr-pg.cqxcxanvhef4.us-east-1.rds.amazonaws.com@5432@airflowdb@public
WITH revenue_by_day AS(
    SELECT
        CAST(OrderDate AS DATE) AS order_date,
        SUM(ordertotal) as total_revenue
    FROM
        orders
    GROUP BY
        CAST(orderdate as DATE)
),
daily_revenue_zscore AS(
    SELECT
        order_date,
        total_revenue,
        (total_revenue - avg(total_revenue) over ()) / (stddev(total_revenue) over ()) as z_score
    FROM
        revenue_by_day
)
SELECT
    ABS(z_score) as twosided_score
FROM
    daily_revenue_zscore
WHERE
    order_date = CAST(current_timestamp as DATE) - INTERVAL '1 day';