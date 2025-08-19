
#GROUPBY ;group rows that have the same values in to summary rows

SELECT first_name,last_name FROM employee_demographics
	GROUP BY  first_name,last_name ;


SELECT gender FROM employee_demographics
group by gender;


#AGGREGATED FUNCTIONS
#AVG,MAX,MIN,COUNT
SELECT gender,avg(age),max(age),min(age),count(age) FROM employee_demographics
group by gender;

SELECT occupation ,salary
FROM employee_salary
GROUP BY occupation,salary;


#ORDERBY: SORT THE RESULTS SET 
SELECT salary
FROM employee_salary
ORDER BY salary Desc;


SELECT *
FROM employee_demographics
ORDER BY age,gender Desc;

Select *
FROM employee_demographics
ORDER BY 4,5 Desc;  #4,and 5 are col nos

#retrieve 2nd max salary using subquery
SELECT MAX(salary) AS second_highest
FROM employee_salary
WHERE salary < (SELECT MAX(salary) FROM employee_salary);


