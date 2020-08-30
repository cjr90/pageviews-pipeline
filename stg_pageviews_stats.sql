## One row per pageview per user. Historical view of all pageviews by every user.
## Runs once per hour after pageviews_extract runs. Appends all of that data to this table.

INSERT stg_pageviews_stats

SELECT
CURRENT_TIMESTAMP() AS timestamp,
user_id,
page_url

FROM pageviews_extract
