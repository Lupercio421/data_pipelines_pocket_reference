from datetime import timedelta
from airflow import DAG
from airflow.operators.bash import BashOperator
from airflow.providers.postgres.operators.postgres import PostgresOperator
from airflow.utils.dates import days_ago

dag = DAG(
    'pipeline_performance',
    description='Performance measurement pipeline',
    schedule=timedelta(days=1),
    start_date = days_ago(1),
    template_searchpath = ['/mnt/c/Users/Daniel/Desktop/data_pipelines_pocket_reference/']
)

extract_airflow_task = BashOperator(
    task_id='extract_airflow',
    bash_command='python /p/airflow_extract.py',
    dag=dag,
)

load_airlflow_task = BashOperator(
    task_id='load_airflow',
    bash_command='python /p/airflow_load.py',
    dag=dag,
)

dag_history_model_task = PostgresOperator(
    task_id='dag_history_model',
    postgres_conn_id='ddpr-redshift-cluster1',
    sql='/sql/dag_history_daily.sql',
    dag=dag,
)

validation_history_model_task = PostgresOperator(
    task_id='validation_history_model',
    postgres_conn_id='ddpr-redshift-cluster1',
    sql='/sql/chapter_10_redshift_table_creations/validator_summary_daily.sql',
    dag=dag,
)

extract_airflow_task >> load_airlflow_task
load_airlflow_task >> dag_history_model_task
load_airlflow_task >> validation_history_model_task