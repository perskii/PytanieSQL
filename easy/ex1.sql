--Write a query that calculates the difference between the highest salaries found in the 
--marketing and engineering departments. Output just the absolute difference in salaries.

-- u must use: join, where and multiple selects.


--tables:

--db_employee

--id: int 
--first_name: varchar
--last_name: varchar
--salary: int
--department_id: int

--db_dept

--id: int
--department: varchar

---------------- SHOWING SALARY FOR ID 1 AND 4 -----------------------------

SELECT salary FROM db_employee as A
    JOIN db_dept as K ON A.department_id =K.id
    WHERE K.id = 4 OR K.id = 1

--- knowledge 

--- INNER JOIN ---
--- alows us to combine two or more tables, based on a related column  between them. 
-- in our example that was ID of the departments --
--- ABS ---
--- return absolute value ---

    SELECT
    ABS((SELECT MAX(salary) FROM db_employee as A
    JOIN db_dept as K ON A.department_id =K.id
    WHERE K.id = 4) - 
    
    (SELECT MAX(salary) FROM db_employee as A
    JOIN db_dept as K ON A.department_id =K.id
    WHERE K.id = 1)) as salary_diff;
    

    --- we are taking summary outcome and taking absolute value 
