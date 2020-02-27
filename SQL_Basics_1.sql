/*    
1. Select the information from the “dept_no” column of the “departments” table.

2. Select all data from the “departments” table.

*/

SELECT 
    dept_no
FROM
    departments;
    
SELECT 
    *
FROM
    departments;
    
#where name is Elvis

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Elvis';
    
#Retrieve a list with all female employees whose first name is Kellie.

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' AND gender = 'F';
    
    #Retrieve a list with all employees whose first name is either Kellie or Aruna.
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' OR 'Aruna';
    
    
#Operator Precedence
#Retrieve a list with all female employees whose first name is either Kellie or Aruna.

SELECT 
    *
FROM
    employees
WHERE
    (first_name = 'Kellie'
        OR first_name = 'Aruna')
        AND gender = 'F';
        
        
#Use the IN operator to select all individuals from the “employees” table, whose first name is either “Denis”, or “Elvis”.

SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Denis' , 'Elvis');
    
    
#Extract all records from the ‘employees’ table, aside from those with employees named John, Mark, or Jacob.
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('John' , 'Mark', 'Jacob');
    
    /* 
Working with the “employees” table, use the LIKE operator to select the data about all individuals, whose first name starts with “Mark”; 
specify that the name can be succeeded by any sequence of characters.

Retrieve a list with all employees who have been hired in the year 2000.

Retrieve a list with all employees whose employee number is written with 5 characters, and starts with “1000”.
    
    */
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE('Mark%');   
    
    
SELECT
    *
FROM
    employees
WHERE
    hire_date LIKE ('%2000%'); 
    
SELECT 
    *
FROM
    employees
WHERE
    emp_no LIKE('1000_');   
    
    
#more playing around 

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%JACK%');

SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('%Jack%'); 
    
    
/*
Select all the information from the “salaries” table regarding contracts from 66,000 to 70,000 dollars per year.

Retrieve a list with all individuals whose employee number is not between ‘10004’ and ‘10012’.

Select the names of all departments with numbers between ‘d003’ and ‘d006’.

*/

SELECT 
    *
FROM
    salaries
WHERE
    salary BETWEEN 66000 AND 70000;

SELECT 
    *
FROM
    employees
WHERE
    emp_no NOT BETWEEN '10004' AND '10012';
    
    
SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no BETWEEN 'd003' AND 'd006';
    
    
SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no IS NOT NULL;
    
    
    
/* 
Retrieve a list with data about all female employees who were hired in the year 2000 or after.

Hint: If you solve the task correctly, SQL should return 7 rows.

Extract a list with all employees’ salaries higher than $150,000 per annum.

*/    
SELECT 
    *
FROM
    employees
WHERE
    gender = 'F' AND hire_date >= '2000-01-01';
    
    
    
SELECT 
    *
FROM
    salaries
WHERE
    salary > 150000;
    
    
/* 

Obtain a list with all different “hire dates” from the “employees” table.

Expand this list and click on “Limit to 1000 rows”. This way you will set the limit of output rows displayed back to the default of 1000.

*/
    
SELECT DISTINCT
    hire_date
FROM
    employees;
    
/*  
How many annual contracts with a value higher than or equal to $100,000 have been registered in the salaries table?

How many managers do we have in the “employees” database? Use the star symbol (*) in your code to solve this exercise.

*/

SELECT 
    COUNT(*)
FROM
    salaries
WHERE
    salary >= 100000;


SELECT 
    COUNT(*)
FROM
    dept_manager;
    
#Select all data from the “employees” table, ordering it by “hire date” in descending order.

SELECT 
    *
FROM
    employees
ORDER BY hire_Date DESC;

/* 
Write a query that obtains two columns. The first column must contain annual salaries higher than 80,000 dollars. 
The second column, renamed to “emps_with_same_salary”, must show the number of employees contracted to that salary. 
Lastly, sort the output by the first column.
*/


SELECT 
    salary, COUNT(emp_no) AS emps_with_same_salary
FROM
    salaries
WHERE
    salary > 80000
GROUP BY salary
ORDER BY salary;

#Select all employees whose average salary is higher than $120,000 per annum.
#Hint: You should obtain 101 records.

SELECT 
   emp_no, AVG(salary)
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000
ORDER BY emp_no;

#Compare the output you obtained with the output of the following two queries:
SELECT 
    *, AVG(salary)
FROM
    salaries
WHERE
    salary > 120000
GROUP BY emp_no
ORDER BY emp_no;

 

SELECT 
    *, AVG(salary)
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000;

/* 
When using WHERE instead of HAVING, the output is larger because in the output we include individual contracts higher than $120,000 per year. 
The output does not contain average salary values.
Finally, using the star symbol instead of “emp_no” extracts a list that contains all columns from the “salaries” table.

*/

#Select the employee numbers of all individuals who have signed more than 1 contract after the 1st of January 2000.
#Hint: To solve this exercise, use the “dept_emp” table.

SELECT 
    emp_no
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(from_date) > 1
ORDER BY emp_no;

#Select the first 100 rows from the ‘dept_emp’ table. 

SELECT 
    *
FROM
    dept_emp
LIMIT 100;



INSERT INTO employees

VALUES

(

    999903,

    '1977-09-14',

    'Johnathan',

    'Creek',

    'M',

    '1999-01-01'

);
#select ten records from the “titles” table to get a better idea about its content.

SELECT 
    *
FROM
    titles
LIMIT 10;

#Then, in the same table, insert information about employee number 999903. 
#State that he/she is a “Senior Engineer”, who has started working in this position on October 1st, 1997.

 

insert into titles

(

    emp_no,

    title,

    from_date

)

values

(

     999903,

    'Senior Engineer',

    '1997-10-01'

);
#sort the records from the “titles” table in descending order to check if you have successfully inserted the new record.

SELECT * FROM titles Order by emp_no DESC;

/* 
Insert information about the individual with employee number 999903 into the “dept_emp” table. 
He/She is working for department number 5, and has started work on  October 1st, 1997; her/his contract is for an indefinite period of time.
Hint: Use the date ‘9999-01-01’ to designate the contract is for an indefinite period.
*/

insert into dept_emp
(

    emp_no,

    dept_no,

    from_date,
    
    to_date
    

)
values
(

     999903,

     'd005',

    '1997-10-01',
    
    '9999-01-01'

);



#Create a new department called “Business Analysis”. Register it under number ‘d010’. Use departments table.
SELECT 
    *
FROM
    departments;
    
    
INSERT INTO departments VALUES ('d010', 'Business Analysis');

#Change the “Business Analysis” department name to “Data Analysis”.
#Hint: To solve this exercise, use the “departments” table.

UPDATE departments 
SET 
    dept_name = 'Data Analysis'
WHERE
    dept_no = 'd010';
    
 #Remove the department number 10 record from the “departments” table.
 
 SELECT * FROM departments;
 
 DELETE FROM departments 
	WHERE
    dept_no = 'd010';

 SELECT * FROM departments; #it has been removed
 
 /*  
 DROP - you won’t be able to roll back to its initial state, or to the last COMMIT statement
 use DROP TABLE only when you are sure you aren’t going to use the table in question anymore
 
 
TRUNCATE
When truncating, auto-increment values will be reset. Lose values but structure table remains.
It is DELETE without WHERE clause.
 
DELETE
Removes records row by row. Auto-increment values are not reset with DELETE

TRUNCATE vs DELETE without WHERE
The SQL optimizer will implement different programmatic approaches when we are using TRUNCATE or DELETE

TRUNCATE delivers the output much quicker than DELETE
 */
 
 #AGGREGATE FUNCTIONS IN SQL (Summarising functions)
 /*  
 
 Why do these functions exist?
- they are a response to the information requirements of a company’s different organizational levels
- top management executives are typically interested in summarized figures and rarely in detailed data
 
-aggregate functions typically ignore null values throughout the field to which they are applied
-But only if you have indicated a specific column name within the parentheses


Alternatively:
COUNT(*)
* returns the number of all rows of the table, NULL values included
 */
 
 #How many departments are there in the “employees” database? Use the ‘dept_emp’ table to answer the question.
 
SELECT 
    COUNT(DISTINCT dept_no)
FROM
    dept_emp;
    
/* 
COUNT is the only function that can be applied to both numeric and non-numeric data. 

*/   

#What is the total amount of money spent on salaries for all contracts starting after the 1st of January 1997?

SELECT 
    SUM(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
    
 #1. Which is the lowest employee number in the database?
SELECT 
    MIN(emp_no)
FROM
    employees;

 #2. Which is the highest employee number in the database?   
SELECT 
    MAX(emp_no)
FROM
    employees;
    
#What is the average annual salary paid to employees who started after the 1st of January 1997?

SELECT 
    AVG(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
    
#Round the average amount of money spent on salaries for all contracts that started after the 1st of January 1997 to a precision of cents.
SELECT 
    ROUND(AVG(salary),2)
FROM
    salaries
WHERE
    from_date > '1997-01-01';  
    
 /* 
 IF NULL() and COALESCE() are among the advanced SQL functions in the toolkit of SQL professionals. 
 They are used when null values are dispersed in your data table and you would like to substitute the null values with another value.
 
  IFNULL(expression_1, expression_2)
-returns the first of the two indicated values if the data value found in the table is not null, 
  and returns the second value if there is a null value
 
 COALESCE(expression_1, expression_2 ..., expression_N) 
 - allows you to insert N arguments in the parentheses
 
 think of COALESCE() as IFNULL() with more than two parameters
 
 - COALESCE() will always return a single value of the ones we have within parentheses, 
 and this value will be the first non-null value of this list, reading the values from left to right
 
 - if COALESCE() has two arguments, it will work precisely like IFNULL()
 
 IFNULL() and COALESCE() do not make any changes to the data set. 
 They merely create an output where certain data values appear in place of NULL values.
 */   
 
 
 #Select the department number and name from the ‘departments_dup’ table and 
 #add a third column where you name the department number (‘dept_no’) as ‘dept_info’. 
 #If ‘dept_no’ does not have a value, use ‘dept_name’.
 
 SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM
    departments_dup
ORDER BY dept_no ASC;


/* 

Modify the code obtained from the previous exercise in the following way. 
Apply the IFNULL() function to the values from the first and second column, so that ‘N/A’ is displayed 
whenever a department number has no value, and ‘Department name not provided’ is shown if there is no value for ‘dept_name’.

*/

SELECT 
    IFNULL(dept_no, 'N/A') AS dept_no,
    IFNULL(dept_name,
            'Department name not provided') AS dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM
    departments_dup
ORDER BY dept_no ASC;


/* 
If you currently have the ‘departments_dup’ table set up, 
use DROP COLUMN to remove the ‘dept_manager’ column from the ‘departments_dup’ table.
Then, use CHANGE COLUMN to change the ‘dept_no’ and ‘dept_name’ columns to NULL.

(If you don’t currently have the ‘departments_dup’ table set up, create it. 
Let it contain two columns: dept_no and dept_name. 
Let the data type of dept_no be CHAR of 4, 
and the data type of dept_name be VARCHAR of 40. 
Both columns are allowed to have null values. 
Finally, insert the information contained in ‘departments’ into ‘departments_dup’.)

Then, insert a record whose department name is “Public Relations”.

Delete the record(s) related to department number two.

Insert two new records in the “departments_dup” table. Let their values in the “dept_no” column be “d010” and “d011”.

*/


# if you don’t currently have ‘departments_dup’ set up

DROP TABLE IF EXISTS departments_dup;

CREATE TABLE departments_dup (
    dept_no CHAR(4) NULL,
    dept_name VARCHAR(40) NULL
);

 

INSERT INTO departments_dup

(

    dept_no,

    dept_name

)

SELECT 
    *
FROM
    departments;

 

INSERT INTO departments_dup (dept_name)

VALUES                ('Public Relations');

 

DELETE FROM departments_dup 
WHERE
    dept_no = 'd002'; 

   

INSERT INTO departments_dup(dept_no) VALUES ('d010'), ('d011');


#Create and fill in the ‘dept_manager_dup’ table, using the following code:

DROP TABLE IF EXISTS dept_manager_dup;

CREATE TABLE dept_manager_dup (

  emp_no int(11) NOT NULL,

  dept_no char(4) NULL,

  from_date date NOT NULL,

  to_date date NULL

  );

 

INSERT INTO dept_manager_dup

select * from dept_manager;

 

INSERT INTO dept_manager_dup (emp_no, from_date)

VALUES                (999904, '2017-01-01'),

                                (999905, '2017-01-01'),

                               (999906, '2017-01-01'),

                               (999907, '2017-01-01');

 

DELETE FROM dept_manager_dup

WHERE

    dept_no = 'd001';

INSERT INTO departments_dup (dept_name)

VALUES                ('Public Relations');

 

DELETE FROM departments_dup

WHERE

    dept_no = 'd002'; 


#JOINS

/*Extract a list containing information about all managers’ employee number, first and last name, department number, and hire date. 
NOTE: INNER JOIN = JOIN
*/

SELECT

    e.emp_no,

    e.first_name,

    e.last_name,

    dm.dept_no,

    e.hire_date

FROM

    employees e

        JOIN

    dept_manager dm ON e.emp_no = dm.emp_no;
    
    
    /* 
duplicate rows 
  - are not always allowed in a database or a data table
  - they are sometimes encountered, especially in new, raw, or uncontrolled data
here’s how to handle duplicates:
-GROUP BY the field that differs most among records!
    
    */
    
  /* 
 Join the 'employees' and the 'dept_manager' tables to return a subset of all the employees whose last name is Markovitch. 
 See if the output contains a manager with that name.  
 Hint: Create an output containing information corresponding to the following fields: 
 ‘emp_no’, ‘first_name’, ‘last_name’, ‘dept_no’, ‘from_date’. 
 Order by 'dept_no' descending, and then by 'emp_no'. 
  */  
  
  SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    dm.dept_no,
    dm.from_date
FROM
    employees e
        LEFT JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
WHERE
    e.last_name = 'Markovitch'
ORDER BY dm.dept_no DESC, e.emp_no;


/* 
The new and the old join syntax - exercise
Extract a list containing information about all managers’ employee number, first and last name, department number, and hire date. 
Use the old type of join syntax to obtain the result.
*/

#OLD SYNTAX

SELECT 
    e.emp_no, e.first_name, e.last_name, dm.dept_no, e.hire_date
FROM
    employees e,
    dept_manager dm
WHERE
    e.emp_no = dm.emp_no;


#New Join Syntax:

SELECT 
    e.emp_no, e.first_name, e.last_name, dm.dept_no, e.hire_date
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no; 


#RUN THE NECESARY CODE SETTING BELOW

set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');

/* 
Select the first and last name, the hire date, and the job title of all employees whose 
first name is “Margareta” and have the last name “Markovitch”.
*/

SELECT 
    e.first_name, e.last_name, e.hire_date, t.title
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    first_name = 'Margareta'
        AND last_name = 'Markovitch'
ORDER BY e.emp_no

;

/* 
Use a CROSS JOIN to return a list with all possible combinations 
between managers from the dept_manager table and department number 9.

*/
    
    SELECT 
    dm.*, d.*
FROM
    departments d
        CROSS JOIN
    dept_manager dm
WHERE
    d.dept_no = 'd009'
ORDER BY d.dept_name;


/* 
return a list with the first 10 employees with all the departments they can be assigned to.
Hint: Don’t use LIMIT; use a WHERE clause.
*/
SELECT 
    e.*, d.*
FROM
    employees e
        CROSS JOIN
    departments d
WHERE
    e.emp_no < 10011
ORDER BY e.emp_no , d.dept_name;


#MORE THAN ONE JOIN
#Select all managers’ first and last name, hire date, job title, start date, and department name.

SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    m.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
        JOIN
    departments d ON m.dept_no = d.dept_no
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    t.title = 'Manager'
ORDER BY e.emp_no;

# 2nd Solution:

SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    m.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
        JOIN
    departments d ON m.dept_no = d.dept_no
        JOIN
    titles t ON e.emp_no = t.emp_no
        AND m.from_date = t.from_date
ORDER BY e.emp_no;


#How many male and how many female managers do we have in the ‘employees’ database?

SELECT 
    e.gender, COUNT(dm.emp_no)
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
GROUP BY gender;

/*
when uniting two identically organized tables
- UNION displays only distinct values in the output 
	- UNION uses more MySQL resources (computational power and storage space)
- UNION ALL retrieves the duplicates as well

Looking for better results? - use UNION
Seeking to optimize performance? - opt for UNION ALL

Go forward to the solution and execute the query. 
What do you think is the meaning of the minus sign before subset A in the last row (ORDER BY -a.emp_no DESC)? 
*/
SELECT 
    *
FROM
    (SELECT 
        e.emp_no,
            e.first_name,
            e.last_name,
            NULL AS dept_no,
            NULL AS from_date
    FROM
        employees e
    WHERE
        last_name = 'Denis' UNION SELECT 
        NULL AS emp_no,
            NULL AS first_name,
            NULL AS last_name,
            dm.dept_no,
            dm.from_date
    FROM
        dept_manager dm) AS a
ORDER BY - a.emp_no DESC;
#Ordering like this will provide an ascending order with null values coming in last. 
#In comparison, if you order by normal ascending order using ASC, the null values will come up first.


/* 

a subquery may return a single value (a scalar), a single row, a single column, or an entire table
- you can have a lot more than one subquery in your outer query
- it is possible to nest inner queries within other inner queries
in that case, the SQL engine would execute the innermost query first, and then each subsequent query, until it runs the outermost query last

*/

#Extract the information about all department managers who were hired between the 1st of January 1990 and the 1st of January 1995.

SELECT 
    *
FROM
    dept_manager
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            employees
        WHERE
            hire_date BETWEEN '1990-01-01' AND '1995-01-01');
            
            
/*

 SQL Subqueries with EXISTS-NOT EXISTS Nested Inside WHERE
 
 EXISTS:
 -tests row values for existence
 -quicker in retrieving large amounts of data
 
 IN 
 -searches among  values
 -faster with smaller datasets
 
 subqueries:
- allow for better structuring of the outer query
- thus, each inner query can be thought of in isolation - hence the name of SQL – Structured Query Language!
- in some situations, the use of subqueries is much more intuitive compared to the use of complex joins and unions
- many users prefer subqueries simply because they offer enhanced code readability


*/
#Select the entire information for all employees whose job title is “Assistant Engineer”. 
#Hint: To solve this exercise, use the 'employees' table.

SELECT 
    *
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            titles t
        WHERE
            t.emp_no = e.emp_no
                AND title = 'Assistant Engineer');


#STEP 1
SELECT 
    emp_no
FROM
    dept_manager
WHERE
    emp_no = '110022';
    
#STEP 2

SELECT e.emp_no as employee_ID,
MIN(de.dept_no) as department_code,
SELECT 
    emp_no
FROM
    dept_manager
WHERE
    emp_no = '110022';
    
#STEP 3
SELECT 
e.emp_no as employee_ID,
MIN(de.dept_no) as department_code,
(SELECT emp_no
FROM
    dept_manager
WHERE
    emp_no = 110022) AS manager_ID
    
    FROM emplyees e
    JOIN
    dep_emp de ON e.emp_no = de.emp_no
    WHERE
    e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no;
    
#STEP 4
SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        emplyees e
    JOIN dep_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS A;
    
#STEP 5- subset a union subset begin

SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        emplyees e
    JOIN dep_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS A 
UNION SELECT 
    B.*  #NOTE CHANGE
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID #NOTE CHANGE
    FROM
        emplyees e
    JOIN dep_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no > 10020  #NOTE CHANGE
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS B; #NOTE CHANGES
    
    
    DROP TABLE IF EXISTS emp_manager;

CREATE TABLE emp_manager (
    emp_no INT(11) NOT NULL,
    dept_no CHAR(4) NULL,
    manager_no INT(11) NOT NULL
);


/*

Fill emp_manager with data about employees, the number of the department they are working in, and their managers.

Your query skeleton must be:

Insert INTO emp_manager SELECT

U.*

FROM

 (A)

UNION (B) UNION (C) UNION (D) AS U;

A and B should be the same subsets used in the last lecture (SQL Subqueries Nested in SELECT and FROM). In other words, assign employee number 110022 as a manager to all employees from 10001 to 10020 (this must be subset A), and employee number 110039 as a manager to all employees from 10021 to 10040 (this must be subset B).

Use the structure of subset A to create subset C, where you must assign employee number 110039 as a manager to employee 110022.

Following the same logic, create subset D. Here you must do the opposite - assign employee 110022 as a manager to employee 110039.

Your output must contain 42 rows.


*/


INSERT INTO emp_manager
SELECT 
    u.*
FROM
    (SELECT 
        a.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS a UNION SELECT 
        b.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no > 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS b UNION SELECT 
        c.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110022
    GROUP BY e.emp_no) AS c UNION SELECT 
        d.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110039
    GROUP BY e.emp_no) AS d) as u;
    
    
    #select from this new emp_manager table only those employees that are managers
    SELECT e1.*
    FROM 
    emp_manager e1
		JOIN
	emp_manager e2 ON e1.emp_no = e2.manager_no
    WHERE
    e2.emp_no IN (SELECT
					manager_no 
				FROM
					emp_manager);
    
    
/* 
SQL Views
Using SQL Views
- Don’t forget they are not real, physical data sets, meaning we cannot insert or update the information that has already been extracted.
- they should be seen as temporary virtual data tables retrieving information from base tables


Create a view that will extract the average salary of all managers registered in the database. Round this value to the nearest cent.

If you have worked correctly, after executing the view from the “Schemas” section in Workbench, you should obtain the value of 66924.27.
*/


CREATE OR REPLACE VIEW v_manager_avg_salary AS
    SELECT 
        ROUND(AVG(salary), 2)
    FROM
        salaries s
            JOIN
        dept_manager m ON s.emp_no = m.emp_no;
        
#stored routines        
use employees;

DROP procedure IF EXISTS select_employees; #dropping a non-parameterized procedure so no parentheses at end
        
 DELIMITER $$
 CREATE PROCEDURE select_employees()
 BEGIN
 SELECT * FROM employees LIMIT 1000;
 END$$

DELIMITER ;

#SO WE CREATED THIS PROCEDURE. LET'S invoke it. There are 3 ways:

#1. CALL database_name.procedure_name();

CALL employees.select_employees();

#2 We already have a default database stated so we can skip the database name

CALL select_employees();

#3 select lightning symbol when you hover over select_employees in schema

/*
Create a procedure that will provide the average salary of all employees.

Then, call the procedure.

*/


#my correct solution
 DELIMITER $$
 CREATE PROCEDURE avg_salary()
 BEGIN
 SELECT AVG(salary) FROM salaries;
 END$$

DELIMITER ;
CALL avg_salary();



#another correct solution
DELIMITER $$

CREATE PROCEDURE avg_salary()

BEGIN
                SELECT
                                AVG(salary)
                FROM
						salaries;

END$$

DELIMITER ;

CALL avg_salary;

CALL avg_salary();

CALL employees.avg_salary;

CALL employees.avg_salary();

#if you want to drop a procedure do the following:

DROP PROCEDURE select_employees; #alternatively drop it in the schema

#NOW LET'S LOOK AT PARAMETRICS PROCEDURES

 DELIMITER $$
 CREATE PROCEDURE emp_salary(in p_emp_no INTEGER)
 BEGIN
 SELECT e.first_name, e.last_name, s.salary, s.from_date, s.to_date
 FROM employees e
 JOIN 
 salaries s ON e.emp_no = s.emp_no
 WHERE e.emp_no = p_emp_no;
 END$$

DELIMITER ;

CALL employees.emp_salary(11300);

#NOW LET'S LOOK AT PARAMETRICS PROCEDURES- AVRG EXAMPLE

 DELIMITER $$
 CREATE PROCEDURE emp_avg_salary(in p_emp_no INTEGER)
 BEGIN
 SELECT e.first_name, e.last_name, AVG(s.salary)
 FROM employees e
 JOIN 
 salaries s ON e.emp_no = s.emp_no
 WHERE e.emp_no = p_emp_no;
 END$$

DELIMITER ;

CALL emp_avg_salary(11300);

#stored procedures with an output parameter
#NB: if you use in and out parameters then use SELECT INTO

 DELIMITER $$
 CREATE PROCEDURE emp_avg_salary_out(in p_emp_no INTEGER, out p_avg_salary DECIMAL(10,2)) #precision 10, scale of 2
 BEGIN
 SELECT  AVG(s.salary)
 INTO p_avg_salary
 FROM employees e
 JOIN 
 salaries s ON e.emp_no = s.emp_no
 WHERE e.emp_no = p_emp_no;
 END$$

DELIMITER ;

CALL emp_avg_salary_out(11300);



/*
Create a procedure called ‘emp_info’ that uses as parameters -
the first and the last name of an individual, and returns their employee number.

*/

DELIMITER $$

CREATE PROCEDURE emp_info(in p_first_name varchar(255), in p_last_name varchar(255), out p_emp_no integer)

BEGIN

                SELECT

                                e.emp_no

                INTO p_emp_no FROM

                                employees e

                WHERE

                                e.first_name = p_first_name

                                                AND e.last_name = p_last_name;

END$$

DELIMITER ;


#VARIABLES

#1 CREATE VARIABLE
SET @v_avg_salary =0;  

#2 PROCEDURE- EXTRACT VALUE THAT WILL BE ASSIGNED TO NEW VARIABLE CREATED
CALL employees.emp_avg_salary_out(11300,@v_avg_salary );

#3
SELECT @v_avg_salary; #we obtained the average salary


/*
Create a variable, called ‘v_emp_no’, where you will store the output of the procedure you created in the last exercise.

Call the same procedure, inserting the values ‘Aruna’ and ‘Journel’ as a first and last name respectively.

Finally, select the obtained output.
*/

SET @v_emp_no = 0;

CALL emp_info('Aruna', 'Journel', @v_emp_no);

SELECT @v_emp_no;


#CREATING FUNCTIONS

 DELIMITER $$
 CREATE PROCEDURE f_emp_avg_salary(in p_emp_no INTEGER) RETURNS DECIMAL(10,2)
 DETERMINISTIC NO SQL READS SQL DATA  #CHECK NOTE BELOW REGARDING THIS LINE OF CODE
 BEGIN
 DECLARE v_avg_salary DECIMAL(10,2);
 SELECT  AVG(s.salary)
 INTO v_avg_salary
 FROM employees e
 JOIN 
 salaries s ON e.emp_no = s.emp_no
 WHERE e.emp_no = p_emp_no;
 RETURNS v_avg_salary;
 END$$

DELIMITER ;

SELECT f_emp_avg_salary(11300); #ALSO NOTE: you CALL a procedure and SELECT a function

/*
Unless we specify what the exact behavior of our function should be, our code will lead to an error. 
This error is with code 1418 and states that the function has none of the following characteristics in its declaration: 
DETERMINISTIC, NO SQL, or READS SQL DATA.
To solve this error, we must include one (or more) of these characteristics in our code in the way shown in the previous video. 
They must be placed right after we ‘ve specified the return type of the function.

Let’s check the meaning of these characteristics:

· DETERMINISTIC – it states that the function will always return identical result given the same input

· NO SQL – means that the code in our function does not contain SQL (rarely the case)

· READS SQL DATA – this is usually when a simple SELECT statement is present

ALSO NOTE: you CALL a procedure and SELECT a function

*/




/*

Create a function called ‘emp_info’ that takes for parameters the first and last name of an employee, 
and returns the salary from the newest contract of that employee.
Hint: In the BEGIN-END block of this program, you need to declare and use two variables 
– v_max_from_date that will be of the DATE type, and 
- v_salary, that will be of the DECIMAL (10,2) type.

Finally, select this function.
*/


DELIMITER $$



CREATE FUNCTION emp_info(p_first_name varchar(255), p_last_name varchar(255)) RETURNS decimal(10,2)

DETERMINISTIC NO SQL READS SQL DATA

BEGIN



                DECLARE v_max_from_date date;

    DECLARE v_salary decimal(10,2);



SELECT 
    MAX(from_date)
INTO v_max_from_date FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name;


SELECT 
    s.salary
INTO v_salary FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name
        AND s.from_date = v_max_from_date;

	
 RETURN v_salary;

END$$
DELIMITER ;
SELECT EMP_INFO('Aruna', 'Journel');


/*
Scope = visibility
- the region of a computer program where a phenomenon, such as a variable, is considered valid
 
MYSQL VARIABLES

LOCAL: a variable that is visible only in the BEGIN – END block in which it was created

DECLARE is a keyword that can be used when creating local variables only

NEXT we look at creating variables where we use SET
*/

#MYSQL SESSION VARIABLE USES 'SET' AND '@'

SET @s_var1 = 3;
SELECT @s_var1 ;

#THIS IS A SESSION VARIABLE AND WILL NOT APPEAR IF U CREATE  A NEW CONNECTION

#global variables- 
#SET GLOBAL var_name= value;
#only system variables can be set to global variables
#e.g. max_connections(0) 

SELECT GLOBAL max_connections =1000;

#if we make our current session the only one connected to the server:

SET @@global.max_connections = 1;  #this is  if you are a database administrator

/*
So we looked at LOCAL, SESSION and GLOBAL variables
Variables in MySQL can be characterized according to the way they have
been created.

user-defined system - variables that can be set by the user manually
system variables - that are pre-defined on our system – the MySQL server

- local variables can be user-defined only
- only system variables can be set as global
- both user-defined and system variables can be set as session variables

-A user can define a local and session variable

-System variables can be set as session or global variables

- Not all system variables can be set as session 

-max_connections (set to global only) whereas sql_mode can be session or global variable


SET SESSION max_connections = 1000;
SET @@global.max_connections = 1;  #global only 

SET GLOBAL sql_mode = 'STRICT_TRANS_TABLES';  #session or global
*/


#indexes- help with big datasets 
CREATE INDEX i_composite on employees(first_name, last_name);

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Georgi'
        AND last_name = 'Facello'
        
#Drop the ‘i_hire_date’ index.

ALTER TABLE employees
DROP INDEX i_hire_date;        


/*
Select all records from the ‘salaries’ table of people whose salary is higher than $89,000 per annum.

Then, create an index on the ‘salary’ column of that table, and check if it has sped up the search of the same SELECT statement.

*/

SELECT 
    *
FROM
    salaries
WHERE
    salary > 89000;



CREATE INDEX i_salary ON salaries(salary);


SELECT 
    *
FROM
    salaries
WHERE
    salary > 89000;

#IF vs CASE STATEMENT
#Case- can have multiple conditional expressions
#If- just have one expression


/*
Obtain a result set containing the employee number, first name, and last name of all employees 
with a number higher than 109990. 
Create a fourth column in the query, indicating whether this employee is also a manager, 
according to the data provided in the dept_manager table, or a regular employee. 

*/

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    CASE
        WHEN dm.emp_no IS NOT NULL THEN 'Manager'
        ELSE 'Employee'
    END AS is_manager
FROM
    employees e
        LEFT JOIN
    dept_manager dm ON dm.emp_no = e.emp_no
WHERE
    e.emp_no > 109990;


/*
Extract a dataset containing the following information about the managers: 
employee number, first name, and last name. Add two columns at the end 
– one showing the difference between the maximum and minimum salary of that employee, 
and another one saying whether this salary raise was higher than $30,000 or NOT.
If possible, provide more than one solution.

*/
#solution 1- CASE
SELECT 
    dm.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS salary_difference,
    CASE
        WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN 'Salary was raised by more then $30,000'
        ELSE 'Salary was NOT raised by more then $30,000'
    END AS salary_raise
FROM
    dept_manager dm
        JOIN
    employees e ON e.emp_no = dm.emp_no
        JOIN
    salaries s ON s.emp_no = dm.emp_no
GROUP BY s.emp_no;  

 #solution 2 -IF
 
 SELECT 
    dm.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS salary_difference,
    IF(MAX(s.salary) - MIN(s.salary) > 30000,
        'Salary was raised by more then $30,000',
        'Salary was NOT raised by more then $30,000') AS salary_increase
FROM
    dept_manager dm
        JOIN
    employees e ON e.emp_no = dm.emp_no
        JOIN
    salaries s ON s.emp_no = dm.emp_no
GROUP BY s.emp_no;

/*
Extract the employee number, first name, and last name of the first 100 employees, 
and add a fourth column, called “current_employee” saying “Is still employed” if the employee is still working in the company, 
or “Not an employee anymore” if they aren’t.
Hint: You’ll need to use data from both the ‘employees’ and the ‘dept_emp’ table to solve this exercise. 

*/

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    CASE
        WHEN MAX(de.to_date) > SYSDATE() THEN 'Is still employed'
        ELSE 'Not an employee anymore'
    END AS current_employee
FROM
    employees e
        JOIN
    dept_emp de ON de.emp_no = e.emp_no
GROUP BY de.emp_no
LIMIT 100;

