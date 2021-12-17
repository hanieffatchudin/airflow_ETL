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
    dag_id='dag_final_project',
    schedule_interval=None,
    start_date=datetime(2021, 12, 13),
    catchup=False,
    tags=['de'],
) as dag:

    start = DummyOperator(
        task_id='start'
    )

    data_covid = PostgresOperator(
        task_id="data_covid",
        postgres_conn_id='connection_postgres',
        sql='sql/data_covid.sql'
        # params={'begin_date': '2020-01-01', 'end_date': '2020-12-31'},
    )


    dims_province = PostgresOperator(
        task_id="dims_province",
        postgres_conn_id='connection_postgres',
        sql='sql/dims_province.sql'
        # params={'begin_date': '2020-01-01', 'end_date': '2020-12-31'},
    )


    dims_case= PostgresOperator(
        task_id="dims_case",
        postgres_conn_id='connection_postgres',
        sql='sql/dims_case.sql'
        # params={'begin_date': '2020-01-01', 'end_date': '2020-12-31'},
    )

    dims_district = PostgresOperator(
        task_id="dims_district",
        postgres_conn_id='connection_postgres',
        sql='sql/dims_district.sql'
        # params={'begin_date': '2020-01-01', 'end_date': '2020-12-31'},
    )


    temporary = DummyOperator(
        task_id='temporary'
    )

    province_daily = PostgresOperator(
        task_id="province_daily",
        postgres_conn_id='connection_postgres',
        sql='sql/province_daily.sql'
        # params={'begin_date': '2020-01-01', 'end_date': '2020-12-31'},
    )

    province_monthly = PostgresOperator(
        task_id="province_monthly",
        postgres_conn_id='connection_postgres',
        sql='sql/province_monthly.sql'
        # params={'begin_date': '2020-01-01', 'end_date': '2020-12-31'},
    )


    province_yearly = PostgresOperator(
        task_id="province_yearly",
        postgres_conn_id='connection_postgres',
        sql='sql/province_yearly.sql'
        # params={'begin_date': '2020-01-01', 'end_date': '2020-12-31'},
    )

    district_monthly = PostgresOperator(
        task_id="district_monthly",
        postgres_conn_id='connection_postgres',
        sql='sql/district_monthly.sql'
        # params={'begin_date': '2020-01-01', 'end_date': '2020-12-31'},
    )

    district_yearly= PostgresOperator(
        task_id="district_yearly",
        postgres_conn_id='connection_postgres',
        sql='sql/district_yearly.sql'
        # params={'begin_date': '2020-01-01', 'end_date': '2020-12-31'},
    )

    end = DummyOperator(
        task_id='end'
    )

start >> data_covid >> [dims_province, dims_district, dims_case]>> temporary>>[province_daily,district_monthly]
province_daily>> province_monthly >> province_yearly
district_monthly>>district_yearly
[province_yearly,district_yearly]>>end
