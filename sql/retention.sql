-- Retention по неделям
WITH first_week AS (
    SELECT user_id, MIN(date_trunc('week', ts)) AS w0
    FROM views GROUP BY user_id
)
SELECT date_trunc('week', v.ts) AS week,
    COUNT(DISTINCT v.user_id) AS active,
    COUNT(DISTINCT CASE WHEN date_trunc('week', v.ts) = f.w0 + INTERVAL '1 week'
                        THEN v.user_id END) AS retained_w1
FROM views v
JOIN first_week f ON f.user_id = v.user_id
GROUP BY week
ORDER BY week;
