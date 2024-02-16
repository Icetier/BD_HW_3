--Task 2--

--1--
SELECT track_name, duration FROM track
ORDER BY duration DESC LIMIT 1;
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
WHERE track_name LIKE '%My%' or track_name LIKE '%Мой%';

--Task 3--

--1--

SELECT m.genre_name, COUNT(musician_id) FROM music_genre m
JOIN musician_genre p ON m.genre_id = p.genre_id
GROUP BY genre_name;

