-- Write a query that'll identify returning active users. A returning active user is a user that has made a second purchase within 7 days of any other of their purchases. Output a list of user_ids of these returning active users.

-- Table: amazon_transactions

-- id: int
-- user_id: int
-- item: varchar
-- created_at: datetime
-- revenue: int


-------- PARTITION IN THAT EX --------
-- | 100 | 103 | 105 | etc.
-- | 100 |     |     |
-- |     |     |     |
-- |     |     |     |
-- |     |     |     |
-- |     |     |     |
-- |     |     |     |
-- |     |     |     |
-- |     |     |     |


-- partition - creating separate date into logical units ('groups')


SELECT DISTINCT user_id FROM(
    SELECT DISTINCT user_id, created_at,
        LEAD(created_at) OVER (PARTITION BY user_id ORDER BY created_at) as next_data
        FROM amazon_transactions
    ) query
    WHERE DATEDIFF(next_data, created_at) <= 7;
