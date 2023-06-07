--Find the base pay for Police Captains.
--Output the employee name along with the corresponding base pay.

-- Table: sf_public_salaries

-- id: int
-- employeename: varchar
-- jobtitle: varchar
-- basepay: float
-- overtimepay: float
-- otherpay: float
-- benefits: float
-- totalpay: float
-- totalpaybenefits: float
-- year: int
-- notes: datetime
-- agency: varchar
-- status: varchar

SELECT employeename AS name, basepay FROM sf_public_salaries
    WHERE jobtitle LIKE '%CAPTAIN III%' || '%GENERAL MANAGER%'




-- CAPTAIN III

-- GENERAL MANAGER