from datetime import timedelta
from airflow import DAG
from airflow.operators.bash import BashOperator
from airflow.operators.postgres_operator import PostgresOperator
from airflow.utils.dates import days_ago


dag = DAG(
    'elt_pipeline_sample',
    description='A sample ELT pipeline',
    schedule_interval = timedelta(days=1),
    start_date = days_ago(1)
)

extract_orders_task = BashOperator(
    task_id = 'extract_order_data',
    bash_command = 'python /p/extract_orders.py',
    start_date = days_ago(1),
    dag = dag
)

extract_customers_task = BashOperator(
    task_id = 'extract_customer_data',
    bash_command = 'python /p/extract_customers.py',
    dag = dag
)

load_orders_task = BashOperator(
    task_id = 'load_order_data',
    bash_command = 'python /p/load_orders.py',
    dag = dag
)

load_customers_task = BashOperator(
    task_id = 'load_customer_data',
    bash_command = 'python /p/load_customers.py',
    dag = dag
)

check_order_rowcount_task = BashOperator(
    task_id='check_order_rowcount',
    bash_command='set -e; python validator.py order_count.sql order_full_count.sql equals',
    dag=dag,
)

revenue_model_task = PostgresOperator(
    task_id = 'build_data_model',
    postgres_conn_id = 'redshift_dw',
    sql = '/sql/order_revenue/model.sql',
    dag = dag
)

extract_orders_task >> load_orders_task
extract_customers_task >> load_customers_task
load_orders_task >> check_order_rowcount_task
check_order_rowcount_task >> revenue_model_task
load_customers_task >> revenue_model_task