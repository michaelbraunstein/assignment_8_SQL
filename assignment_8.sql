/*
Michael Braunstein
CISS-250-300
Thompson
Assignment 8
October 23, 2018
*/

DROP TABLE customer CASCADE CONSTRAINTS;
DROP TABLE invoice CASCADE CONSTRAINTS;
DROP TABLE product CASCADE CONSTRAINTS;
DROP TABLE invoice_item CASCADE CONSTRAINTS;

CREATE TABLE customer (
customer_id NUMBER PRIMARY KEY,
fname VARCHAR2(59),
lname VARCHAR2(59),
bizname VARCHAR2(59),
address_1_line_1 VARCHAR2(59),
address_1_line_2 VARCHAR2(59),
address_1_city VARCHAR2(11),
address_1_state VARCHAR2(4),
address_1_zip VARCHAR2(11),
credit_card_1_exp VARCHAR2(5),
credit_card_1_num VARCHAR2(21),
account_balance NUMBER(11) DEFAULT (0));

INSERT INTO customer VALUES (1,  'Max', 'Antin', 'Max Antin Floors',  '950 Flemington St', 'second floor', 'Pittsburgh', 'PA', '15217', '11/29', '6011-999-9999', 0);
 
CREATE TABLE product (
product_sku NUMBER PRIMARY KEY,
product_description VARCHAR2(59) CONSTRAINT product_description unique,
product_price NUMBER(11,2) DEFAULT 1);

INSERT INTO product (product_sku, product_description, product_price) VALUES (1, 'saw', 7.00);
INSERT INTO product (product_sku, product_description, product_price) VALUES (2, 'miter', 9.99);
INSERT INTO product (product_sku, product_description, product_price) VALUES (3, 'Uncle Johns Dried Pinto Beans', 1);
--(select product_sku, product_name, product_price  from products);

CREATE TABLE invoice (
invoice_number NUMBER PRIMARY KEY,
customer_id NUMBER,
--invoice_item NUMBER,
order_date DATE, 
delivery_date DATE);

INSERT INTO invoice (invoice_number, customer_id, order_date, delivery_date)  VALUES ( 1, 1, '18-10-18', '18-11-18');

CREATE TABLE invoice_item (
invoice_number number,
foreign key (invoice_number) REFERENCES invoice,
product_sku number, 
primary key (invoice_number, product_sku),
foreign key (product_sku) REFERENCES product,
--constraint t_pk PRIMARY Key (invoice_number REFERENCES invoice, product_sku REFERENCES product),
product_quantity number,
product_price number(11,2)
);

--(select invoice_number, invoice_item, order_date, delivery_date from invoice);



insert into invoice_item (invoice_number, product_sku, product_quantity, product_price)   VALUES(1, 1, 1, 7.00);
insert into invoice_item (invoice_number, product_sku, product_quantity, product_price)   VALUES(1, 3, 91, 1);

CREATE INDEX product_index ON invoice_item(product_sku);

SELECT * FROM invoice_item;
SELECT * FROM invoice;


SELECT customer.bizname, SUM(invoice_item.product_quantity) AS Beans_Ordered  
FROM customer 
INNER JOIN invoice on customer.customer_id = invoice.customer_id
INNER JOIN invoice_item on invoice.invoice_number = invoice_item.invoice_number
INNER JOIN product on product.product_sku = invoice_item.product_sku 

WHERE invoice_item.product_sku = 3 
HAVING SUM (product_quantity) >3
group by bizname  
 
 
;
