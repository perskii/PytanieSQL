--Calculate each user's average session time. A session is defined as the time difference between a page_load and page_exit. For simplicity, assume a user has only 1 session per day and if there are multiple of the same events on that day, consider only the latest page_load and earliest page_exit. Output the user_id and their average session time.

-- Table: facebook_web_log

-- user_id: int
-- timestamp: datetime
-- action: varchar

-- clause defines a temporary data set whose output is available to be referenced in subsequent queries
with EX3 AS (
    SELECT 
        DATE(timestamp),
        user_id,
        -- IF(condition, value_if_true, value_if_false)
        MAX(IF(action = 'page_load', timestamp, NULL)) as load_time,
        MIN(IF(action = 'page_exit', timestamp, NULL)) as exit_time
    FROM facebook_web_log
    GROUP BY 1, 2
)
SELECT user_id, AVG(TIMESTAMPDIFF(SECOND, load_time, exit_time)) as session_time
    FROM EX3
    GROUP BY user_id
    -- 
    HAVING session_time IS NOT NULL;

-- other example

with EX3 AS (
    SELECT 
        DATE(timestamp),
        user_id,
        -- IF(condition, value_if_true, value_if_false)
        MAX(CASE WHEN action = 'page_load' THEN timestamp ELSE NULL END) as load_time,
        MIN(CASE WHEN action = 'page_exit' THEN timestamp ELSE NULL END) as exit_time
    FROM facebook_web_log
    GROUP BY 1, 2
)
SELECT user_id, AVG(TIMESTAMPDIFF(SECOND, load_time, exit_time)) as session_time
    FROM EX3
    GROUP BY user_id
    -- 
    HAVING session_time IS NOT NULL;