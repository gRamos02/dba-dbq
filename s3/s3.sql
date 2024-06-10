CREATE DATABASE IF NOT EXISTS finance;
USE finance;
-- Transactions table
CREATE TABLE transactions (
    transaction_id SERIAL PRIMARY KEY,
    transaction_date DATE NOT NULL,
    amount NUMERIC(10, 2) NOT NULL,
    description TEXT,
    account_id INT REFERENCES accounts(account_id)
);

-- Accounts table
CREATE TABLE accounts (
    account_id SERIAL PRIMARY KEY,
    account_name VARCHAR(100) NOT NULL,
    account_type VARCHAR(50) NOT NULL
);

-- Invoices table
CREATE TABLE invoices (
    invoice_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    invoice_date DATE NOT NULL,
    due_date DATE NOT NULL,
    total_amount NUMERIC(10, 2) NOT NULL
);

-- Payments table
CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    invoice_id INT REFERENCES invoices(invoice_id),
    payment_date DATE NOT NULL,
    amount NUMERIC(10, 2) NOT NULL
);