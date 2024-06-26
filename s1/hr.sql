CREATE DATABASE IF NOT EXISTS hr;
USE hr_management; 

CREATE TABLE units (
    unit_id SERIAL PRIMARY KEY,
    unit_name VARCHAR(50) NOT NULL
);

CREATE TABLE roles (
    role_id SERIAL PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    unit_id INT REFERENCES units(unit_id),
    role_id INT REFERENCES roles(role_id),
    hire_date DATE NOT NULL
);


CREATE TABLE salaries (
    employee_id INT REFERENCES employees(employee_id),
    salary NUMERIC(10, 2) NOT NULL,
    effective_date DATE NOT NULL,
    PRIMARY KEY (employee_id, effective_date)
);