# import libraries
from datetime import timedelta
from airflow import DAG
from airflow.operators.bash_operator import BashOperator
from airflow.utils.dates import days_ago

# DAG arguments
default_args = {
	'owner':'Fatih Somer',
	'start_date':days_ago(0),
	'email':['fs@email.com'],
    'email_on_failure': False,
    'email_on_retry': False,
	'retries':1,
    'retry_delay': timedelta(minutes=5),
}


# define DAG
dag = DAG(
	'process_web_log',
	default_args=default_args,
	description='Process web log DAG',
	schedule_interval=timedelta(days=1),
)


# define extract data
extract_data = BashOperator(
    task_id='extract_data',
    bash_command='sudo cut -d" " -f1 /home/project/airflow/dags/capstone/accesslog.txt \
        > /home/project/airflow/dags/capstone/extracted_data.txt',
    dag=dag,
)


# define transform data
transform_data = BashOperator(
    task_id='transform_data',
    bash_command='sudo cat /home/project/airflow/dags/capstone/extracted_data.txt | grep "198.46.149.143" \
        > /home/project/airflow/dags/capstone/transformed_data.txt',
    dag=dag,
)


# define load data
load_data = BashOperator(
    task_id='load_data',
    bash_command='sudo tar -cvf /home/project/airflow/dags/capstone/weblog.rar \
        /home/project/airflow/dags/capstone/transformed_data.txt',
    dag=dag,
)


# task pipeline
extract_data >> transform_data >> load_data
