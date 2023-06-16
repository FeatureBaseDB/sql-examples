-- Create table tracks
CREATE TABLE tracks (
    _id id,
    name STRING,
    artists_names STRINGSET,
    track_uri STRING,
    popularity int,
    album_type STRING,
    is_playable bool,
    release_date STRING,
    artists_uris STRINGSET,
    playlist_uris STRINGSET
);


-- Url of the dataset: https://transfer.sh/uEVnKIdpnx/final_tracks.csv
-- Insert data into tracks with a bulk insert by ingesting a csv file from an url

BULK INSERT
INTO tracks (_id, name, artists_names, track_uri, popularity, album_type, is_playable, release_date, artists_uris, playlist_uris)
MAP(0 id,
1 STRING,
2 STRINGSET,
3 STRING,
4 int,
5 STRING,
6 bool,
7 STRING,
8 STRINGSET,
9 STRINGSET)
FROM
    'https://transfer.sh/uEVnKIdpnx/final_tracks.csv'
WITH
    BATCHSIZE 100000
    FORMAT 'CSV'
    INPUT 'URL'
    HEADER_ROW;

-- Make sure the data is there by selecting the first row
SELECT * FROM tracks LIMIT 1;
