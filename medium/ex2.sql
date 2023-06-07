--Find the titles of workers that earn the highest salary. Output the highest-paid title or --multiple titles that share the highest salary.

-- Table: worker

-- worker_id: int
-- first_name: varchar
-- last_name: varchar
-- salary: int
-- joining_date: datetime
-- department: varchar

-- Table: title

-- worker_ref_id: int
-- worker_title: varchar
-- affected_from: datetime

SELECT worker_title FROM title AS F
    JOIN worker AS K ON F.worker_ref_id = K.worker_id 
    WHERE salary IN 
        (SELECT
            MAX(salary) from worker
        )