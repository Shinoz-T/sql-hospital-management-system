# Hospital Management System - SQL Project

This repository contains the implementation of a **Hospital Management System** using **Oracle SQL**. The system models various aspects of a hospital's data management, including employee records, patient information, billing, stock management, payroll, and more. It demonstrates the use of SQL procedures, indexing, and table relationships to efficiently manage hospital operations.

## Features

### 1. **Employee Management**
- Manage details of hospital employees, such as doctors, nurses, and surgeons.
- Each employee has a `jobtitle` and `department` which can be tracked.

### 2. **Patient Management**
- Manage patient records, including personal information, assigned doctor, and medical details.
- Patients are assigned to a doctor from the `employee` table.

### 3. **Billing Information**
- Track patient billing details, including the bill ID, total amount, and billing date.
- Allows retrieval of billing information for specific patients using a stored procedure.

### 4. **Expense Management**
- Record hospital expenses such as medical supplies, equipment maintenance, and utilities.

### 5. **Stock Management**
- Keep track of stock items such as bandages, syringes, and gloves, with quantities and unit prices.

### 6. **Leave Management**
- Track leave details for employees (e.g., annual leave, sick leave, personal leave).

### 7. **Payroll Management**
- Store payroll information for employees, including base salary, bonuses, deductions, and payment date.

### 8. **SQL Indexing and Optimization**
- An index is created on the `billing_details.dateofbill` column to optimize query performance when filtering by date.

### 9. **Stored Procedure**
- A stored procedure, `GetPatientBilling`, is created to fetch billing information for a specific patient by their `patientid`.

## Database Schema

This system uses the following tables:

- **Employee**: Stores employee details such as name, job title, and department.
- **Patient**: Stores patient details, including name, date of birth, and assigned doctor.
- **Billing Details**: Tracks billing details for each patient.
- **Expense Details**: Stores hospital expenses such as medical supplies, maintenance, and utilities.
- **Stock Details**: Tracks hospital inventory such as medical supplies and equipment.
- **Leave Info**: Stores employee leave records, including leave type and dates.
- **Payroll Info**: Stores employee payroll information, including salary, bonuses, and deductions.

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

