-- Find the review_text that received the lowest number of  'cool' votes.
-- Output the business name along with the review text with the lowest numbef of 'cool' votes.

-- table yelp_reviews

-- business_name: varchar
-- review_id: varchar
-- user_id: varchar
-- stars: varchar
-- review_date: datetime
-- review_text: varchar
-- funny: int
-- useful: int
-- cool: int

SELECT business_name, review_text, cool
    FROM yelp_reviews
    WHERE cool = (
        SELECT MAX(cool) FROM yelp_reviews)
