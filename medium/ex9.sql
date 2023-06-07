-- Find the average total compensation based on employee titles and gender. Total compensation is calculated by adding both the salary and bonus of each employee. However, not every employee receives a bonus so disregard employees without bonuses in your calculation. Employee can receive less than one bonus.
-- Output the employee title, gender (i.e., sex), along with the average total compensation.

-- Tables: sf_employee

-- id: int
-- first_name: varchar
-- last_name: varchar
-- age: int
-- sex: varchar
-- employee_title: varchar
-- department: varchar
-- salary: int
-- target: int
-- email: varchar
-- city: varchar
-- address: varchar
-- manager_id: int

-- table sf_bonus

-- worker_ref_id: int
-- bonus: int

WITH EX9 AS (
    SELECT SUM(bonus) as bonus, worker_ref_id
    FROM sf_bonus
    GROUP BY worker_ref_id
)
SELECT employee_title, sex, AVG( salary + bonus) AS avg_compensation
    FROM sf_employee AS A 
    JOIN EX9 AS F
    ON F.worker_ref_id= A.id  
    GROUP BY employee_title 
    ORDER BY AVG( salary + bonus) DESC