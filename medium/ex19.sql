-- Find all wineries which produce wines by possessing aromas of plum, cherry, rose, or hazelnut. To make it more simple, look only for singular form of the mentioned aromas.


-- Example Description: Hot, tannic and simple, with cherry jam and currant flavors accompanied by high, tart acidity and chile-pepper alcohol heat.
-- Therefore the winery Bella Piazza is expected in the results.

-- Table: winemag_p1 

-- id: int
-- country: varchar
-- description: varchar
-- designation: varchar
-- points: int
-- price: float
-- province: varchar
-- region_1: varchar
-- region_2: varchar
-- variety: varchar
-- winery: varchar


SELECT winery 
    FROM winemag_p1
    WHERE 
        description LIKE '%plum%'
        OR description LIKE '%cherry%' 
        OR description LIKE '%rose%'
        OR description LIKE '%hazelnut%'
        -- LIKE is regex
                                    -- OR --    
SELECT winery, COUNT(*)
    FROM winemag_p1
    WHERE lower(description) REGEXP '(plum|cherry|rose|hazelnut)([^a-z])'

-- generalnie zadanie powinno działać w 1 zapytaniem, ale na stonce nie działało. Dopiero to z regexp poszło 

-- ^ Matches the starting position within the string. In line-based tools, it matches the starting position of any line.
-- $ Matches the ending position of the string or the position just before a string-ending newline. In line-based tools, it matches the ending position of any line.