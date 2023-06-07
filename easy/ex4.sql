--Count the number of movies that Abigail Breslin was nominated for an oscar. 

--Table: oscar_nominees

-- year: int
-- category: varchar
-- nominee: varchar
-- movie: varchar
-- winner: bool
-- id: int

SELECT COUNT(nominee) as count FROM oscar_nominees
    WHERE nominee = 'Abigail Breslin';
    