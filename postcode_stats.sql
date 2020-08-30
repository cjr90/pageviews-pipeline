## One row per user per day. Shows the postcode for each user_id for each day
## Runs once per day, after users_extract is run

INSERT postcode_stats

SELECT
CURRENT_TIMESTAMP() AS timestamp,
id AS user_id,
postcode

FROM users_extract
