--Q1--
create database Order_stores_data
use Order_stores_data

--Q2--
create table orders_table(OrderDate date, Region varchar(max), Rep varchar(max), Order_Item varchar(max), Units int,
Unit_Cost float, Total_Price float,	Order_Id int not null )
drop table orders_table

create table stores_table (Store_Id int, StoreType varchar(max), Assortment int, CompetitionDistance int, Month int, Year int,	
PromoInterval varchar(max))

--Q3--
insert into orders_table values ('1-6-21' , 'East', 'Aruna', 'Pencil', 95, 1.99, 189.05 ,	1),
('1-23-21',	'Central',	'Kivell', 'Eraser',	50,	 19.99, 999.50, 2),
('2-9-21',	'Central',	'Ganesh', null, 36, 4.99, 179.64, 3),
('2-26-21',	'Central', 'Payal', null,	27,	19.99, 	539.73, 4),
('3-15-21',	'West',	'Sorvino', null,	56,	2.99, 167.44, 5),
('4-1-21', 'East',	'Hitesh', 'Pencil', 60,	 4.99, 299.40, 6),
('4-18-21',	'Central',	'Akshita', null,	75,	1.99, 149.25, 7),
('5-5-21',	'Central', 'Ruchika', 'Books',	90,	 4.99,  449.10, 8),
('5-22-21',	'West',	'Surbhi', null,	32, 1.99, 63.68, 9),
('6-8-21',	'East',	'Jones',	'Suitcase',	60,	8.99, 539.40, 10
)
select * from orders_table

insert into stores_table values ( 1, 'c', 13, 1270,	9,	2008, 'Jan'),
( 2, 'a', 21, 570,	11,	2007, 'Feb'),
(3	,'a', 45, 14130, 12, 2006,	'Mar'),
(4,	'c'	,39, 620, 9, 2009, null	),
(5,	'a', 38, 29910,	4,	2015,	'May'),
(6,	'a'	,40, 310, 12, 2013,	'June'),
(7, 'a'	,39, 24000,	4, 2013, null),	
(8,	'a', 12, 7520,	10,	2014, 'Aug'),
(9,	'a', 37, 2030,	8,	2000, null),	
(10, 'a', 13, 3160,	9,	2009, 'Oct')
select * from stores_table

--Q3--
alter table orders_table add primary key (order_id)

--Q4--
alter table stores_table add  store_name varchar(max)
update stores_table set store_name = 'Car' where Store_Id= 1
update stores_table set store_name = 'Bikes' where Store_Id= 2
update stores_table set store_name = 'Hardware' where Store_Id= 3
update stores_table set store_name = 'Electrics' where Store_Id= 4
update stores_table set store_name = 'Fibers' where Store_Id= 5
update stores_table set store_name = 'Elastics' where Store_Id= 6
update stores_table set store_name = 'Books' where Store_Id= 7
update stores_table set store_name = 'Shoes' where Store_Id= 8
update stores_table set store_name = 'Clothes' where Store_Id= 9
update stores_table set store_name = 'Scraps' where Store_Id= 10

--Q5--
alter table stores_table add foreign key(store_id) references orders_table(order_id)

--Q6--
update orders_table set order_item = 'Compass' where order_Id= 3
update orders_table set order_item = 'Torch' where order_Id= 4
update orders_table set order_item = 'Phone' where order_Id= 5
update orders_table set order_item = 'Laptop' where order_Id= 7
update orders_table set order_item = 'Box' where order_Id= 9

--Q7--
update stores_table set PromoInterval = 'April' where Store_Id= 4
update stores_table set PromoInterval = 'July' where Store_Id= 7
update stores_table set PromoInterval = 'September' where Store_Id= 9

--Q8--
sp_rename 'stores_table.Assortment ', Store_Nos

---Q9--
sp_rename 'orders_table.Order_Item', item_name 
sp_rename 'orders_table.rep', Customers_name

--Q10--
SELECT * FROM ORDERS_TABLE
ORDER BY UNIT_COST DESC

SELECT * FROM ORDERS_TABLE
ORDER BY TOTAL_PRICE ASC

--Q11-
sp_rename 'orders_table.Customers_name', Cus_name

SELECT * FROM ORDERS_TABLE 
ORDER BY REGION 

SELECT COUNT(CUS_NAME) 'CUSTOMERS IN CENTRAL REGION' FROM ORDERS_TABLE WHERE REGION = 'CENTRAL'  
SELECT COUNT(CUS_NAME) 'CUSTOMERS IN EAST REGION' FROM ORDERS_TABLE WHERE REGION = 'EAST' 
SELECT COUNT(CUS_NAME) 'CUSTOMERS IN WEST REGION' FROM ORDERS_TABLE WHERE REGION = 'WEST'

--Q12--
SELECT SUM (TOTAL_PRICE) 'TOTAL PRICE' , SUM (UNIT_COST) 'TOTAL COST OF UNIT' FROM ORDERS_TABLE

--Q13--
CREAte view Order_Stores_Table
as 

select ot.OrderDate  , ot.Unit_Cost  , st.StoreType , st.Year from orders_table ot
cross join stores_table st

select * from Order_Stores_Table


--Q14--
SELECT ITEM_NAME , REGION FROM ORDERS_TABLE WHERE ORDER_ID IN(4,5,6,9)

--Q15--
SELECT YEAR, CompetitionDistance FROM STORES_TABLE WHERE CompetitionDistance IN ( 29910  , 310 , 3160)

--Q16--
SELECT ITEM_NAME , TOTAL_PRICE FROM ORDERS_TABLE WHERE TOTAL_PRICE>=200 AND TOTAL_PRICE<= 400

--Q17--
SP_RENAME 'STORES_TABLE.CompetitionDistance' , CD

SELECT SUM(CD) 'TOTAL CD' FROM stores_table

--Q18--
SELECT COUNT(STORETYPE) FROM stores_table
SELECT COUNT(CD) FROM stores_table

--Q19--
SELECT * FROM ORDERS_TABLE 
CROSS JOIN STORES_TABLE

--Q20--
DROP DATABASE Order_stores_data














