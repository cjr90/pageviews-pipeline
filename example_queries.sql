## Query 1 - Number of pageviews, on a given time period (hour, day, month, etc), per postcode -
## based on the current/most recent postcode of a user.

SELECT
current_postcode,
TIMESTAMP_TRUNC(timestamp, HOUR) AS timestamp_hour  ## HOUR can be replaced with any other desired date part e.g. DAY, WEEK, MONTH, QUARTER etc
COUNT(*) AS num_pageviews

FROM pageviews_stats

GROUP BY 1,2

## Query 2 - Number of pageviews, on a given time period (hour, day, month, etc), per postcode -
## based on the postcode a user was in at the time when that user made a pageview.

SELECT
postcode_as_of_date,
TIMESTAMP_TRUNC(timestamp, HOUR) AS timestamp_hour  ## HOUR can be replaced with any other desired date part e.g. DAY, WEEK, MONTH, QUARTER etc
COUNT(*) AS num_pageviews

FROM pageviews_stats

GROUP BY 1,2
