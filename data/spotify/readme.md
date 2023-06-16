# FbSql Spotify Setup

## Dataset

The data for this project has been taken from Kaggle and is available at this URL: [278k Spotify Songs](https://www.kaggle.com/datasets/viktoriiashkurenko/278k-spotify-songs).

## Serverless Database Setup

1. Sign in to [Featurebase Cloud](https://www.featurebase.com) using your credentials.

2. Create a serverless database named "spotify" in Featurebase Cloud.

## Installation and Configuration

1. Install FbSql locally on your machine.

2. Open your terminal or command prompt and run the following command to connect to Featurebase Cloud using FbSql:

   ```shell
   fbsql --host="https://query.featurebase.com" --email="acappelletti@molecula.com" --password="<yourPassword>"
   ```

3. Once connected, use the following command to connect to the "spotify" database:
   ```shell
   \c spotify
   ```
4. After connecting to the "spotify" database, increase the number of workers to six for better performance:
   ```shell
   alter database spotify with units 6;
   ```

## Data Import

1. Download the dataset from Kaggle: [278k Spotify Songs](https://www.kaggle.com/datasets/viktoriiashkurenko/278k-spotify-songs).

2. Upload the dataset to an online file-sharing service like [transfer.sh](https://transfer.sh/).

3. Use the provided SQL files (`insert_playlists.sql`, `insert_artists.sql`, `insert_tracks.sql`) to create and populate the respective tables:

   ```shell
   \i insert_playlists.sql
   \i insert_artists.sql
   \i insert_tracks.sql
   ```

## Running Queries

To run the queries, execute the `queries.sql` file:

```shell
\i queries.sql
```
