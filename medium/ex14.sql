-- Find the date with the highest total energy consumption from the Meta/Facebook data centers. 
-- Output the date along with the total energy consumption across all data centers.



-- Table: fb_eu_energy
-- date: datetime
-- consumption: int

-- Table: fb_asia_energy
-- date: datetime
-- consumption: int

-- Table: fb_na_energy
-- date: datetime
-- consumption: int


WITH EX10 AS( SELECT date, SUM(consumption) as total_energy FROM
(SELECT * FROM fb_eu_energy
UNION
SELECT * FROM fb_asia_energy
UNION
SELECT * FROM fb_na_energy
) AS uni
group by date)
SELECT * FROM EX10
WHERE total_energy= (SELECT MAX(total_energy) FROM EX10) 


