
DROP TABLE IF EXISTS categories;

CREATE TABLE categories(
   category_id INTEGER PRIMARY KEY,
   category_name VARCHAR(50),
   description VARCHAR(256),
   picture VARCHAR(256)
);

\copy categories FROM 'C:\\Users\noram\Documents\Coding\SpicedAcademy\Week06\northwind_data_clean-master\northwind_data_clean-master\data\categories.csv' DELIMITER ',' CSV HEADER

DROP TABLE IF EXISTS customers;

CREATE TABLE customers(  
  customer_id VARCHAR(25) PRIMARY KEY,
  company_name VARCHAR(100),
  contact_name VARCHAR(100),
  contact_title VARCHAR(100),
  address VARCHAR(100),
  city VARCHAR(100),
  region VARCHAR(100),
  postalCode VARCHAR(25),
  country VARCHAR(50),
  phone VARCHAR(25),
  fax VARCHAR(25)
);

\copy customers FROM 'C:\\Users\noram\Documents\Coding\SpicedAcademy\Week06\northwind_data_clean-master\northwind_data_clean-master\data\customers.csv' DELIMITER ',' CSV HEADER

DROP TABLE IF EXISTS employee_territories;

CREATE TABLE employee_territories(
    employee_id INTEGER,  
    territory_id INTEGER
);

\copy employee_territories FROM 'C:\\Users\noram\Documents\Coding\SpicedAcademy\Week06\northwind_data_clean-master\northwind_data_clean-master\data\employee_territories.csv' DELIMITER ',' CSV HEADER

 
DROP TABLE IF EXISTS employees;

CREATE TABLE employees(
    employee_id INTEGER PRIMARY KEY,  
    last_name VARCHAR (20),
    first_name VARCHAR (20),
    title VARCHAR (30),
    title_of_courtesy VARCHAR (5),
    birth_date VARCHAR(10),
    hire_date VARCHAR(10),
    address VARCHAR(50),
    city VARCHAR (20),
    region VARCHAR (5),
    postal_code VARCHAR (10),
    country VARCHAR(5),
    home_phone VARCHAR (20),
    extension SMALLINT,
    photo VARCHAR (500),
    notes VARCHAR (500),
    reports_to INTEGER, 
    photo_path VARCHAR (80)
);

\copy employees FROM 'C:\\Users\noram\Documents\Coding\SpicedAcademy\Week06\northwind_data_clean-master\northwind_data_clean-master\data\employees.csv' DELIMITER ',' NULL AS 'NULL' CSV HEADER

DROP TABLE IF EXISTS orders;

CREATE TABLE orders(
    order_id INTEGER PRIMARY KEY,
    customer_id VARCHAR(20) NOT NULL,
    employee_id smallint,
    order_date TIMESTAMP NULL,
    required_date TIMESTAMP NULL,
    shipped_date TIMESTAMP NULL,
    ship_via smallint, 
    freight REAL,
    ship_name VARCHAR(50) NOT NULL,
    ship_address VARCHAR(100) NOT NULL,
    ship_city VARCHAR(20) NOT NULL,
    ship_region VARCHAR(30),
    ship_postal_code text,
    ship_country VARCHAR(50) NOT NULL
);

\copy orders FROM 'C:\\Users\noram\Documents\Coding\SpicedAcademy\Week06\northwind_data_clean-master\northwind_data_clean-master\data\orders.csv' DELIMITER ',' NULL AS 'NULL' CSV HEADER

ALTER TABLE orders
ADD CONSTRAINT fk_employee_id FOREIGN KEY(employee_id)
REFERENCES employees(employee_id);

DROP TABLE IF EXISTS order_details;

CREATE TABLE order_details(
    id SERIAL PRIMARY KEY,
    order_id smallint,
    product_id smallint,
    unit_price REAL,
    quantity smallint,
    discount REAL
);

\copy order_details (order_id,product_id,unit_price, quantity,discount) FROM 'C:\\Users\noram\Documents\Coding\SpicedAcademy\Week06\northwind_data_clean-master\northwind_data_clean-master\data\order_details.csv' DELIMITER ',' CSV HEADER

DROP TABLE IF EXISTS products;

CREATE TABLE products(
    product_id INTEGER PRIMARY KEY,
    product_name VARCHAR(100),
    supplier_id SMALLINT,
    category_id SMALLINT,
    quantity_per_unit VARCHAR(100),
    unit_price REAL,
    units_in_stock INTEGER,
    units_on_order INTEGER,
    reorder_level INTEGER,
    discontinued BOOLEAN
);

\copy products FROM 'C:\\Users\noram\Documents\Coding\SpicedAcademy\Week06\northwind_data_clean-master\northwind_data_clean-master\data\products.csv' DELIMITER ',' CSV HEADER

DROP TABLE IF EXISTS regions;

CREATE TABLE regions(
   region_id SERIAL PRIMARY KEY,
   region_description VARCHAR (10) NOT NULL
);

\copy regions FROM 'C:\\Users\noram\Documents\Coding\SpicedAcademy\Week06\northwind_data_clean-master\northwind_data_clean-master\data\regions.csv' DELIMITER ',' CSV HEADER

DROP TABLE IF EXISTS shippers;

CREATE TABLE shippers(
   shipper_id SERIAL PRIMARY KEY,
   company_name VARCHAR (20) NOT NULL,
   phone VARCHAR(20) NOT NULL
);

\copy shippers FROM 'C:\\Users\noram\Documents\Coding\SpicedAcademy\Week06\northwind_data_clean-master\northwind_data_clean-master\data\shippers.csv' DELIMITER ',' CSV HEADER


DROP TABLE IF EXISTS suppliers;

CREATE TABLE suppliers(
   supplier_id SERIAL PRIMARY KEY,
   company_name VARCHAR (50) NOT NULL,
   contact_name VARCHAR(50) NOT NULL,
   contact_title VARCHAR(50) NOT NULL,
   address VARCHAR(50),
   city VARCHAR(30)NOT NULL,
   region VARCHAR(30),
   postal_code VARCHAR(30),
   country VARCHAR(30),
   phone VARCHAR(30),
   fax VARCHAR(30), 
   home_page VARCHAR(100)
);

\copy suppliers FROM 'C:\\Users\noram\Documents\Coding\SpicedAcademy\Week06\northwind_data_clean-master\northwind_data_clean-master\data\suppliers.csv' DELIMITER ',' CSV HEADER


DROP TABLE IF EXISTS territories;

CREATE TABLE territories(
    territory_id VARCHAR(30) PRIMARY KEY,
    territory_description VARCHAR(20) NOT NULL,
    region_id smallint
);


\copy territories FROM 'C:\\Users\noram\Documents\Coding\SpicedAcademy\Week06\northwind_data_clean-master\northwind_data_clean-master\data\territories.csv' DELIMITER ',' CSV HEADER

