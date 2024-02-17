--Task 2--

--1--
SELECT track_name, duration FROM track
WHERE duration = (SELECT MAX(duration) FROM track);
--2--
SELECT track_name, duration FROM track
WHERE duration >= 210;
--3--
SELECT collection_name FROM collection
WHERE release BETWEEN '2018-01-01' AND '2021-01-01';
--4--
SELECT musician_name FROM musician
WHERE musician_name NOT LIKE '% %';
--5--
SELECT track_name FROM track
WHERE track_name LIKE '%My%' OR track_name LIKE '%Мой%';

--Task 3--

--1--
SELECT m.genre_name, COUNT(musician_id) FROM music_genre m
JOIN musician_genre p ON m.genre_id = p.genre_id
GROUP BY genre_name;
--2--
SELECT COUNT(album_name) FROM track t
JOIN album a ON t.album_id = a.album_id
WHERE release BETWEEN '2019-01-01' AND '2020-12-31';
--3--
SELECT album_name, avg(duration) FROM track t
JOIN album a ON t.album_id = a.album_id
GROUP BY album_name;
--4--
SELECT musician_name FROM musician
WHERE musician_name NOT IN (SELECT musician_name FROM musician m 
	JOIN mus_album ma ON m.musician_id = ma.musician_id
	JOIN album a ON ma.album_id = a.album_id
	WHERE release BETWEEN '2020-01-01' AND '2020-12-31') 
GROUP BY musician_name;
--5--
SELECT collection_name FROM collection c
JOIN playlist p ON p.collection_id = c.collection_id
JOIN track t ON p.track_id = t.track_id
JOIN album a ON t.album_id = a.album_id
JOIN mus_album ma ON ma.album_id = a.album_id
JOIN musician m ON ma.musician_id = m.musician_id
WHERE musician_name = 'Within Temptation';

--Task 4--

--1--
SELECT album_name, COUNT(genre_name) FROM album a 
JOIN mus_album ma ON a.album_id = ma.album_id
JOIN musician m ON ma.musician_id = m.musician_id 
JOIN musician_genre mg ON m.musician_id = mg.musician_id 
JOIN music_genre g ON g.genre_id = mg.genre_id
GROUP BY album_name 
HAVING COUNT(genre_name) > 1;
--2--
SELECT track_name FROM track t
LEFT JOIN playlist p ON t.track_id = p.track_id
WHERE collection_id IS NULL;
--3--
SELECT musician_name, duration FROM track t
JOIN album a ON t.album_id = a.album_id
JOIN mus_album ma ON ma.album_id = a.album_id
JOIN musician m ON ma.musician_id = m.musician_id
WHERE duration = (SELECT min(duration) FROM track);
--4--
SELECT album_name, COUNT(track_name) track_count FROM album a
JOIN track t ON a.album_id = t.album_id
GROUP BY a.album_id
HAVING COUNT(track_name) = (  
	SELECT COUNT(track_name) FROM album
	JOIN track ON album.album_id = track.album_id
	GROUP BY album.album_id
	ORDER BY COUNT(track_name)
	LIMIT 1);
