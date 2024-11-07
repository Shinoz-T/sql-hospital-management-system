# Hospital Management System - SQL Project

This repository contains the implementation of a **Hospital Management System** using **Oracle SQL Developer**. The system models key hospital operations such as employee management, patient tracking, billing, expense management, stock management, leave tracking, and payroll handling.

The database consists of multiple interrelated tables designed to handle and store information about various hospital operations. This system demonstrates the application of SQL for managing a hospital's day-to-day activities.

## Features

### 1. **Employee Management**
- Store information about hospital employees (e.g., doctors, nurses, surgeons) including their roles and departments.

### 2. **Patient Management**
- Track patient information, including personal details and the doctor assigned to each patient.

### 3. **Billing Information**
- Maintain billing details for patients, including the amount and date of the bill.

### 4. **Expense Management**
- Record hospital expenses like medical supplies, equipment maintenance, and utilities.

### 5. **Stock Management**
- Manage the stock of medical supplies and equipment in the hospital.

### 6. **Leave Information**
- Track employee leave, including the start and end dates, and leave types (e.g., annual leave, sick leave).

### 7. **Payroll Management**
- Manage employee payroll, including salary, bonuses, deductions, and payment dates.

## Database Schema

The system consists of the following tables:

- **Employee**: Stores employee details such as name, job title, and department.
- **Patient**: Stores patient information, including personal details and assigned doctor.
- **Billing Details**: Tracks billing information for each patient.
- **Expense Details**: Stores the hospital's expense data.
- **Stock Details**: Manages inventory of medical supplies and equipment.
- **Leave Info**: Stores information about employee leave.
- **Payroll Info**: Manages payroll data for hospital employees.

## Prerequisites

- **Oracle SQL Developer** (or any SQL client that supports Oracle databases)
- Oracle Database or a similar relational database management system (RDBMS)

## Sample Queries

Once the database is set up, you can run queries to retrieve useful information. For example:

- **List all employees**:
    ```sql
    SELECT * FROM employee;
    ```

- **Get all patients and their assigned doctors**:
    ```sql
    SELECT p.firstname AS patient_name, e.firstname AS doctor_name
    FROM patient p
    JOIN employee e ON p.assigneddoctorid = e.employeeid;
    ```

- **Show all billing records**:
    ```sql
    SELECT * FROM billing_details;
    ```


## License

This project is for educational and portfolio purposes only. Feel free to use and modify it for learning and personal use.

