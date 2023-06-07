
--Find the number of apartments per nationality that are owned by people under 30 years old.
-- Output the nationality along with the number of apartments.
-- Sort records by the apartments count in descending order.


--table: airbnb_hosts

-- host_id: int
-- nationality: varchar
-- gender: varchar
-- age: int

-- table: airbnb_units

-- host_id: int
-- unit_id: varchar
-- unit_type: varchar
-- n_beds: int
-- n_bedrooms: int
-- country: varchar
-- city: varchar


SELECT 
    K.nationality, 
    COUNT(*) as apartment_count
    FROM (SELECT DISTINCT * FROM airbnb_hosts) AS K
    JOIN airbnb_units as F
    ON K.host_id = F.host_id
    WHERE K.age < 30 
    AND F.unit_type = 'Apartment'
    GROUP BY K.nationality