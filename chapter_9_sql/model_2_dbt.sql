-- Active: 1685384646340@@danny-dppr-pg.cqxcxanvhef4.us-east-1.rds.amazonaws.com@5432@airflowdb@public
SELECT
  obd.order_date,
  ot.order_count
FROM {{ref('model_1')}} obd
LEFT JOIN other_table ot
  ON ot.some_date = obd.order_date;