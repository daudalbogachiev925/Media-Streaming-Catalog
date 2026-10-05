-- Топ-10 за 7 дней
SELECT t.id, t.title, COUNT(*) AS views, SUM(v.seconds) AS total_sec
FROM views v
JOIN titles t ON t.id = v.title_id
WHERE v.ts > NOW() - INTERVAL '7 days'
GROUP BY t.id
ORDER BY views DESC
LIMIT 10;
