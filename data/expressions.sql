-- create generations table
-- stores generations by name, includes a description and an upper and lower bound for birth year
-- _id: the name of the generation
-- description: the description of the generation
-- low_birth_year: the lower bound of the range of birth years for this genaration
-- high_birth_year: the upper bound of the range of birth years for this genaration
create table generations (_id string, description string, low_birth_year int, high_birth_year int);

-- insert into generations table
insert into generations (_id, description, low_birth_year, high_birth_year) values 
    ('Greatest', 'These folks were indelibly impacted by the Great Depression, which molded their children in regards to frugality. This group was also representative of the majority of soldiers in World War II.', 1901, 1924),
    ('Silent', 'Those born between these years are actually the smallest group, due to consequences from the Great Depression and World War II. Between the size of the population and the hesitancy to speak out against social issues due to the McCarthy era of government, they earned their name.', 1925, 1945),
    ('Baby Boomer', 'Baby boomers, along with Millennials, are one of the most misunderstood and mislabeled groups of the entire list. Countless internet jokes and videos of young people saying “Ok boomer!” in referencing an older person not understanding the modern world and how it works. The baby boomers are actually one of the most relevant groups in modern society as they were integral and present for many of the technology advances in the last 50 years. They have been more adaptable to modern growth and learning how to function in today’s technological age.', 1946, 1964),
    ('Generation X', 'As with Baby Boomers, Gen X’ers are the most relevant generation of modern times, in relation to technology and serve almost as a bridge from older populations to younger ones. They were present for the inception of the internet, video games, artificial intelligence and is the population that has created many of these advances.', 1965, 1979),
    ('Millenial', 'As mentioned, alongside of Gen X’ers, Millennials are greatly misunderstood and often mislabeled. Older folks can tend to blame someone younger for being a “Millennial” when they don’t understand the values of older times and hold the same views as they did when they were young.', 1980, 1994),
    ('Generation Z', 'This group of younger people is an interesting one. They have been exposed to social media, and were the first population to cope with cyber-bullying and other internet related issues, It was also during this time that school related violence and climate crisis have become more prevalent.', 1995, 2012),
    ('Gen Alpha', 'These are the youngest people in the Unites States and are the first group to be born in the 21st century. They are the first generation to be born to parents who grew up with the internet, cell phones, tablets and social media. They are also inclined to be the most racially diverse and the most technologically adept.', 2013, 2025);


select * from generations;

-- create person_data table
-- stores data about people 
-- _id: and integer id for each person
-- first_name: the first name of the person 
-- last_name: the last name of the person
-- gender: the gender of the person 
-- birth_day: the birth day (of the month) of the person
-- birth_month: the birth month (of the year) of the person
-- birth_year: the birth year of the person 
-- city: the city the person was born in
create table person_data (
    _id id, 
    first_name string, 
    last_name string, 
    gender string, 
    birth_day int, 
    birth_month int, 
    birth_year int, 
    city string);


insert into person_data (_id, first_name, last_name, gender, birth_day, birth_month, birth_year, city)
values
    (1, 'John', 'Doe', 'Male', 1, 1, 1990, 'New York'),
    (2, 'Jane', 'Smith', 'Female', 15, 4, 1985, 'Los Angeles'),
    (3, 'Michael', 'Johnson', 'Male', 10, 7, 1992, 'Chicago'),
    (4, 'Emily', 'Williams', 'Female', 3, 9, 1998, 'Houston'),
    (5, 'David', 'Brown', 'Male', 21, 2, 1993, 'Miami'),
    (6, 'Olivia', 'Jones', 'Female', 9, 12, 1989, 'New York'),
    (7, 'Daniel', 'Taylor', 'Male', 5, 6, 1991, 'Los Angeles'),
    (8, 'Sophia', 'Miller', 'Female', 18, 3, 1995, 'Chicago'),
    (9, 'Matthew', 'Anderson', 'Male', 27, 11, 1987, 'Houston'),
    (10, 'Ava', 'Martinez', 'Female', 14, 7, 1994, 'Miami'),
    (11, 'Andrew', 'Hernandez', 'Male', 2, 9, 1999, 'New York'),
    (12, 'Isabella', 'Lopez', 'Female', 12, 5, 1986, 'Los Angeles'),
    (13, 'Ethan', 'Gonzalez', 'Male', 25, 10, 1993, 'Chicago'),
    (14, 'Mia', 'Wilson', 'Female', 8, 8, 1997, 'Houston'),
    (15, 'James', 'Thomas', 'Male', 19, 6, 1992, 'Miami'),
    (16, 'Charlotte', 'Moore', 'Female', 7, 4, 1988, 'New York'),
    (17, 'Benjamin', 'Jackson', 'Male', 11, 2, 1996, 'Los Angeles'),
    (18, 'Amelia', 'Lee', 'Female', 28, 12, 1991, 'Chicago'),
    (19, 'Henry', 'Perez', 'Male', 4, 10, 1999, 'Houston'),
    (20, 'Evelyn', 'Martin', 'Female', 23, 9, 1987, 'Miami'),
    (21, 'Joseph', 'Thompson', 'Male', 17, 1, 1994, 'New York'),
    (22, 'Liam', 'White', 'Male', 29, 3, 1985, 'Los Angeles'),
    (23, 'Samantha', 'Harris', 'Female', 13, 11, 1992, 'Chicago'),
    (24, 'Aiden', 'Clark', 'Male', 6, 7, 1998, 'Houston'),
    (25, 'Victoria', 'Lewis', 'Female', 22, 5, 1993, 'Miami'),
    (26, 'Jackson', 'Young', 'Male', 16, 12, 1989, 'New York'),
    (27, 'Penelope', 'Walker', 'Female', 20, 2, 1991, 'Los Angeles'),
    (28, 'Gabriel', 'Hall', 'Male', 3, 9, 1995, 'Chicago'),
    (29, 'Layla', 'Allen', 'Female', 9, 11, 1987, 'Houston'),
    (30, 'Christopher', 'King', 'Male', 27, 7, 1994, 'Miami'),
    (31, 'Addison', 'Baker', 'Female', 5, 5, 1990, 'New York'),
    (32, 'Wyatt', 'Gomez', 'Male', 14, 1, 1996, 'Los Angeles'),
    (33, 'Natalie', 'Cook', 'Female', 24, 3, 1993, 'Chicago'),
    (34, 'Samuel', 'Murphy', 'Male', 1, 8, 1997, 'Houston'),
    (35, 'Grace', 'Rivera', 'Female', 11, 6, 1992, 'Miami'),
    (36, 'Ryan', 'Cooper', 'Male', 10, 4, 1988, 'New York'),
    (37, 'Chloe', 'Parker', 'Female', 19, 2, 1995, 'Los Angeles'),
    (38, 'Sebastian', 'Turner', 'Male', 8, 10, 1999, 'Chicago'),
    (39, 'Zoey', 'White', 'Female', 30, 9, 1987, 'Houston'),
    (40, 'Anthony', 'Edwards', 'Male', 24, 7, 1994, 'Miami'),
    (41, 'Hannah', 'Morris', 'Female', 13, 5, 1986, 'New York'),
    (42, 'Dominic', 'Ward', 'Male', 21, 3, 1991, 'Los Angeles'),
    (43, 'Lily', 'Turner', 'Female', 4, 11, 1998, 'Chicago'),
    (44, 'Leo', 'Collins', 'Male', 17, 8, 1993, 'Houston'),
    (45, 'Sophie', 'Bennett', 'Female', 22, 6, 1992, 'Miami'),
    (46, 'Jack', 'James', 'Male', 2, 4, 1989, 'New York'),
    (47, 'Avery', 'Reed', 'Female', 28, 2, 1995, 'Los Angeles'),
    (48, 'Owen', 'Sanders', 'Male', 12, 10, 1991, 'Chicago'),
    (49, 'Scarlett', 'Price', 'Female', 5, 12, 1997, 'Houston'),
    (50, 'Levi', 'Bell', 'Male', 15, 7, 1992, 'Miami'),
    (51, 'Elizabeth', 'Cook', 'Female', 9, 1, 1988, 'New York'),
    (52, 'Xavier', 'Watson', 'Male', 18, 3, 1996, 'Los Angeles'),
    (53, 'Mila', 'Rogers', 'Female', 27, 11, 1992, 'Chicago'),
    (54, 'Julian', 'Barnes', 'Male', 7, 9, 1998, 'Houston'),
    (55, 'Aria', 'Hill', 'Female', 20, 6, 1993, 'Miami'),
    (56, 'Lucas', 'Kelly', 'Male', 8, 5, 1989, 'New York'),
    (57, 'Stella', 'Carter', 'Female', 16, 2, 1991, 'Los Angeles'),
    (58, 'Henry', 'Wright', 'Male', 25, 12, 1995, 'Chicago'),
    (59, 'Bella', 'Murphy', 'Female', 3, 10, 1987, 'Houston'),
    (60, 'Christopher', 'Adams', 'Male', 19, 7, 1994, 'Miami'),
    (61, 'Victoria', 'Harris', 'Female', 11, 5, 1990, 'New York'),
    (62, 'Leo', 'Gonzalez', 'Male', 30, 1, 1996, 'Los Angeles'),
    (63, 'Scarlett', 'Clark', 'Female', 23, 3, 1993, 'Chicago'),
    (64, 'Samuel', 'Lewis', 'Male', 6, 8, 1997, 'Houston'),
    (65, 'Zoe', 'Lee', 'Female', 15, 6, 1992, 'Miami'),
    (66, 'Julian', 'Hall', 'Male', 5, 4, 1988, 'New York'),
    (67, 'Nora', 'Thompson', 'Female', 14, 2, 1995, 'Los Angeles'),
    (68, 'Elijah', 'White', 'Male', 25, 10, 1999, 'Chicago'),
    (69, 'Paisley', 'Turner', 'Female', 7, 11, 1987, 'Houston'),
    (70, 'David', 'Martin', 'Male', 23, 9, 1994, 'Miami'),
    (71, 'Lillian', 'Smith', 'Female', 12, 5, 1986, 'New York'),
    (72, 'Daniel', 'Hernandez', 'Male', 20, 3, 1991, 'Los Angeles'),
    (73, 'Eli', 'Lopez', 'Male', 2, 11, 1998, 'Chicago'),
    (74, 'Sofia', 'Taylor', 'Female', 16, 8, 1993, 'Houston'),
    (75, 'Joseph', 'Anderson', 'Male', 21, 6, 1992, 'Miami'),
    (76, 'Mila', 'Moore', 'Female', 9, 4, 1988, 'New York'),
    (77, 'Carter', 'Johnson', 'Male', 17, 2, 1995, 'Los Angeles'),
    (78, 'Avery', 'Jackson', 'Female', 28, 12, 1991, 'Chicago'),
    (79, 'Henry', 'Williams', 'Male', 4, 10, 1999, 'Houston'),
    (80, 'Emily', 'Brown', 'Female', 23, 9, 1987, 'Miami'),
    (81, 'Alexander', 'Thompson', 'Male', 17, 1, 1994, 'New York'),
    (82, 'Liam', 'White', 'Male', 29, 3, 1985, 'Los Angeles'),
    (83, 'Samantha', 'Harris', 'Female', 13, 11, 1992, 'Chicago'),
    (84, 'Aiden', 'Clark', 'Male', 6, 7, 1998, 'Houston'),
    (85, 'Victoria', 'Lewis', 'Female', 22, 5, 1993, 'Miami'),
    (86, 'Jackson', 'Young', 'Male', 16, 12, 1989, 'New York'),
    (87, 'Penelope', 'Walker', 'Female', 20, 2, 1991, 'Los Angeles'),
    (88, 'Gabriel', 'Hall', 'Male', 3, 9, 1995, 'Chicago'),
    (89, 'Layla', 'Allen', 'Female', 9, 11, 1987, 'Houston'),
    (90, 'Christopher', 'King', 'Male', 27, 7, 1994, 'Miami'),
    (91, 'Addison', 'Baker', 'Female', 5, 5, 1990, 'New York'),
    (92, 'Wyatt', 'Gomez', 'Male', 14, 1, 1996, 'Los Angeles'),
    (93, 'Natalie', 'Cook', 'Female', 24, 3, 1993, 'Chicago'),
    (94, 'Samuel', 'Murphy', 'Male', 1, 8, 1997, 'Houston'),
    (95, 'Grace', 'Rivera', 'Female', 11, 6, 1992, 'Miami'),
    (96, 'Ryan', 'Cooper', 'Male', 10, 4, 1988, 'New York'),
    (97, 'Chloe', 'Parker', 'Female', 19, 2, 1995, 'Los Angeles'),
    (98, 'Sebastian', 'Turner', 'Male', 8, 10, 1999, 'Chicago'),
    (99, 'Zoey', 'White', 'Female', 30, 9, 1987, 'Houston'),
    (100, 'Anthony', 'Edwards', 'Male', 24, 7, 1994, 'Miami');

select * from person_data;

