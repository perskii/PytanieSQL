--What is the overall friend acceptance rate by date? Your output should have the rate of acceptances by the date the request was sent. Order by the earliest date to latest.


--Assume that each friend request starts by a user sending (i.e., user_id_sender) a friend request to another user (i.e., user_id_receiver) that's logged in the table with action = 'sent'. If the request is accepted, the table logs action = 'accepted'. If the request is not accepted, no record of action = 'accepted' is logged.

-- Table: fb_friend_requests


-- user_id_sender: varchar
-- user_id_receiver: varchar
-- date: datetime
-- action: varchar

SELECT 
    sent.date, 
    (SUM(CASE WHEN got.action = 'accepted' THEN 1 ELSE 0 END))/
    (SUM(CASE WHEN sent.action = 'sent' THEN 1 ELSE 0 END)) as percentage_acceptance
    FROM fb_friend_requests as sent
    LEFT JOIN fb_friend_requests AS got 
    ON sent.user_id_sender = got.user_id_sender
    AND sent.user_id_receiver = got.user_id_receiver
    AND sent.date <= got.date
    AND sent.action <> got.action
    GROUP BY sent.date
    HAVING percentage_acceptance != 0 
    ORDER BY sent.date