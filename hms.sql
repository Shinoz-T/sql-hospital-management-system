--HOSPITAL MANAGEMENT SYSTEM--

--CREATING TABLES AND INSERTING VALUES
--Employee table
create table employee (
    employeeid number primary key,
    firstname varchar2(50),
    lastname varchar2(50),
    gender char(1) check (gender in ('m', 'f')),
    jobtitle varchar2(50),
    department varchar2(50)
);

insert into employee values
(1, 'david', 'brown', 'm', 'doctor', 'cardiology');
insert into employee values
(2, 'bill', 'gates', 'm', 'nurse', 'pediatrics');
insert into employee values
(3, 'suresh', 'k', 'm', 'surgeon', 'orthopedics');

--Patient table
create table patient (
    patientid number primary key,
    firstname varchar2(50),
    lastname varchar2(50),
    gender char(1) check (gender in ('m', 'f')),
    dateofbirth date,
    assigneddoctorid number,
    foreign key (assigneddoctorid) references employee(employeeid)
);

insert into patient (patientid, firstname, lastname, gender, dateofbirth, assigneddoctorid) values
(1, 'varsha', 'shree', 'f', to_date('20-02-90', 'dd-mm-yy'), 1);
insert into patient values
(2, 'hameeda', 'banu', 'f', to_date('15-05-85', 'dd-mm-yy'), 1);
insert into patient values
(3, 'arun', 'kumar', 'm', to_date('10-10-80', 'dd-mm-yy'), 2);

--Billing Details Table
create table billing_details (
    billid number primary key,
    patientid number,
    totalamount number(10, 2),
    dateofbill date,
    foreign key (patientid) references patient(patientid)
);

insert into billing_details (billid, patientid, totalamount, dateofbill) values
(1, 1, 1000.00, to_date('10-07-24', 'dd-mm-yy'));
insert into billing_details values
(2, 2, 1500.00, to_date('11-07-24', 'dd-mm-yy'));
insert into billing_details values
(3, 3, 2000.00, to_date('12-07-24', 'dd-mm-yy'));

--Expense Details Table
create table expense_details (
    expenseid number primary key,
    description varchar2(100),
    amount number(10, 2),
    expensedate date
);

insert into expense_details (expenseid, description, amount, expensedate) values
(1, 'medical supplies', 500.00, to_date('01-07-24', 'dd-mm-yy'));
insert into expense_details values
(2, 'equipment maintenance', 300.00, to_date('05-07-24', 'dd-mm-yy'));
insert into expense_details values
(3, 'utilities', 200.00, to_date('07-07-24', 'dd-mm-yy'));

--Stock Details Table
create table stock_details (
    stockid number primary key,
    itemname varchar2(100),
    quantity number,
    unitprice number(10, 2),
    stockdate date
);

insert into stock_details (stockid, itemname, quantity, unitprice, stockdate) values
(1, 'bandages', 100, 5.00, to_date('01-07-24', 'dd-mm-yy'));
insert into stock_details values
(2, 'syringes', 200, 2.50, to_date('02-07-24', 'dd-mm-yy'));
insert into stock_details values
(3, 'gloves', 300, 1.00, to_date('03-07-24', 'dd-mm-yy'));

--Leave Info Table
create table leave_info (
    leaveid number primary key,
    employeeid number,
    startdate date,
    enddate date,
    leavetype varchar2(50),
    foreign key (employeeid) references employee(employeeid)
);

insert into leave_info (leaveid, employeeid, startdate, enddate, leavetype) values
(1, 1, to_date('01-08-24', 'dd-mm-yy'), to_date('10-08-24', 'dd-mm-yy'), 'annual leave');
insert into leave_info values
(2, 2, to_date('01-09-24', 'dd-mm-yy'), to_date('05-09-24', 'dd-mm-yy'), 'sick leave');
insert into leave_info values
(3, 3, to_date('15-08-24', 'dd-mm-yy'), to_date('20-08-24', 'dd-mm-yy'), 'personal leave');

--Payroll Info Table
create table payroll_info (
    payrollid number primary key,
    employeeid number,
    basicsalary number(10, 2),
    bonus number(10, 2),
    deductions number(10, 2),
    paymentdate date,
    foreign key (employeeid) references employee(employeeid)
);

insert into payroll_info (payrollid, employeeid, basicsalary, bonus, deductions, paymentdate) values
(1, 1, 5000.00, 500.00, 200.00, to_date('31-07-24', 'dd-mm-yy'));
insert into payroll_info values
(2, 2, 4000.00, 400.00, 150.00, to_date('31-07-24', 'dd-mm-yy'));
insert into payroll_info values
(3, 3, 6000.00, 600.00, 250.00, to_date('31-07-24', 'dd-mm-yy'));


SELECT 
    p.patientid,
    p.firstname AS patient_firstname,
    p.lastname AS patient_lastname,
    p.gender AS patient_gender,
    e.firstname AS doctor_firstname,
    e.lastname AS doctor_lastname,
    e.jobtitle AS doctor_jobtitle,
    e.department AS doctor_department
FROM 
    patient p
INNER JOIN 
    employee e ON p.assigneddoctorid = e.employeeid;


CREATE OR REPLACE PROCEDURE GetPatientBilling (p_patientid IN NUMBER) AS
BEGIN
    FOR rec IN (
        SELECT 
            b.billid, 
            b.totalamount, 
            b.dateofbill
        FROM 
            billing_details b
        WHERE 
            b.patientid = p_patientid
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Bill ID: ' || rec.billid || ' Total Amount: ' || rec.totalamount || ' Date of Bill: ' || rec.dateofbill);
    END LOOP;
END GetPatientBilling;


CREATE INDEX idx_billing_dateofbill ON billing_details(dateofbill);







