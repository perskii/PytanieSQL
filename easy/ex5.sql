--Find all posts which were reacted to with a heart. For such posts output all columns from facebook_posts table.

-- Table: facebook_reactions

-- poster: int
-- friend: int
-- reaction: varchar
-- date_day: int
-- post_id: int

-- Table: -- Table: facebook_reactions

-- post_id: int
-- poster: int
-- post_text: varchar
-- post_keywords: varchar
-- post_date: datetime

SELECT DISTINCT * FROM facebook_posts as A
    JOIN facebook_reactions as K 
        ON K.post_id = A.post_id
    WHERE reaction = 'heart' 
    Group by K.post_id

-- or

 SELECT * FROM facebook_posts
    WHERE post_id IN( 
        SELECT post_id FROM facebook_reactions 
            WHERE reaction = 'heart')
    