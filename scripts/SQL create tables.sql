IF OBJECT_ID ('bronze.customers' , 'U') IS NOT NULL
	DROP TABLE bronze.customers;
CREATE TABLE bronze.customers (
	customer_id                INT,
	first_name                 NVARCHAR(50),
	last_name                  NVARCHAR(50),
	email                      NVARCHAR(50),
	registration_date          DATE
);

IF OBJECT_ID ('bronze.order_details' , 'U') IS NOT NULL
	DROP TABLE bronze.order_details;
CREATE TABLE bronze.order_details (
	order_details_id           INT,
	order_id                   NVARCHAR(50),
	product_id                 NVARCHAR(50),
	quantity                   INT,
	price_at_purchase          FLOAT
);

IF OBJECT_ID ('bronze.orders' , 'U') IS NOT NULL
	DROP TABLE bronze.orders;
CREATE TABLE bronze.orders (
	order_id                   NVARCHAR(50),
	customer_id                INT,
	order_date                 DATE,
	shipping_status            NVARCHAR(50)
);

IF OBJECT_ID ('bronze.products' , 'U') IS NOT NULL
	DROP TABLE bronze.products;
CREATE TABLE bronze.products (
	product_id                 NVARCHAR(50),
	product_name               NVARCHAR(150),
	category                   NVARCHAR(50),
	unit_price                 DECIMAL(10,5),
	stock_quantity             INT
);

IF OBJECT_ID ('bronze.returns' , 'U') IS NOT NULL
	DROP TABLE bronze.returns;
CREATE TABLE bronze.returns (
	return_id                  INT,
	order_details_id           INT,
	order_id                   NVARCHAR(50),
	return_date                DATE,
	reason                     NVARCHAR(50)
);