--Create a user segment table that has column segment with stringset, segment description as string, segment criteria as stringset and segment status as String
create table user_segment (
	_id id,
	segement stringset, 
	segment_description string, 
	segment_criteria stringset, 
	segment_status string
) comment 'user segment table'

SHOW COLUMNS FROM user_segment

--Insert segment data
insert into user_segment values (1, ['Technology Enthusiasts'],'People interested in technology and the latest gadgets',['interest: technology', 'age >= 18' , 'age <= 35'], 'active');

insert into user_segment values (2,['Fitness' , 'Wellness'],'Individuals focused on fitness , maintaining a healthy lifestyle',['interest: fitness' , 'location: California'],'active');

insert into user_segment values (3, ['Travel Lovers'],'Passionate travelers looking for new destinations , experiences',['interest: travel' ,'income > 50000'],'active');

insert into user_segment values (4, ['Foodies'],'Food enthusiasts who appreciate diverse cuisines , dining experiences',['interest: food' ,'age >= 25'],'inactive');

insert into user_segment values (5, ['Fashionistas'],'Trendy individuals with a keen interest in fashion , style',['interest: fashion' ,'gender: female'],'active');

insert into user_segment values(6, ['Pet Owners'],'People who have pets , are interested in pet care products',['interest: pets' ,'location: New York'],'active');

insert into user_segment values(7, ['Outdoor Adventurers'],'Nature enthusiasts who enjoy outdoor activities , adventure sports',['interest: outdoor' ,'age >= 20' , 'age <= 40'],'active');

insert into user_segment values(8, ['Bookworms'],'Avid readers who enjoy various genres of books',['interest: books' ,'income > 30000'],'active');

insert into user_segment values(9, ['Art Enthusiasts'],'Individuals passionate about art, painting, creative expression',['interest: art' ,'age >= 25'],'active');

insert into user_segment values(10,['Music Lovers'],'People who have a deep appreciation for music across different genres',['interest: music' ,'gender: male'],'active');

insert into user_segment values(11,['Movie Buffs'],'Film enthusiasts who enjoy watching movies of different genres', ['interest: movies', 'age >= 18'], 'active');

insert into user_segment VALUES(12,['Health',  'Wellness'],'Individuals focused on improving their overall health and well-being', ['interest: wellness', 'income > 40000'],'active')

insert into user_segment VALUES(13,['Home Decor'], 'People interested in interior design and home decoration', ['interest: home', 'location: Texas'],'active')

insert into user_segment VALUES(14,['Green Living'],'Environmentally conscious individuals promoting sustainable and eco-friendly practices', ['interest: green', 'age >= 25'],'active')

insert into user_segment VALUES(15,['Advanture Travelers'],'Explorers seeking thrilling and adventurous travel experiences',['interest: Advanture', 'income > 60000'],'active')

insert into user_segment VALUES(16,['Parents' ,'Kids'],'Families with children looking for family-friendly activities and products',['interest: family', 'age >= 30'],'active')

insert into user_segment VALUES(17,['Gaming Enthusiasts'],'Passionate gamers interested in video games and gaming consoles', ['interest: gaming', 'location: California'],'active')

insert into user_segment VALUES(18,['Entrepreneurs'],'Aspiring entrepreneurs and business-minded individuals',['interest: entrepreneurship', 'age >= 18'],'active')

insert into user_segment VALUES(19,['Sports Fans'],'Sports enthusiasts who follow various sports and sporting events',['interest: sports', 'income > 50000'],'active')

insert into user_segment VALUES(20,['Home Chefs'],'Cooking enthusiasts who love experimenting with new recipes and ingredients', ['interest: cooking', 'age >= 25'],'active');

insert into user_segment VALUES(21,['Environment Activists'],'Individuals advocating for environmental conservation and sustainability',['interest: environment', 'location: Washington'],'active')

insert into user_segment VALUES(22, ['Car Enthusiasts'], 'Passionate car lovers interested in automobiles and car accessories',['interest: cars', 'income > 40000'], 'active')

insert into user_segment VALUES(23,['Technology Enthusiasts'],'People interested in technology and the latest gadgets',['interest: technology', 'age >= 18', 'age <= 35'],'active')

insert into user_segment VALUES(24,['Fitness', 'Wellness'],'Individuals focused on fitness and maintaining a healthy lifestyle',['interest: fitness', 'location: California'],'active')

insert into user_segment VALUES(26,['Travel Lovers'],'Passionate travelers looking for new destinations and experiences',['interest: travel', 'income > 50000'],'active')

insert into user_segment VALUES(27,['Foodies'],'Food enthusiasts who appreciate diverse cuisines and dining experiences',['interest: food' , 'age >= 25'],'inactive')

insert into user_segment VALUES(28,['Fashionistas'],'Trendy individuals with a keen interest in fashion and style',['interest: fashion', 'gender: female'],'active')

insert into user_segment VALUES(29,['Pet Owners'],'People who have pets and are interested in pet care products',['interest: pets', 'location: New York'],'active')

insert into user_segment VALUES(30,['Outdoor Adventurers'],'Nature enthusiasts who enjoy outdoor activities and adventure sports',['interest: outdoor','age >= 20', 'age <= 40'],'active')


--SELECT all user that age greater or equal to 18
SELECT * FROM user_segment
WHERE SETCONTAINS(segment_criteria, 'age >= 18')

--SELECT all Active user that age greater or equal to 18 and interest in technology 
SELECT * FROM user_segment
WHERE SETCONTAINSALL(segment_criteria, ['age >= 18', 'interest: technology'])
AND segment_status='active'

--SELECT all Active user that age greater or equal to 18 or interest in technology OR income greater than 50000
SELECT * FROM user_segment
WHERE SETCONTAINSANY(segment_criteria, ['age >= 18', 'interest: technology', 'income > 50000']) 
AND segment_status='active'

--Group by all Active user that age greater or equal to 18 or interest in technology OR income greater than 50000 by user segment and count the group by segment number;
SELECT segement, count(*) as cnt FROM user_segment
WHERE SETCONTAINSANY(segment_criteria, ['age >= 18', 'interest: technology', 'income > 50000']) 
AND segment_status='active'
group by segement;

--Group by all Active user that age greater or equal to 18 or interest in technology OR income greater than 50000 by user segment and count the group by segemnt and filter with count result greater or equal to 2 
SELECT segement, count(*) as cnt FROM user_segment
WHERE SETCONTAINSANY(segment_criteria, ['age >= 18', 'interest: technology', 'income > 50000']) 
AND segment_status='active'
group by segement
having count(*) >= 2;
