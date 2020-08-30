## One row per pageview per user, enriched with postcode data for the particular user.
## Runs once per hour, depends on stg_pageviews_stats and postcode_stats models

WITH postcodes AS (

  SELECT
  DATE(timestamp) AS date,
  timestamp,
  user_id,
  postcode AS postcode_as_of_date,
  LAST_VALUE(postcode) OVER(PARTITION BY user_id ORDER BY timestamp ASC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS current_postcode
  
  FROM postcode_stats

)

SELECT
DATE(pageviews.timestamp) AS date,
pageviews.timestamp AS timestamp,
pageviews.user_id,
pageviews.page_url,
postcodes.postcode_as_of_date,
postcodes.current_postcode

FROM stg_pageviews_stats AS pageviews
LEFT JOIN postcodes 
  ON DATE(pageviews.timestamp) = postcodes.date
  AND pageviews.user_id = postcodes.user_id
  
