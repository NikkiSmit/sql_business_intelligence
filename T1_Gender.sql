/*
Create a visualization that provides a breakdown between 
the male and female employees working in the company each year, starting from 1990. 
Please assume that you’ll need to use the from_date column from the dept_emp table to count the
number of employees working in the company each year. 
You will discover the alternative as you move on. 
*/

#TASK 1
SELECT 
    YEAR(d.from_date) AS calendar_year,
    e.gender,
    COUNT(E.emp_no) AS num_of_employees
FROM
    t_employees e
        JOIN
    t_dept_emp d ON e.emp_no = d.emp_no
GROUP BY calendar_year , e.gender
HAVING calendar_year >= 1990;








