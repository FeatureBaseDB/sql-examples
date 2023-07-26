-- The SQLs in this file process the cutomer demographic data loaded into the following 2 tables:
-- table 1: CSEG
-- table 2: SKILLS

-- SKILLS table store the following information about customers:
    --skills 
    --job titles
    --availability for hire
-- During data load the mapping of skills and titles are switched and skills are loaded into titles and vice versa.
-- To fix this mapping error and to simplify the logic needed to determine employment status we create a view on this table.

create view skills_v as 
select id customer_id,
    setcontains(bools-exists,'available_for_hire') available_for_hire,  
    skills as titles, 
    titles as skills 
from skills;

--with this new view now we can get a summary count of customers by their titles. 
--In this query we also pivote the set field 'titles' into a list, so the counts are done at individual title level.
select titles, count(*) 
from skills_v with (flatten(titles)) 
group by titles;

--we can also get a summary count of customers by their skills
select skills, count(*) 
from skills_v with (flatten(titles)) 
group by skills;

--CSEG table stores the following customer information:
    --gender
    --age
    --location    
    --education
    --political affiliation
    --election participation
-- we can write aggregation queries on this table to extract 
-- summary counts of customers by segmentation rules.
-- for example the following query extracts summary of college educated customers by sex, age and city
select sex, age, city, count(*) 
from cseg cs 
where setcontains(education, 'Bachelor''s degree') 
group by sex, age, city;

-- if we want to extract the summary of college educated teachers who live in a 
-- certain target area the following query will do that
select sex, age, city, count(*) 
from cseg cs , skills_v sk
where setcontains(education, 'Bachelor''s degree') 
    and setcontainsany(zip_code, ['11111','22222','33333'] ) 
    and cs._id=sk.customer_id
    and setcontainsany(sk.titles, ['School Teacher', 'Educator']) 
group by sex, age, city;

-- if we want to extract the list of top locations with high density of educated 
-- and employeed residents the following query will do that
select zip_code, count(*) as cnt
from cseg cs with (flatten(zip_code)), 
    skills_v sk
where setcontains(education, 'Bachelor''s degree') 
    and setcontainsany(zip_code, ['11111','22222','33333'] ) 
    and cs._id=sk.customer_id
    and sk.available_for_hire=false
group by zip_code
order by cnt desc
limit 10;

-- if we want to extract average income by education the following query will do that
select education, avg(income), count(*) as cnt
from cseg cs with (flatten(education)), 
    skills_v sk
where cs._id=sk.customer_id
group by education;

-- if we want to extract skill levels by political party affiliation the following query will do that
select political_party_affiliation, sk.skills, count(*) as cnt
from cseg cs with(flatten(political_party_affiliation)), 
    skills_v sk with(flatten(skills)) 
where cs._id=sk.customer_id
group by political_party_affiliation, sk.skills;

-- if we want to extract the list of customers whose income is less than 
-- the average income for their location the following query will do that
select * 
from cseg o
where o.income <(select avg(i.income)
                from cseg i 
                where setcontainsany(i.zip_code, o.zip_code ) );
