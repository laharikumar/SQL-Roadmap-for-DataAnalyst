SELECT * FROM employee_salary
	WHERE salary > 50000;
    
    SELECT * FROM employee_salary
    WHERE first_name='Leslie';
    
    
    #AND Operator
    SELECT * FROM employee_salary
    WHERE occupation = 'Office Manager' and salary='50000';
    
    #OR Operator
       SELECT * FROM employee_demographics
       WHERE (first_name= 'Leslie' AND age=44) OR age  > 70 ;
       
       
    
#Not operator 
   SELECT * FROM employee_demographics
    WHERE gender!='Female';
    
  #LIKE Statement = Exact match    
  # % means anything and _ means specific value
 SELECT * FROM employee_demographics
       WHERE first_name LIKE 'jer%'; #begin with jer compulsory anything comes after jer
       
       # use _
       SELECT * FROM employee_demographics
       WHERE first_name LIKE 'a___';
       
       #Combine both _ and %
        SELECT * FROM employee_demographics
       WHERE first_name LIKE 'a___%' ;
       