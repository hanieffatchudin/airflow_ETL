from airflow import DAG
from airflow.operators.python import PythonOperator, BranchPythonOperator
from datetime import datetime, timedelta
from airflow.operators.dummy_operator import DummyOperator
from airflow.operators.bash import BashOperator
from airflow.providers.postgres.operators.postgres import PostgresOperator

default_args = {
    'owner':'airflow',
    'depands_on_past':False,
    'start_date': datetime(2021, 12, 18),
    'retries': 0
}

with DAG(
    dag_id='dag_final_project_de',
    schedule_interval=None,
    start_date=datetime(2021, 12, 13),
    catchup=False,
    tags=['de'],
) as dag:

    run_dim_case = PostgresOperator(
        task_id="run_dim_case",
        postgres_conn_id='connection_postgres',
        sql='sql/coba.sql'
        # params={'begin_date': '2020-01-01', 'end_date': '2020-12-31'},
    )

    start = DummyOperator(
        task_id='start'
    )

    end = DummyOperator(
        task_id='end'
    )

    start >> run_dim_case >> end

