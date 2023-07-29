select
    test_date,
    SUM(
        CASE WHEN test_result = 'true' THEN 1 ELSE 0 END
    ) / CAST(SUM(test_count) AS DECIMAL(6, 2)) AS success_rate,
    SUM(test_count) as total_tests
FROM
    validator_summary_daily
GROUP BY
    test_date
ORDER BY
    test_date;