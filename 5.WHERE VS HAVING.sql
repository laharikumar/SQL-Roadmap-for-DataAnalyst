#HAVING VS WHERE
# 1. WHERE Clause:
#Purpose: Filters individual rows before they are grouped and aggregated.
#Usage: Applies conditions to columns that are not part of an aggregate function.

#2. HAVING Clause:
#Purpose: Filters groups of rows after they have been grouped and aggregated by the GROUP BY clause.
#Usage: Applies conditions to aggregate functions (e.g., COUNT, SUM, AVG, MAX, MIN).


SELECT gender,avg(age) From employee_demographics
WHERE avg(age)>60
group by gender; 


SELECT gender,avg(age) From employee_demographics
group by gender
HAVING avg(age)>40;


select occupation ,avg(salary)
from employee_salary
group by occupation
having avg(salary)>50000
order by avg(salary) desc;


#using both where and having
select occupation ,avg(salary)
from employee_salary
where occupation like '%manager%'
group by occupation 
having avg(salary)>75000;
