-- Active: 1685384646340@@danny-dppr-pg.cqxcxanvhef4.us-east-1.rds.amazonaws.com@5432@airflowdb@public
select
    obd.order_date,
    ot.order_count
FROM
    orders_by_day as obd
LEFT JOIN other_table ot 
    on ot.som_date = obd.order_date;