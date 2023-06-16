The data has been taken from Kaggle and it is available at this URL: https://www.kaggle.com/datasets/viktoriiashkurenko/278k-spotify-songs

The data sample have been uploaded online using the service transfer.sh: https://transfer.sh/

Sign in in Featurebase Cloud
Create a serverless database named "spotify"
Run FbSql locally

```
 fbsql --host="https://query.featurebase.com" \
  --email="acappelletti@molecula.com" \
  --password="<myPassword>"
```

Connect to the database

```
\c spotify
```

Add six workers

```
alter database spotify with units 6;
```

Create the table and insert the data for playlists

```
\i insert_playlists.sql
```

Create the table and insert the data for artists

```
\i insert_artists.sql
```

Create the table and insert the data for tracks

```
\i insert_tracks.sql
```
