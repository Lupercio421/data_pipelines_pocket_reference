SELECT
    test_composite_name,
    SUM(
        CASE WHEN test_result = 'true' THEN 1 ELSE 0 END
    ) / CAST(SUM(test_count) AS DECIMAL(6, 2)) AS success_rate
FROM
    "dev"."public"."validator_summary_daily"
GROUP BY
    test_composite_name;