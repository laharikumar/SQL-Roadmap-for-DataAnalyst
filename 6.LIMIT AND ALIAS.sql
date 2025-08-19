# LIMIT Clause in SQL:The LIMIT clause in SQL is used to restrict the number of rows returned by a query. It is typically used in conjunction with SELECT
#to retrieve a specific subset of data. 

# ALIASES :SQL aliases are used to give a table, or a column in a table, a temporary name. Aliases are often used to make column names more readable.

# LIMIT
SELECT * FROM employee_demographics
order by age desc
limit 4,1 ;

#In MySQL (and some other SQL dialects), LIMIT x,y means:
# x = OFFSET → How many rows to skip.
# y = COUNT → How many rows to return.

#ALIAS
SELECT  gender ,avg(age) FROM employee_demographics
order by avg(age) desc
GROUP BY gender; 
# placing order by before groupby thats why its show error
#order of execution
#1.SELECT
#2.FROM
#3.WHERE
#4.GROUP BY
#5.HAVING
#6.ORDER BY
#7.LIMIT

SELECT gender, AVG(age) AS avg_age
FROM employee_demographics
GROUP BY gender
having avg_age >40;
