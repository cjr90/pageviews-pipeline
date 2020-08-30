## One row per user per day. Shows the postcode for each user_id for each day
## Runs once per day, after users_extract is run. Appends all of that new data into this table

INSERT postcode_stats

SELECT
CURRENT_TIMESTAMP() AS timestamp,
id AS user_id,
postcode

FROM {{ ref('users_extract') }}
