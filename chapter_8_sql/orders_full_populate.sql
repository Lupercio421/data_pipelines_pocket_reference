-- Active: 1685384646340@@danny-dppr-pg.cqxcxanvhef4.us-east-1.rds.amazonaws.com@5432@airflowdb@public
CREATE TABLE Orders_Full (
  OrderId int,
  OrderStatus varchar(30),
  OrderDate timestamp,
  CustomerId int,
  OrderTotal numeric
);

INSERT INTO Orders_Full VALUES(1,'Shipped','2020-06-09',100,50.05);
INSERT INTO Orders_Full VALUES(2,'Shipped','2020-07-11',101,57.45);
INSERT INTO Orders_Full VALUES(3,'Shipped','2020-07-12',102,135.99);
INSERT INTO Orders_Full VALUES(4,'Shipped','2020-07-12',100,43.00);