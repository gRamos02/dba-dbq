CREATE DATABASE IF NOT EXISTS inventory_management;
USE inventory_management;

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price NUMERIC(10, 2) NOT NULL
);

CREATE TABLE stock (
    product_id INT REFERENCES products(product_id),
    warehouse_id INT REFERENCES warehouses(warehouse_id),
    quantity INT NOT NULL,
    PRIMARY KEY (product_id, warehouse_id)
);

CREATE TABLE warehouses (
    warehouse_id SERIAL PRIMARY KEY,
    warehouse_name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL
);

CREATE TABLE suppliers (
    supplier_id SERIAL PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    contact_name VARCHAR(50),
    contact_email VARCHAR(100),
    contact_phone VARCHAR(20)
);

CREATE TABLE inventory_transactions (
    transaction_id SERIAL PRIMARY KEY,
    product_id INT REFERENCES products(product_id),
    warehouse_id INT REFERENCES warehouses(warehouse_id),
    transaction_type VARCHAR(20) NOT NULL, -- e.g., 'IN', 'OUT'
    transaction_date DATE NOT NULL,
    quantity INT NOT NULL
);
