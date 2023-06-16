-- Create table playlists
CREATE TABLE playlists (
    _id id,
    uri STRING,
    name STRING,
    description STRING,
    spotify_query STRING,
    author STRING,
    n_tracks int,
    playlist_followers int
);

-- Url of the dataset: https://transfer.sh/csCuCE2FTO/final_playlists.csv
-- Insert data into playlists

BULK INSERT
INTO playlists (_id, uri, name, description, spotify_query, author, n_tracks, playlist_followers)
MAP(0 id,
1 STRING,
2 STRING,
3 STRING,
4 STRING,
5 STRING,
6 int,
7 int)
FROM
    'https://transfer.sh/csCuCE2FTO/final_playlists.csv'
WITH
    BATCHSIZE 100000
    FORMAT 'CSV'
    INPUT 'URL'
    HEADER_ROW;

-- Make sure the data is there
SELECT * FROM playlists LIMIT 1;