-- This file contains some SQL queries that you can use to explore the data with fbsql.

-- Find the most popular artists:
SELECT * FROM artists
ORDER BY artist_popularity DESC
LIMIT 10;

-- Find the most popular tracks:
SELECT * FROM tracks
ORDER BY popularity DESC
LIMIT 10;

-- Find the most popular playlists:
SELECT * FROM playlists
ORDER BY playlist_followers DESC
LIMIT 10;

-- Find the most popular playlists with more than 100 tracks:
SELECT * FROM playlists
WHERE n_tracks > 100
ORDER BY playlist_followers DESC
LIMIT 10;

-- Find playlists with more than 100 tracks and sort them by the number of followers in descending order:
SELECT * FROM playlists
WHERE n_tracks > 100
ORDER BY playlist_followers DESC;

-- Find the albums released in a specific year along with the total number of tracks in each album:
SELECT release_date, album_type, COUNT(*) AS track_count
FROM tracks
WHERE SUBSTRING(release_date, 1, 4) = '2022' -- Replace '2022' with the desired year
GROUP BY release_date, album_type;

-- Find comprehensive details of playlists, tracks, and associated artists by performing a join operation on the respective tables.
SELECT
    p.name AS playlist_name,
    p.description AS playlist_description,
    p.n_tracks AS playlist_tracks,
    p.playlist_followers AS playlist_followers,
    t.name AS track_name,
    t.popularity AS track_popularity,
    t.release_date AS track_release_date,
    a.artist_popularity AS artist_popularity,
    a.artist_followers AS artist_followers
FROM
    playlists p
    JOIN tracks t ON SETCONTAINS(t.playlist_uris, p.uri)
    JOIN artists a ON SETCONTAINS(t.artists_uris, a._id);

-- Find the average track and artist popularity, as well as the count of distinct tracks and artists, for each playlist.
SELECT
    p.name AS playlist_name,
    AVG(t.popularity) AS average_track_popularity,
    AVG(a.artist_popularity) AS average_artist_popularity,
    COUNT(DISTINCT t.name) AS distinct_track_count,
    COUNT(DISTINCT a._id) AS distinct_artist_count
FROM
    playlists p
    JOIN tracks t ON SETCONTAINS(t.playlist_uris, p.uri)
    JOIN artists a ON SETCONTAINS(t.artists_uris, a._id)
GROUP BY
    p.name;

-- Find the most popular artists by the average popularity of their tracks across all playlists.
SELECT
    a._id AS artist_id,
    a.artist_popularity AS artist_popularity,
    COUNT(DISTINCT p._id) AS playlist_count,
    AVG(t.popularity) AS average_track_popularity
FROM
    artists a
    JOIN tracks t ON SETCONTAINS(t.artists_uris, a._id)
    JOIN playlists p ON SETCONTAINS(t.playlist_uris, p.uri)
GROUP BY
    a._id, a.artist_popularity
HAVING
    COUNT(DISTINCT p._id) > 5
ORDER BY
    average_track_popularity DESC
LIMIT 10;

-- Find the most popular artists by the total number of followers across all playlists.
SELECT
    p.name AS playlist_name,
    t.name AS track_name,
    a._id AS artist_id,
    COUNT(DISTINCT t._id) AS track_count,
    SUM(a.artist_followers) AS total_artist_followers
FROM
    playlists p
    JOIN tracks t ON SETCONTAINS(t.playlist_uris, p.uri)
    JOIN artists a ON SETCONTAINS(t.artists_uris, a._id)
WHERE
    p.playlist_followers > 10000
GROUP BY
    p.name, t.name, a._id
HAVING
    COUNT(DISTINCT t._id) > 5
ORDER BY
    total_artist_followers DESC;

-- Find the most popular playlists by the average popularity of their tracks.
SELECT
    p.name AS playlist_name,
    COUNT(DISTINCT t._id) AS track_count,
    AVG(t.popularity) AS average_track_popularity,
    MAX(a.artist_followers) AS max_artist_followers
FROM
    playlists p
    JOIN tracks t ON SETCONTAINS(t.playlist_uris, p.uri)
    JOIN artists a ON SETCONTAINS(t.artists_uris, a._id)
WHERE
    p.n_tracks > 50
GROUP BY
    p.name
HAVING
    COUNT(DISTINCT t._id) > 10
ORDER BY
    max_artist_followers DESC
LIMIT 5;

-- Find the most popular playlists by the average popularity of their tracks, but only for playlists that contain tracks from a specific artist.
SELECT
    p.name AS playlist_name,
    COUNT(DISTINCT t._id) AS track_count,
    AVG(t.popularity) AS average_track_popularity,
    MAX(a.artist_followers) AS max_artist_followers
FROM
    playlists p
    JOIN tracks t ON SETCONTAINS(t.playlist_uris, p.uri)
    JOIN artists a ON SETCONTAINSANY(t.artists_uris, ['spotify:artist:0001wHqxbF2YYRQxGdbyER'])
WHERE
    p.playlist_followers > 10000
GROUP BY
    p.name
HAVING
    COUNT(DISTINCT t._id) > 10
ORDER BY
    max_artist_followers DESC;

-- Find the substrings of the first two characters of the name of each track.
SELECT
    _id,
    SUBSTRING(name, 1, 2) AS substr
FROM
    tracks;

-- Find the artists who have collaborated with the most number of other artists:
SELECT a1._id AS artist_id, COUNT(DISTINCT a2._id) AS collaborator_count
FROM artists a1
JOIN tracks t1 ON SETCONTAINS(t1.artists_uris, a1._id)
JOIN artists a2 ON SETCONTAINS(t1.artists_uris, a2._id) AND a1._id != a2._id
GROUP BY a1._id
ORDER BY collaborator_count DESC
LIMIT 10;

-- Find the artists with the highest average track popularity:
SELECT a._id AS artist_id, AVG(t.popularity) AS average_track_popularity
FROM artists a
JOIN tracks t ON SETCONTAINS(t.artists_uris, a._id)
GROUP BY a._id
ORDER BY average_track_popularity DESC
LIMIT 10;









