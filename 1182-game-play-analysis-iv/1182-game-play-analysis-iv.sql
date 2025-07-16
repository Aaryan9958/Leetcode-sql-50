# Write your MySQL query statement below
# Write your MySQL query statement below
WITH first_login AS (
  SELECT
    player_id,
    MIN(event_date) AS first_date
  FROM Activity
  GROUP BY player_id
),
next_login AS (
  SELECT
    f.player_id
  FROM first_login f
  JOIN Activity a
    ON a.player_id = f.player_id
   AND a.event_date = DATE_ADD(f.first_date, INTERVAL 1 DAY)
  GROUP BY f.player_id
)
SELECT
  ROUND(
    1.0 * (SELECT COUNT(*) FROM next_login) /
    (SELECT COUNT(*) FROM first_login),
    2
  ) AS fraction;