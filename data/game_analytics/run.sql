-- create game_users
-- _id: a unique string identifier for a particular user, a player in a live service game
-- username: the plater's username
-- gender: the player's gender
-- total_currency_spent: how much money that user has spent on the live service game since signup
-- signed_up_at: epoch timestamp of when the user signed up
-- last_login_at: epoch timestamp of when the user last logged in
create table game_users (_id string, username string, gender string, total_currency_spent decimal(2), signed_up_at timestamp, last_login_at timestamp) comment 'game player user data';

  -- create game_user_sessions
  -- _id: a unique string identifier for a session
  -- user_id: the UUID string of the user
  -- ip_address: the user's ipv4 address
  -- started_at: epoch timestamp of when the user started playing
  -- ended_at: epoch timestamp of when the user finished playing
create table game_user_sessions (_id string, user_id string, ip_address string, started_at timestamp, ended_at timestamp) comment 'game player session data';

  -- create game_events
  -- _id: a unique integer identifier for an event (admin-created)
  -- name: a human-readable name for the event
  -- description: a brief, human readable description that explains exactly what is happening when this event is fired
create table game_events (_id id, name string, description string) comment 'game event data';

  -- create game_user_events
  -- _id: a unique integer identifier for an event (admin-created)
  -- name: a human-readable name for the event
  -- description: a brief, human readable description that explains exactly what is happening when this event is fired
create table game_user_events (_id string, user_id string, event_id id, event_fired_at timestamp) comment 'game player event data';

  -- fill game_users with fake user data
BULK INSERT
  INTO game_users (_id, username, gender, total_currency_spent, signed_up_at, last_login_at )
  MAP(0 STRING,
  1 STRING,
  2 STRING,
  3 DECIMAL(2),
  4 TIMESTAMP,
  5 TIMESTAMP )
  FROM
      'https://featurebase-sql-public-game-analytics-example.s3.us-east-2.amazonaws.com/game_users.MOCK_DATA.csv'
  WITH
      BATCHSIZE 1000
      FORMAT 'CSV'
      INPUT 'URL';

  -- fill game_user_sessions with fake session data
BULK INSERT
  INTO game_user_sessions (_id, user_id, ip_address, started_at, ended_at )
  MAP(0 STRING,
  1 STRING,
  2 STRING,
  3 TIMESTAMP,
  4 TIMESTAMP )
  FROM
      'https://featurebase-sql-public-game-analytics-example.s3.us-east-2.amazonaws.com/game_user_sessions.MOCK_DATA.csv'
  WITH
      BATCHSIZE 1000
      FORMAT 'CSV'
      INPUT 'URL';

  -- fill game_events with fake event data
BULK INSERT
  INTO game_events (_id, name, description )
  MAP(0 ID,
  1 STRING,
  2 STRING )
  FROM
      'https://featurebase-sql-public-game-analytics-example.s3.us-east-2.amazonaws.com/game_events.MOCK_DATA.csv'
  WITH
      BATCHSIZE 1000
      FORMAT 'CSV'
      INPUT 'URL';

  -- fill game_user_events with fake event data
BULK INSERT
  INTO game_user_events (_id, user_id, event_id, event_fired_at )
  MAP(0 STRING,
  1 STRING,
  2 INT,
  3 TIMESTAMP)
  FROM
      'https://featurebase-sql-public-game-analytics-example.s3.us-east-2.amazonaws.com/game_user_events.MOCK_DATA.csv'
  WITH
      BATCHSIZE 1000
      FORMAT 'CSV'
      INPUT 'URL';

-- How many sessions have players done in the last month?
-- Group by user
SELECT t1.username, COUNT(t1.username) AS total_sessions
      FROM game_users AS t1
      INNER JOIN game_user_sessions AS t2 ON t1._id = t2.user_id
      WHERE started_at > DATETIMEADD('m', -1, current_timestamp)
  GROUP BY t1.username;

-- How many times have players quit in the last month
-- group by user
SELECT user_id, COUNT(*) AS total_quits
    FROM game_user_events
    WHERE event_id = 6 AND event_fired_at > DATETIMEADD('m', -1, current_timestamp)
GROUP BY user_id;

-- event_id 6 MEANS the player made a purchase.
-- how many purchases have been made in the last month?
SELECT user_id, COUNT(event_id) FROM game_user_events WHERE event_id = 6 GROUP BY user_id;

\qecho Finished running game analytics queries.
