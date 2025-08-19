# JOINS :A JOIN combines rows from two or more tables based on a related column between them (usually a foreign key).
select * from employee_demographics;
select * from parks_departments;
SELECT *FROM employee_salary;

#1.INNER JOIN: Returns only the rows that have matching values in both tables.
select * from employee_demographics as ed
inner join employee_salary as es
ON ed.employee_id=es.employee_id;


select ed.employee_id,age,occupation from employee_demographics as ed
inner join employee_salary as es
ON ed.employee_id=es.employee_id;


#OUTER JOINS
#1.LEFT JOIN:Returns all rows from the left table, and matched rows from the right table. If no match → NULL.

select * from employee_demographics as ed
LEFT join employee_salary as es
ON ed.employee_id=es.employee_id;



#2.RIGHT JOIN:Returns all rows from the RIGHT table, and matched rows from the LEFT table. If no match → NULL.

select * from employee_demographics as ed
RIGHT join employee_salary as es
ON ed.employee_id=es.employee_id;


#4.FULL JOIN:Returns all rows from both tables, matched where possible, NULL where no match.

SELECT ed.employee_id, ed.first_name,ed.last_name,es.salary, es.dept_id
FROM employee_demographics ed
LEFT JOIN employee_salary es
  ON ed.employee_id = es.employee_id

UNION

SELECT ed.employee_id, ed.first_name,ed.last_name,es.salary, es.dept_id
FROM employee_demographics ed
RIGHT JOIN employee_salary es
  ON ed.employee_id = es.employee_id;



#5.CROSS JOIN:Returns all possible combinations of rows between two tables (Cartesian product).

SELECT ed.first_name, pd.department_name
FROM employee_demographics ed
CROSS JOIN parks_departments pd;



#6.SELF JOIN:A table joined with itself to compare rows.
select * from employee_salary emp1
join employee_salary emp2
on emp1.employee_id + 1 = emp2.employee_id;



#combine mutliple tables together

select * from employee_demographics as ed
inner join employee_salary as es
ON ed.employee_id=es.employee_id
inner join parks_departments as pd
ON es.dept_id=pd.department_id;

