
--Find employees who are earning more than their managers. Output the employee's first name along with the corresponding salary.

-- Table: employee

-- id: int
-- first_name: varchar
-- last_name: varchar
-- age: int
-- sex: varchar
-- employee_title: varchar
-- department: varchar
-- salary: int
-- target: int
-- bonus: int
-- email: varchar
-- city: varchar
-- address: varchar
-- manager_id: int

SELECT F.first_name AS employee_name, F.salary 
    FROM employee F
    JOIN employee K
    -- ważna kolejność aliasów. 
    -- porównujemy wartości wybrane z tabeli A z tymi z tabeli B
    ON K.id = F.manager_id
    WHERE F.salary > K.salary
