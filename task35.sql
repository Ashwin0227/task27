-- Retrieve all movies along with their genres:


SELECT m.title, GROUP_CONCAT(g.genre_name) AS genres
FROM Movies m
JOIN Movie_Genres mg ON m.movie_id = mg.movie_id
JOIN Genres g ON mg.genre_id = g.genre_id
GROUP BY m.movie_id;

-- Retrieve all movies along with their media (videos or images):


SELECT m.title, mm.media_type, mm.file_url
FROM Movies m
JOIN Media mm ON m.movie_id = mm.movie_id;

-- Retrieve all reviews for a specific movie:


SELECT r.rating, r.review_text, u.username
FROM Reviews r
JOIN Users u ON r.user_id = u.user_id
WHERE r.movie_id = {movie_id};

-- Retrieve all artists who worked on a specific movie along with their roles:


SELECT a.artist_name, r.role_name
FROM Movie_Artists ma
JOIN Artists a ON ma.artist_id = a.artist_id
JOIN Roles r ON ma.role_id = r.role_id
WHERE ma.movie_id = {movie_id};

-- Retrieve all movies a specific artist has worked on:


SELECT m.title, GROUP_CONCAT(r.role_name) AS roles
FROM Movie_Artists ma
JOIN Movies m ON ma.movie_id = m.movie_id
JOIN Roles r ON ma.role_id = r.role_id
WHERE ma.artist_id = {artist_id}
GROUP BY m.movie_id;

-- Retrieve all artists who possess a specific skill:


SELECT a.artist_name, GROUP_CONCAT(s.skill_name) AS skills
FROM Artist_Skills ast
JOIN Artists a ON ast.artist_id = a.artist_id
JOIN Skills s ON ast.skill_id = s.skill_id
WHERE s.skill_name = '{skill_name}'
GROUP BY a.artist_id;