USE ig_clone;

/* Find the five newly joined users */
SELECT * FROM users
ORDER BY created_at DESC
LIMIT 5;

/* On which weekday users post most of the photoes*/
SELECT date_format(created_dat, '%W') AS 'week day', COUNT(*) AS 'number_posted' FROM photos
GROUP BY 1
ORDER BY 2 DESC;

/* Find usernames who never posted a photo*/ 
SELECT username FROM users
LEFT JOIN photos ON users.id = photos.user_id
WHERE photos.id IS NULL;



