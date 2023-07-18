-- Active: 1685384646340@@danny-dppr-pg.cqxcxanvhef4.us-east-1.rds.amazonaws.com@5432@airflowdb@public
CREATE TABLE dag_run_history (
  id int,
  dag_id varchar(250),
  execution_date timestamp with time zone,
  state varchar(250),
  run_id varchar(250),
  external_trigger boolean,
  end_date timestamp with time zone,
  start_date timestamp with time zone
);
