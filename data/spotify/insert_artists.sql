-- Create table artists
CREATE TABLE artists (
    _id STRING,
    artist_popularity int,
    artist_genres STRINGSET,
    artist_followers int
);

-- Url of the dataset: https://transfer.sh/qQDFEMJ3ij/artists.csv
-- Insert data into artists with a bulk insert by ingesting a csv file from an url

BULK INSERT
INTO artists (_id, artist_popularity, artist_genres, artist_followers)
MAP(0 STRING,
1 int,
2 STRINGSET,
3 int)
FROM
    'https://transfer.sh/qQDFEMJ3ij/artists.csv'
WITH
    BATCHSIZE 100000
    FORMAT 'CSV'
    INPUT 'URL'
    HEADER_ROW;

-- Make sure the data is there by selecting the first row
SELECT * FROM artists LIMIT 1;