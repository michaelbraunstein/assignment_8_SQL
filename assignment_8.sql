/*
Michael Braunstein
CISS-250-300
Thompson
Assignment 8
October 23, 2018
*/

DROP TABLE customers CASCADE CONSTRAINTS;
DROP TABLE invoice CASCADE CONSTRAINTS;
DROP TABLE products CASCADE CONSTRAINTS;
DROP TABLE invoice_item CASCADE CONSTRAINTS;

CREATE TABLE customers (
user_ID NUMBER PRIMARY KEY,
fname VARCHAR2(59),
lname VARCHAR2(59),
address_1_line_1 VARCHAR2(59),
address_1_line_2 VARCHAR2(59),
address_1_city VARCHAR2(11),
address_1_state VARCHAR2(4),
address_1_zip VARCHAR2(11),
credit_card_1_exp VARCHAR2(5),
credit_card_1_num VARCHAR2(21),
account_balance NUMBER(11) DEFAULT (0));

INSERT INTO customers VALUES (1,  'Max', 'Antin',  '950 Flemington St', 'second floor', 'Pittsburgh', 'PA', '15217', '11/29', '6011-999-9999', 0);
--(select user_ID, fname, lname, address_1_line_1, address_1_line_2, address_1_city, address_1_state, address_1_zip, credit_card_1_exp, credit_card_1_num, account_balance  
--  from customers);
  
--SELECT*FROM   (customers);
  
--desc customers;
  
CREATE TABLE products (
product_sku NUMBER PRIMARY KEY,
product_name VARCHAR2(59),
product_price NUMBER(11) DEFAULT 0);

INSERT INTO products VALUES (1, saw, 7);
INSERT INTO products VALUES (2, miter, 9);
--(select product_sku, product_name, product_price  from products);
SELECT*FROM products;

--desc products;  

CREATE TABLE invoice (
invoice_number NUMBER PRIMARY KEY(9),
invoice_item VARCHAR2(9),
order_date DATE, 
delivery_date DATE());

--desc invoice;

CREATE TABLE invoice_item (
invoice_number int(9), 
product_sku int(9), 
constraint t_pk PRIMARY KEY (invoice_number, product_sku) ,
product_quantity INT(3),
price (product_quantity * product_price) NUMBER(11) DEFAULT 0));



INSERT INTO invoice VALUES (1, 1, 10/18/2018, 11/25/2018 );
--(select invoice_number, invoice_item, order_date, delivery_date from invoice);

INSERT INTO invoice_item VALUES (1, 1, 1);

desc invoice_item;
desc invoice;

SELECT*FROM invoice;
SELECT*FROM invoice-item;
