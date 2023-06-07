-- Find matching hosts and guests pairs in a way that they are both of the same gender and nationality.
-- Output the host id and the guest id of matched pair.

--table: airbnb_hosts

-- host_id: int
-- nationality: varchar
-- gender: varchar
-- age: int

--table: airbnb_guests

-- guest_id: int
-- nationality: varchar
-- gender: varchar
-- age: int


SELECT DISTINCT A.host_id, F.guest_id
    FROM airbnb_hosts AS A
    JOIN airbnb_guests AS F
    ON A.nationality = F.nationality
    AND A.gender = F.gender