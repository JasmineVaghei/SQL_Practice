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

/* Find the number of likes on each photo */
SELECT id, image_url, COUNT(*) AS like_number FROM photos
Join likes ON photos.id = likes.photo_id
GROUP BY photos.id
ORDER BY like_number DESC;

/* Average number of likes per photo - 3 decimal numbers*/
SELECT ROUND((SELECT COUNT(*) FROM likes) / (SELECT COUNT(*) FROM photos),2) AS average;

/* User ranking based on the number of photos posted */
Select user_id, username, COUNT(*) FROM users
JOIN photos ON photos.user_id = users.id
GROUP BY user_id;

/* Total number of users who posted*/
SELECT COUNT(DISTINCT(users.id)) AS total_count
FROM users
JOIN photos ON users.id = photos.user_id;

/* Top 5 tags */
SELECT tag_name, COUNT(tag_name) AS total_tags FROM tags
JOIN photo_tags ON photo_tags.tag_id = tags.id
GROUP BY tags.id
ORDER BY total_tags DESC;

/* Users liked all photos */
SELECT id, username, COUNT(users.id) FROM users
JOIN likes ON users.id = likes.user_id
GROUP BY users.id
HAVING COUNT(users.id) = (SELECT COUNT(*) FROM photos);

/* Users with no comments */
SELECT username, comment_text FROM users
LEFT JOIN comments ON users.id = comments.user_id
GROUP BY users.id
HAVING comment_text IS NULL





