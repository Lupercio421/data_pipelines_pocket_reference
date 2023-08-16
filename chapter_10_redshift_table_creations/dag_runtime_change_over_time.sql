select
    dag_id,
    execution_date,
    sum(runtime_seconds) / SUM(CAST(dag_run_count as DECIMAL(6, 2))) as avg_runtime
from
    dag_history_daily
where
    dag_id = 'elt_pipeline_sample'
GROUP BY
    dag_id,
    execution_date;