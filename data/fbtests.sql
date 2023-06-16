-- This file was generated from the TestPrintTests test in featurebase/sql3/test/test_test.go

-- The following block of queries is for a test named minmaxnegatives
-- First we'll create a table.
CREATE TABLE minmaxnegatives (_id id,positive_int int min 10 max 100,negative_int int min -100 max -10);
-- Insert some data into the created table.
INSERT INTO minmaxnegatives VALUES (1,11,-11),(2,22,-22),(3,33,-33);
select * from minmaxnegatives;


-- The following block of queries is for a test named unkeyed
-- First we'll create a table.
CREATE TABLE unkeyed (_id id,an_int int min 0 max 100,an_id_set idset,an_id id,a_string string,a_string_set stringset,a_decimal decimal(2));
-- Insert some data into the created table.
INSERT INTO unkeyed VALUES (1,11,[11,12,13],101,'str1',['a1','b1','c1'],123.45),(2,22,[21,22,23],201,'str2',['a2','b2','c2'],234.56),(3,33,[31,32,33],301,'str3',['a3','b3','c3'],345.67),(4,44,[41,42,43],401,'str4',['a4','b4','c4'],456.78);
select * from unkeyed;
select _id, an_int, an_id_set, an_id, a_string, a_string_set, a_decimal from unkeyed;
select top(2) * from unkeyed;
select * from unkeyed where an_int = 22;
select * from unkeyed where a_string = 'str2';
select * from unkeyed where an_id = 201;


-- The following block of queries is for a test named keyed
-- First we'll create a table.
CREATE TABLE keyed (_id string,an_int int min 0 max 100,an_id_set idset,an_id id,a_string string,a_string_set stringset);
-- Insert some data into the created table.
INSERT INTO keyed VALUES ('one',11,[11,12,13],101,'str1',['a1','b1','c1']),('two',22,[11,12,23],201,'str2',['a2','b2','c2']),('three',33,[11,32,33],301,'str3',['a3','b3','c3']),('four',44,[41,42,43],401,'str4',['a4','b4','c4']);
select * from keyed;
select _id, an_int, an_id_set, an_id, a_string, a_string_set from keyed;
select top(2) * from keyed;
select * from keyed where an_int = 22;
select * from keyed where a_string = 'str2';
select * from keyed where an_id = 201;


-- The following block of queries is for a test named table-with-hyphens
-- First we'll create a table.
CREATE TABLE un-keyed (_id id,an_int int min 0 max 100,an_id_set idset,an_id id,a_string string,a_string_set stringset,a_decimal decimal(2));
-- Insert some data into the created table.
INSERT INTO un-keyed VALUES (1,11,[11,12,13],101,'str1',['a1','b1','c1'],123.45),(2,22,[21,22,23],201,'str2',['a2','b2','c2'],234.56),(3,33,[31,32,33],301,'str3',['a3','b3','c3'],345.67),(4,44,[41,42,43],401,'str4',['a4','b4','c4'],456.78);
select * from un-keyed;
select _id, an_int, an_id_set, an_id, a_string, a_string_set, a_decimal from un-keyed;
select *, an_int AS foo from un-keyed where _id = 1;


-- The following block of queries is for a test named selectKeyedTests
-- First we'll create a table.
CREATE TABLE selectkeyed (_id string,an_int int min 0 max 100,an_id_set idset,an_id id,a_string string,a_string_set stringset,a_decimal decimal(2));
-- Insert some data into the created table.
INSERT INTO selectkeyed VALUES ('user1',11,[11,12,13],101,'str1',['a1','b1','c1'],123.45),('user2',22,[21,22,23],201,'str2',['a2','b2','c2'],234.56),('user3',33,[31,32,33],301,'str3',['a3','b3','c3'],345.67),('user4',44,[41,42,43],401,'str4',['a4','b4','c4'],456.78);
select * from selectkeyed where _id = 'user1';


-- The following block of queries is for a test named select-having
-- First we'll create a table.
CREATE TABLE having_test (_id id,an_int int min 0 max 100,an_id_set idset,an_id id,a_string string,a_string_set stringset,a_decimal decimal(2));
-- Insert some data into the created table.
INSERT INTO having_test VALUES (1,11,[11,12,13],101,'str1',['a1','b1','c1'],123.45),(2,22,[21,22,23],201,'str2',['a2','b2','c2'],234.56),(3,33,[31,32,33],301,'str3',['a3','b3','c3'],345.67),(4,44,[41,42,43],401,'str4',['a4','b4','c4'],456.78),(5,11,[11,12,13],101,'str1',['a5','b5','c5'],567.89);
select count(an_int), an_int from having_test group by an_int having count(an_int) = 1;
select an_int from having_test group by an_int having count(an_int) = 1;
select count(*), an_int from having_test group by an_int having count(*) > 1;
select an_int from having_test group by an_int having count(*) > 1;
select sum(a_decimal), an_int from having_test group by an_int having sum(a_decimal) < 250.00;
select sum(an_int), an_int from having_test group by an_int having sum(an_int) < 25;
select a_string, count(*) from having_test group by a_string having count(*) > 1;


-- The following block of queries is for a test named selectBetweenTests
-- First we'll create a table.
CREATE TABLE selectbetween (_id string,an_int int min 0 max 100);
-- Insert some data into the created table.
INSERT INTO selectbetween VALUES ('user1',11),('user2',22),('user3',33),('user4',44);
select _id,an_int from selectbetween where an_int between 22 AND 33;
select _id,an_int from selectbetween where an_int between 22 AND 33 AND _id = 'user2';


-- The following block of queries is for a test named selectwithInTests
-- First we'll create a table.
CREATE TABLE selectwithIn (_id string,an_int int min 0 max 100);
-- Insert some data into the created table.
INSERT INTO selectwithIn VALUES ('1',11),('2',22),('3',33),('4',44);
select _id,an_int from selectwithIn where _id in ('2', '3');


-- The following block of queries is for a test named causeproblemstest
-- First we'll create a table.
CREATE TABLE problems (_id id,i1 int,s1 string,is1 idset,ts timestamp);
-- Insert some data into the created table.
INSERT INTO problems VALUES (1,11,'eleven',[1,1],1993432),(2,12,'twelve',[1,2],124836),(3,13,'thirteen',[1,3],3247623945);
-- From the following (commented) query, we would expect to get an error like "column 'i1' invalid in the having clause because it is not contained in an aggregate or the GROUP BY clause"
-- select i1, count(s1) from problems group by s1 having i1 > 12;
-- From the following (commented) query, we would expect to get an error like "column 'i1' invalid in select list because it is not aggregated or grouped"
-- select i1, count(s1) from problems group by s1;
-- From the following (commented) query, we would expect to get an error like "operator '+' incompatible with type 'string'"
-- select i1 + s1 from problems;
-- From the following (commented) query, we would expect to get an error like "integer, decimal, timestamp or string expression expected"
-- select min(is1) from problems;
-- From the following (commented) query, we would expect to get an error like "function 'feegle' not found"
-- select feegle (select i1 from problems);
-- From the following (commented) query, we would expect to get an error like "invalid value 'mt' for parameter 'timeunit'"
-- select datetimediff ('mt', 19966354, 32948342);
-- From the following (commented) query, we would expect to get an error like "output value out of range"
-- select datetimediff ('ns', 0, 9223372036854775807);
-- From the following (commented) query, we would expect to get an error like "operator 'AND' incompatible with type 'string'"
-- select 'asd' AND 'fgh';
-- From the following (commented) query, we would expect to get an error like "operator '=' incompatible with type 'tuple(int, array(int))'"
-- select {45423523, [1, 2]} = {343453, [1, 2]};
-- From the following (commented) query, we would expect to get an error like "incompatible types 'id' and 'timestamp' used as range subscripts"
-- select * from problems a where a.i1 between a._id and a.ts;
-- From the following (commented) query, we would expect to get an error like "types 'id' and 'float' do not match"
-- select _id + 15.00 from problems;


-- The following block of queries is for a test named filter_predicates
-- First we'll create a table.
CREATE TABLE filter_predicates (_id id,i1 int,b1 bool,id1 id,ids1 idset,d1 decimal(2),s1 string,ss1 stringset,ts1 timestamp);
-- Insert some data into the created table.
INSERT INTO filter_predicates VALUES (1,10,false,1,[10,20,30],10.00,'10',['10','20','30'],'2001-11-01T22:08:41+00:00'),(2,20,true,2,[11,21,31],20.00,'20',['11','21','31'],'2002-11-01T22:08:41+00:00'),(3,30,false,3,[12,22,32],30.00,'30',['12','22','32'],'2003-11-01T22:08:41+00:00'),(4,40,false,4,[10,20,30],40.00,'40',['10','20','30'],'2004-11-01T22:08:41+00:00'),(5,50,true,5,[11,21,31],50.00,'50',['11','21','31'],'2005-11-01T22:08:41+00:00'),(6,60,false,6,[12,22,32],60.00,'60',['12','22','32'],'2006-11-01T22:08:41+00:00');


-- The following block of queries is for a test named table-0
select _id from filter_predicates where _id != 1;
select _id from filter_predicates where _id = 1;
select _id from filter_predicates where _id > 5;
select _id from filter_predicates where _id >= 5;
select _id from filter_predicates where _id < 2;
select _id from filter_predicates where _id <= 2;


-- The following block of queries is for a test named table-0
select _id from filter_predicates where id1 != 1;
select _id from filter_predicates where id1 = 1;
select _id from filter_predicates where id1 > 5;
select _id from filter_predicates where id1 >= 5;
select _id from filter_predicates where id1 < 2;
select _id from filter_predicates where id1 <= 2;


-- The following block of queries is for a test named table-0
select _id from filter_predicates where i1 != 10;
select _id from filter_predicates where i1 = 10;
select _id from filter_predicates where i1 > 50;
select _id from filter_predicates where i1 >= 50;
select _id from filter_predicates where i1 < 20;
select _id from filter_predicates where i1 <= 20;


-- The following block of queries is for a test named table-0
select _id from filter_predicates where b1 != true;
select _id from filter_predicates where b1 = true;


-- The following block of queries is for a test named table-0
select _id from filter_predicates where ts1 != '2001-11-01T22:08:41+00:00';
select _id from filter_predicates where ts1 = '2001-11-01T22:08:41+00:00';
select _id from filter_predicates where ts1 > '2005-11-01T22:08:41+00:00';
select _id from filter_predicates where ts1 >= '2005-11-01T22:08:41+00:00';
select _id from filter_predicates where ts1 < '2002-11-01T22:08:41+00:00';
select _id from filter_predicates where ts1 < '2002-11-01T22:08:41Z';
select _id from filter_predicates where ts1 <= '2002-11-01T22:08:41+00:00';


-- The following block of queries is for a test named table-0
select _id from filter_predicates where d1 != 10.00;
select _id from filter_predicates where d1 = 10.00;
select _id from filter_predicates where d1 > 50.00;
select _id from filter_predicates where d1 >= 50.00;
select _id from filter_predicates where d1 < 20.00;
select _id from filter_predicates where d1 <= 20.00;


-- The following block of queries is for a test named table-0
select _id from filter_predicates where s1 != '10';
select _id from filter_predicates where s1 = '10';


-- The following block of queries is for a test named orderByTests
-- First we'll create a table.
CREATE TABLE order_by_test (_id id,an_int int min 0 max 100,an_id_set idset,an_id id,a_string string,a_string_set stringset,a_decimal decimal(2));
-- Insert some data into the created table.
INSERT INTO order_by_test VALUES (1,44,[11,12,13],101,'str1',['a1','b1','c1'],123.45),(2,33,[21,22,23],201,'str2',['a2','b2','c2'],234.56),(3,21,[31,32,33],301,'str3',['a3','b3','c3'],345.67),(4,10,[41,42,43],401,'str4',['a4','b4','c4'],456.78);
-- From the following (commented) query, we would expect to get an error like "unable to sort a column of type 'stringset'"
-- select * from order_by_test order by a_string_set asc;
-- From the following (commented) query, we would expect to get an error like "unable to sort a column of type 'idset'"
-- select * from order_by_test order by an_id_set asc;
select an_int from order_by_test order by an_id asc;
select an_int, an_id from order_by_test order by a_decimal asc;
select an_int + 1 as foo, an_id from order_by_test order by foo asc, a_decimal asc;
select an_int from order_by_test order by an_int asc;
select an_int as foo from order_by_test order by foo asc;
select an_int as foo from order_by_test order by 1 asc;
select an_int + 1 from order_by_test order by 1 asc;
select an_int + 1 as bar from order_by_test order by bar desc;


-- The following block of queries is for a test named distinct_test
-- First we'll create a table.
CREATE TABLE distinct_test (_id id,i1 int,b1 bool,id1 id,ids1 idset,d1 decimal(2),s1 string,ss1 stringset,ts1 timestamp);
-- Insert some data into the created table.
INSERT INTO distinct_test VALUES (1,10,false,1,[10,20,30],10.00,'10',['10','20','30'],'2012-11-01T22:08:41Z'),(2,20,true,2,[11,21,31],20.00,'20',['11','21','31'],'2012-11-01T22:08:41Z'),(3,30,false,3,[12,22,32],30.00,'30',['12','22','32'],'2012-11-01T22:08:41Z'),(4,10,false,1,[10,20,30],10.00,'10',['10','20','30'],'2012-11-01T22:08:41Z'),(5,20,true,2,[11,21,31],20.00,'20',['11','21','31'],'2012-11-01T22:08:41Z'),(6,30,false,3,[12,22,32],30.00,'30',['12','22','32'],'2012-11-01T22:08:41Z');
select distinct i1, b1, id1 from distinct_test;
select distinct i1 from distinct_test;
select distinct b1 from distinct_test;
select distinct id1 from distinct_test;
select distinct ids1 from distinct_test;
select distinct d1 from distinct_test;
select distinct s1 from distinct_test;
select distinct ss1 from distinct_test;
select distinct ts1 from distinct_test;


-- The following block of queries is for a test named selectTStoreTests
create table tstoretest (_id id, i1 int, v1 varchar(3));
insert into tstoretest values (1, 1, 'foo');
select * from tstoretest;
create table tstoretestvec (_id id, i1 int, v1 varchar(3), v2 vector(3));
insert into tstoretestvec values (1, 1, 'foo', [10.0, 11.0, 12.0]);


-- The following block of queries is for a test named subquerytable
-- First we'll create a table.
CREATE TABLE subquerytable (_id id,a_string string);
-- Insert some data into the created table.
INSERT INTO subquerytable VALUES (1,'str1'),(2,'str1'),(3,'str2'),(4,'str2'),(5,'str3');
select sum(mycount) as thecount from (select count(a_string) as mycount, a_string from subquerytable group BY a_string);
select sum(mycount) as thecount from (select count(distinct a_string) as mycount, a_string from subquerytable group BY a_string);


-- The following block of queries is for a test named viewtests
-- First we'll create a table.
CREATE TABLE viewtable (_id id,a_string string,a_int int,a_date timestamp);
-- Insert some data into the created table.
INSERT INTO viewtable VALUES (1,'str1',10,'1970-01-01T00:00:00Z'),(2,'str1',20,'1970-01-01T00:00:00Z'),(3,'str2',30,'1970-01-01T00:00:00Z'),(4,'str2',40,'1970-01-01T00:00:00Z'),(5,'str3',50,'1970-01-01T00:00:00Z');
-- From the following (commented) query, we would expect to get an error like "table or view 'viewtable' already exists"
-- create view viewtable as select _id, a_string, a_int from viewtable;
create view viewonviewtable as select _id, a_string, a_int from viewtable;
-- From the following (commented) query, we would expect to get an error like "view 'viewonviewtable' already exists"
-- create view viewonviewtable as select _id, a_string, a_int from viewtable;
create view if not exists viewonviewtable as select _id, a_string, a_int from viewtable;
select * from viewonviewtable;
select _id, a_string, a_int from viewonviewtable;
alter view viewonviewtable as select _id, a_string, a_int from viewtable where a_int > 20;
select * from viewonviewtable;
select _id, a_string, a_int from viewonviewtable;
drop view viewonviewtable;
drop view if exists viewonviewtable;
-- From the following (commented) query, we would expect to get an error like "table or view 'viewonviewtable' not found"
-- select * from viewonviewtable;
create view if not exists viewwithliteral as select _id, a_string, a_int, a_date from viewtable where a_date<CURRENT_TIMESTAMP or a_date<CURRENT_DATE or a_date<'2023-03-15T00:00:00Z';
select * from viewwithliteral;
select _id, a_string, a_int, a_date from viewwithliteral;


-- The following block of queries is for a test named top-limit-tests
-- First we'll create a table.
CREATE TABLE skills (_id id,bools stringset,bools-exist stringset,id1 id,skills stringset,titles stringset);
-- Insert some data into the created table.
INSERT INTO skills VALUES (1,null,['available_for_hire'],288,['Marketing Manager'],['OEM negotiations','Alumni Relations']),(2,null,['available_for_hire'],288,['Software Engineer I'],['Chief Cook','Bottle Washer']);
select top(1) * from skills where setcontains(skills, 'Marketing Manager');
select * from skills where setcontains(skills, 'Marketing Manager') limit 1;
select top(10) count(*), skills from skills group by skills;
select count(*), skills from skills group by skills limit 10;
select top(1) count(*) from skills;
select count(*) from skills limit 1;
-- From the following (commented) query, we would expect to get an error like "TOP and LIMIT cannot cannot be used at the same time"
-- select top(1) count(*) from skills limit 1;


-- The following block of queries is for a test named delete_tests
-- First we'll create a table.
CREATE TABLE del_all_types (_id id,i1 int min 0 max 1000,b1 bool,d1 decimal(2),id1 id,ids1 idset,s1 string,ss1 stringset,t1 timestamp);
-- Insert some data into the created table.
INSERT INTO del_all_types VALUES (1,1000,true,12.34,20,[101,102],'foo',['101','102'],'2022-05-05T13:00:00Z'),(2,1000,true,12.34,20,[101,102],'foo',['101','102'],'2022-05-05T13:00:00Z'),(3,1000,true,12.34,20,[101,102],'foo',['101','102'],'2022-05-05T13:00:00Z'),(4,1000,true,12.34,20,[101,102],'foo',['101','102'],'2022-05-05T13:00:00Z'),(5,1000,true,12.34,20,[101,102],'foo',['101','102'],'2022-05-28T13:00:00Z');
delete from del_all_types where _id = 1;
select _id from del_all_types where _id = 1;
delete from del_all_types where _id in (2, 3);
select _id from del_all_types where _id = 2 or _id = 3;
create table sub_query (_id id, i1 int min 0 max 1000);
insert into sub_query values (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6);
delete from del_all_types where _id in (select _id from sub_query where i1 > 3) and i1 > 10;
select _id from del_all_types where _id > 4;
insert into del_all_types 
				 values
					(1,1000,true,12.34,20,[101,102],'foo',['101','102'],'2010-01-01T00:00:00Z'),
					(2,1000,true,12.34,20,[101,102],'foo',['101','102'],'2012-11-01T22:08:41Z'),
					(3,1000,true,12.34,20,[101,102],'foo',['101','102'],'2012-11-01T22:08:41Z'),
					(4,1000,true,12.34,20,[101,102],'foo',['101','102'],'2020-01-01T00:00:00Z');
delete from del_all_types where t1 > '2010-01-01T00:00:00Z';
select _id from del_all_types where _id > 1;
insert into del_all_types 
				 values
					(1,100,true,12.34,20,[101,102],'foo',['101','102'],'2010-01-01T00:00:00Z'),
					(2,200,true,12.34,20,[101,102],'foo',['101','102'],'2012-11-01T22:08:41Z'),
					(3,300,true,12.34,20,[101,102],'foo',['101','102'],'2012-11-01T22:08:41Z'),
					(4,400,true,12.34,20,[101,102],'foo',['101','102'],'2020-01-01T00:00:00Z');
delete from del_all_types where i1 > 200;
select _id from del_all_types where i1 > 200;
delete from del_all_types where i1 < 300;
select _id from del_all_types;
insert into del_all_types 
				 values
					(1,100,true,12.34,20,[101,102],'foo',['101','102'],'2010-01-01T00:00:00Z'),
					(2,200,true,12.34,20,[101,102],'foo',['101','102'],'2012-11-01T22:08:41Z'),
					(3,300,true,12.34,20,[101,102],'foo',['101','102'],'2012-11-01T22:08:41Z'),
					(4,400,true,12.34,20,[101,102],'foo',['101','102'],'2020-01-01T00:00:00Z');
delete from del_all_types where b1 = true;
select _id from del_all_types;
insert into del_all_types 
				 values
					(1,100,true,12.34,20,[101,102],'foo',['101','102'],'2010-01-01T00:00:00Z'),
					(2,200,true,12.34,20,[101,102],'foo',['101','102'],'2012-11-01T22:08:41Z'),
					(3,300,true,12.34,20,[101,102],'foo',['101','102'],'2012-11-01T22:08:41Z'),
					(4,400,true,12.34,20,[101,102,103],'foo',['101','102'],'2020-01-01T00:00:00Z');
delete from del_all_types where setcontains(ids1, 103);
select _id from del_all_types where _id = 4;
insert into del_all_types 
				values
					(1,100,true,12.34,20,[101,102],'foo',['101','102'],'2010-01-01T00:00:00Z'),
					(2,200,true,12.35,20,[101,102],'foo',['101','102'],'2012-11-01T22:08:41Z'),
					(3,300,true,12.36,20,[101,102],'foo',['101','102'],'2012-11-01T22:08:41Z'),
					(4,400,true,12.37,20,[101,102,103],'foo',['101','102'],'2020-01-01T00:00:00Z');
delete from del_all_types where d1 = 12.36 and i1 = 300;
select _id from del_all_types where _id = 3;
delete from del_all_types where d1 = 12.34 or i1 = 200;
select _id from del_all_types where _id = 1 or _id = 2;
insert into del_all_types 
				 values
					(1,100,true,12.34,20,[101,102],'foo',['101','102'],'2010-01-01T00:00:00Z'),
					(2,200,true,12.35,20,[101,102],'bar',['101','102'],'2012-11-01T22:08:41Z'),
					(3,300,true,12.36,20,[101,102],'zoo',['101','102'],'2012-11-01T22:08:41Z'),
					(4,400,true,12.37,20,[101,102,103],'raz',['101','102','103'],'2020-01-01T00:00:00Z');
delete from del_all_types where substring(s1, 0, 1) = 'f';
select _id from del_all_types where _id = 1;
insert into del_all_types 
				 values
					(1,100,true,12.34,20,[101,102],'foo',['101','102'],'2010-01-01T00:00:00Z'),
					(2,200,true,12.34,20,[101,102],'foo',['101','102'],'2012-11-01T22:08:41Z'),
					(3,300,true,12.34,20,[101,102],'foo',['101','102'],'2012-11-01T22:08:41Z'),
					(4,400,true,12.34,20,[101,102],'foo',['101','102'],'2020-01-01T00:00:00Z');
delete from del_all_types;
select _id from del_all_types;
-- From the following (commented) query, we would expect to get an error like "error DELETEing from 'fb_views' (system tables cannot be DELETEd from)"
-- delete from fb_views;


-- The following block of queries is for a test named selectwithsetliterals
-- First we'll create a table.
CREATE TABLE selectwithsetliterals (_id id,a int min 0 max 1000,b int min 0 max 1000,event stringset,ievent idset);
-- Insert some data into the created table.
INSERT INTO selectwithsetliterals VALUES (1,10,100,['POST'],null),(2,20,200,['GET'],null),(3,30,300,['GET','POST'],[101]);
select _id, setcontains(event, 'POST') from selectwithsetliterals;
select _id, setcontainsall(event, ['POST']) from selectwithsetliterals;
select _id, setcontainsany(event, ['POST', 'DELETE']) from selectwithsetliterals;
select _id, setcontains(ievent, 101) from selectwithsetliterals;
select _id, setcontainsall(ievent, [101]) from selectwithsetliterals;
select _id, setcontainsany(ievent, [100, 101, 102]) from selectwithsetliterals;
select _id, setcontains(['POST'], 'POST') from selectwithsetliterals;
select _id, setcontains([101], 101) from selectwithsetliterals;
select _id, setcontainsany(['POST'], ['POST']) from selectwithsetliterals;
select _id, setcontainsany([101], [101]) from selectwithsetliterals;
select _id, setcontainsall(['POST'], ['POST']) from selectwithsetliterals;
select _id, setcontainsall([101], [101]) from selectwithsetliterals;


-- The following block of queries is for a test named selectwithset
-- First we'll create a table.
CREATE TABLE selectwithset (_id id,a int min 0 max 1000,b int min 0 max 1000,event stringset,ievent idset);
-- Insert some data into the created table.
INSERT INTO selectwithset VALUES (1,10,100,['POST'],[101]),(2,20,200,['GET'],NULL),(3,30,300,['GET','POST'],NULL);
select * from selectwithset where setcontains(event, 'POST');
select * from selectwithset where setcontains(event, 'POST');
select * from selectwithset where setcontains(ievent, 101);
select * from selectwithset where setcontainsany(ievent, [101]);
select * from selectwithset where setcontainsall(ievent, [101]);
select _id, setcontainsany(ievent, [101]) from selectwithset;
select * from selectwithset where setcontains(event, 'POST') or setcontains(event, 'GET');
select * from selectwithset where setcontainsany(event, ['POST', 'GET']);
select * from selectwithset where setcontains(event, 'POST') and setcontains(event, 'GET');
select * from selectwithset where setcontainsall(event, ['POST', 'GET']);
-- From the following (commented) query, we would expect to get an error like "an expression of type 'int' cannot be assigned to type 'string'"
-- select * from selectwithset where setcontains(event, 1);
-- From the following (commented) query, we would expect to get an error like "an expression of type 'string' cannot be assigned to type 'id'"
-- select * from selectwithset where setcontains(ievent, 'foo');
-- From the following (commented) query, we would expect to get an error like "an expression of type 'array(string)' cannot be assigned to type 'string'"
-- select * from selectwithset where setcontains(event, ['foo']);
-- From the following (commented) query, we would expect to get an error like "array literal must not contain void"
-- select * from selectwithset where setcontains(event, [null]);
select * from selectwithset where setcontains(event, null);
-- From the following (commented) query, we would expect to get an error like "set expression expected"
-- select * from selectwithset where setcontains(null, [1]);


-- The following block of queries is for a test named selectwithsetparams
-- First we'll create a table.
CREATE TABLE selectwithsetparams (_id id,a int min 0 max 1000,b int min 0 max 1000,event stringset,ievent idset);
-- Insert some data into the created table.
INSERT INTO selectwithsetparams VALUES (1,10,100,['POST'],[101]),(2,20,200,['GET'],null),(3,30,300,['GET','POST'],null);
-- From the following (commented) query, we would expect to get an error like "count of formal parameters (2) does not match count of actual parameters (1)"
-- select setcontains(['POST', 'GET']);
-- From the following (commented) query, we would expect to get an error like "set expression expected"
-- select setcontains(1, 2);
-- From the following (commented) query, we would expect to get an error like "an expression of type 'int' cannot be assigned to type 'string'"
-- select setcontains(['POST', 'GET'], 1);
-- From the following (commented) query, we would expect to get an error like "an expression of type 'string' cannot be assigned to type 'int'"
-- select setcontains([1, 2], '1');
-- From the following (commented) query, we would expect to get an error like "count of formal parameters (2) does not match count of actual parameters (1)"
-- select setcontainsall(['POST', 'GET']);
-- From the following (commented) query, we would expect to get an error like "count of formal parameters (2) does not match count of actual parameters (1)"
-- select setcontainsany(['POST', 'GET']);
-- From the following (commented) query, we would expect to get an error like "set expression expected"
-- select setcontainsall(1, 2);
-- From the following (commented) query, we would expect to get an error like "set expression expected"
-- select setcontainsany(1, 2);
-- From the following (commented) query, we would expect to get an error like "types 'string' and 'int' are not equatable"
-- select setcontainsall(['POST', 'GET'], [1, 2]);
-- From the following (commented) query, we would expect to get an error like "types 'string' and 'int' are not equatable"
-- select setcontainsany(['POST', 'GET'], [1, 2]);
-- From the following (commented) query, we would expect to get an error like "types 'int' and 'string' are not equatable"
-- select setcontainsall([1, 2], ['1', '2']);
-- From the following (commented) query, we would expect to get an error like "types 'int' and 'string' are not equatable"
-- select setcontainsany([1, 2], ['1', '2']);


-- The following block of queries is for a test named selectwithsetqliterals
-- First we'll create a table.
CREATE TABLE selectwithsetqliterals (_id id,a int min 0 max 1000,b int min 0 max 1000,ssq1 stringsetq timequantum 'YMD',isq1 idsetq timequantum 'YMD');
insert into selectwithsetqliterals(_id, a, b, ssq1, isq1) values (1, 10, 100, {'2022-01-03T00:00:00Z', ['foo']}, {'2022-01-01T00:00:00Z', [99, 101]});
insert into selectwithsetqliterals(_id, a, b, ssq1, isq1) values (2, 20, 200, {'2022-01-03T00:00:00Z', ['bar']}, {'2022-01-01T00:00:00Z', [100]});
insert into selectwithsetqliterals(_id, a, b, ssq1, isq1) values (3, 30, 300, {'2022-01-03T00:00:00Z', ['foo', 'bar']}, {'2022-01-01T00:00:00Z', [101]});
select _id, setcontains(ssq1, 'bar') from selectwithsetqliterals;
select _id, setcontains(isq1, 101) from selectwithsetqliterals;
select _id, setcontains(['foo'], 'foo') from selectwithsetqliterals;
select _id, setcontains([101], 101) from selectwithsetqliterals;
select _id, setcontainsany(['foo'], ['foo']) from selectwithsetqliterals;
select _id, setcontainsany([101], [101]) from selectwithsetqliterals;
select _id, setcontainsall(['foo'], ['foo']) from selectwithsetqliterals;
select _id, setcontainsall([101], [101]) from selectwithsetqliterals;


-- The following block of queries is for a test named datetimeparttests
-- First we'll create a table.
CREATE TABLE datetimeparttests (_id id,a int min 0 max 1000,b int min 0 max 1000,ts timestamp timeunit 'ns');
-- Insert some data into the created table.
INSERT INTO datetimeparttests VALUES (1,10,100,'2012-11-01T22:08:41.1002003Z');
-- From the following (commented) query, we would expect to get an error like "count of formal parameters (2) does not match count of actual parameters (0)"
-- select datetimepart();
-- From the following (commented) query, we would expect to get an error like "an expression of type 'int' cannot be passed to a parameter of type 'string'"
-- select datetimepart(1, 2);
-- From the following (commented) query, we would expect to get an error like "invalid value '1' for parameter 'interval'"
-- select datetimepart('1', current_timestamp);
-- From the following (commented) query, we would expect to get an error like "count of formal parameters (2) does not match count of actual parameters (0)"
-- select totimestamp();
-- From the following (commented) query, we would expect to get an error like "an expression of type 'string' cannot be passed to a parameter of type 'int'"
-- select totimestamp('a');
-- From the following (commented) query, we would expect to get an error like "an expression of type 'int' cannot be passed to a parameter of type 'string'"
-- select totimestamp(1, 2);
-- From the following (commented) query, we would expect to get an error like "invalid value 'x' for parameter 'timeunit'"
-- select totimestamp(1, 'x');
select _id, datetimepart('yy', ts) from datetimeparttests;
select _id, datetimepart('yd', ts) from datetimeparttests;
select _id, datetimepart('m', ts) from datetimeparttests;
select _id, datetimepart('d', ts) from datetimeparttests;
select _id, datetimepart('w', ts) from datetimeparttests;
select _id, datetimepart('wk', ts) from datetimeparttests;
select _id, datetimepart('hh', ts) from datetimeparttests;
select _id, datetimepart('mi', ts) from datetimeparttests;
select _id, datetimepart('s', ts) from datetimeparttests;
select _id, datetimepart('ms', ts) from datetimeparttests;
select _id, datetimepart('us', ts) from datetimeparttests;
select _id, datetimepart('ns', ts) from datetimeparttests;
select datetimepart('yy', 0) as "yy", datetimepart('m', 0) as "m", datetimepart('d', 0) as "d";


-- The following block of queries is for a test named datetimenametests
-- First we'll create a table.
CREATE TABLE datetimenametests (_id id,ts timestamp);
-- Insert some data into the created table.
INSERT INTO datetimenametests VALUES (1,'2012-11-01T22:08:41Z');
select _id, datetimename('yy', ts) from datetimenametests;
select _id, datetimename('m', ts) from datetimenametests;
select _id, datetimename('w', ts) from datetimenametests;


-- The following block of queries is for a test named table-0
-- From the following (commented) query, we would expect to get an error like "count of formal parameters (2) does not match count of actual parameters (0)"
-- select totimestamp();
-- From the following (commented) query, we would expect to get an error like "an expression of type 'string' cannot be passed to a parameter of type 'int'"
-- select totimestamp('a');
-- From the following (commented) query, we would expect to get an error like "an expression of type 'int' cannot be passed to a parameter of type 'string'"
-- select totimestamp(1, 2);
-- From the following (commented) query, we would expect to get an error like "invalid value 'x' for parameter 'timeunit'"
-- select totimestamp(1, 'x');
select totimestamp(1000) as "default", totimestamp(1000, 's') as "s", totimestamp(1000000, 'ms') as "ms", totimestamp(1000000000, 'us') as "us", totimestamp(1000000000, 'µs') as "µs", totimestamp(1000000000000, 'ns') as "ns";
-- From the following (commented) query, we would expect to get an error like "count of formal parameters (7) does not match count of actual parameters (6)"
-- select datetimefromparts(12,32,43,34,34,34);
-- From the following (commented) query, we would expect to get an error like "an expression of type 'string' cannot be passed to a parameter of type 'int'"
-- select datetimefromparts(12,32,43,34,34,34,'foo');
-- From the following (commented) query, we would expect to get an error like "[0:0] not a valid datetimepart 10000"
-- select datetimefromparts(10000,1,1,1,1,1,1);
-- From the following (commented) query, we would expect to get an error like "[0:0] not a valid datetimepart 29"
-- select datetimefromparts(2023,2,29,1,1,1,1);
select datetimefromparts(2012,11,1,22,8,41,0) as datetime;
select datetimefromparts(0,1,1,0,0,0,0) as datetime;


-- The following block of queries is for a test named datetimeadd
-- First we'll create a table.
CREATE TABLE datetimeadd (_id id,ts timestamp timeunit 'ns');
-- Insert some data into the created table.
INSERT INTO datetimeadd VALUES (1,'2012-11-01T22:08:41.1002003Z');
-- From the following (commented) query, we would expect to get an error like "count of formal parameters (3) does not match count of actual parameters (0)"
-- select datetimeadd();
-- From the following (commented) query, we would expect to get an error like "an expression of type 'int' cannot be passed to a parameter of type 'string'"
-- select datetimeadd(1,1,current_timestamp);
-- From the following (commented) query, we would expect to get an error like "an expression of type 'string' cannot be passed to a parameter of type 'int'"
-- select datetimeadd('yy', '2',current_timestamp);
-- From the following (commented) query, we would expect to get an error like "an expression of type 'bool' cannot be passed to a parameter of type 'timestamp'"
-- select datetimeadd('yy', 2, true);
-- From the following (commented) query, we would expect to get an error like "invalid value 'x' for parameter 'timeunit'"
-- select datetimeadd('x',1,current_timestamp);
-- From the following (commented) query, we would expect to get an error like "unable to convert 'YYYY-MM-DDTHH:MM:SS' to type 'timestamp'"
-- select datetimeadd('ms',7000,'YYYY-MM-DDTHH:MM:SS');
select _id, datetimepart('YY',datetimeadd('YY', 1, ts)) from datetimeadd;
select _id, datetimepart('M',datetimeadd('M', 1, ts)) from datetimeadd;
select _id, datetimepart('D',datetimeadd('D', 1, ts)) from datetimeadd;
select _id, datetimepart('HH',datetimeadd('HH', 1, ts)) from datetimeadd;
select _id, datetimepart('MI',datetimeadd('MI', 1, ts)) from datetimeadd;
select _id, datetimepart('S',datetimeadd('S', 1, ts)) from datetimeadd;
select _id, datetimepart('MS',datetimeadd('MS', 1, ts)) from datetimeadd;
select _id, datetimepart('US',datetimeadd('US', 1, ts)) from datetimeadd;
select _id, datetimepart('NS',datetimeadd('NS', 1, ts)) from datetimeadd;
select _id, datetimepart('YY',datetimeadd('YY', -1, ts)) from datetimeadd;
select _id, datetimepart('NS',datetimeadd('NS', 700, ts)) as a, datetimepart('US',datetimeadd('NS', 700, ts)) as b from datetimeadd;
select _id, datetimepart('YY',datetimeadd('YY', 1, 0)) from datetimeadd;
select _id, datetimepart('YY',datetimeadd('YY', 1, '2023-03-03T00:00:00Z')) from datetimeadd;


-- The following block of queries is for a test named datetrunctests
-- First we'll create a table.
CREATE TABLE datetrunctests (_id id,ts timestamp timeunit 'ns');
-- Insert some data into the created table.
INSERT INTO datetrunctests VALUES (1,'2012-11-01T22:08:41.1002003Z');
-- From the following (commented) query, we would expect to get an error like "count of formal parameters (2) does not match count of actual parameters (0)"
-- select date_trunc();
-- From the following (commented) query, we would expect to get an error like "an expression of type 'int' cannot be passed to a parameter of type 'string'"
-- select date_trunc(1, 2);
-- From the following (commented) query, we would expect to get an error like "invalid value '1' for parameter 'interval'"
-- select date_trunc('1', current_timestamp);
select _id, date_trunc('yy', ts) from datetrunctests;
select _id, date_trunc('m', ts) from datetrunctests;
select _id, date_trunc('d', ts) from datetrunctests;
select _id, date_trunc('hh', ts) from datetrunctests;
select _id, date_trunc('mi', ts) from datetrunctests;
select _id, date_trunc('s', ts) from datetrunctests;
select _id, date_trunc('ms', ts) from datetrunctests;
select _id, date_trunc('us', ts) from datetrunctests;
select _id, date_trunc('ns', ts) from datetrunctests;
select _id, datetimename('ns', ts) from datetrunctests;


-- The following block of queries is for a test named DatetimeDiff
-- First we'll create a table.
CREATE TABLE dttable (_id id,startTime timestamp timeunit 'ns',endTime timestamp timeunit 'ns');
-- Insert some data into the created table.
INSERT INTO dttable VALUES (1,'2012-11-01T22:08:41.1002003Z','2022-12-09T18:04:54.3005008Z');
-- From the following (commented) query, we would expect to get an error like "count of formal parameters (3) does not match count of actual parameters (2)"
-- select datetimediff(startTime, endTime) from dttable;
-- From the following (commented) query, we would expect to get an error like "[0:0] unable to convert 'nope' to type 'timestamp'"
-- select datetimediff('yy','nope', endTime) from dttable;
select datetimediff(null, startTime, endTime) from dttable;
select datetimediff('yy', startTime, endTime) from dttable;
select datetimediff('m', startTime, endTime) from dttable;
select datetimediff('d', startTime, endTime) from dttable;
select datetimediff('hh', startTime, endTime) from dttable;
select datetimediff('mi', startTime, endTime) from dttable;
select datetimediff('s', startTime, endTime) from dttable;
select datetimediff('ms', startTime, endTime) from dttable;
select datetimediff('us', startTime, endTime) from dttable;
select datetimediff('ns', startTime, endTime) from dttable;


-- The following block of queries is for a test named table-0
-- From the following (commented) query, we would expect to get an error like "count of formal parameters (2) does not match count of actual parameters (0)"
-- select parsetimestamp();
-- From the following (commented) query, we would expect to get an error like "an expression of type 'int' cannot be passed to a parameter of type 'string'"
-- select parsetimestamp(1,'%Y-%m-%d');
-- From the following (commented) query, we would expect to get an error like "an expression of type 'int' cannot be passed to a parameter of type 'string'"
-- select parsetimestamp('2023-01-01',1);
-- From the following (commented) query, we would expect to get an error like "invalid format code: %e"
-- select parsetimestamp('2023-02-02','%Y-%m-%e');
-- From the following (commented) query, we would expect to get an error like "[0:0] unable to convert '2023-jan-02-22-73-34' to timestamp using format '%Y-%b-%d-%H-%M-%S' ('parsing time "2023-jan-02-22-73-34": minute out of range')"
-- select parsetimestamp('2023-jan-02-22-73-34','%Y-%b-%d-%H-%M-%S');
select parsetimestamp(NULL,'%Y-%m-%d');
select parsetimestamp('2023-01-01','');
select  parsetimestamp('2023-01-02','%Y-%m-%d') as "time";
select  parsetimestamp('2023-jan-02-02-23-34','%Y-%b-%d-%H-%M-%S') as "time";
select  parsetimestamp('Mon May 02 15:04:05 2022','%c') as "time";
select  parsetimestamp('05/02/22','%x') as "time";
select  parsetimestamp('15:30:45','%X') as "time";
select  parsetimestamp('05:30:45','%I:%M:%S') as "time";
select  parsetimestamp('2022-05-03 10:45:30.000000','%Y-%m-%d %H:%M:%S.%f') as "time";


-- The following block of queries is for a test named stringscalarfunctions
-- First we'll create a table.
CREATE TABLE stringscalarfunctions (_id id,a int min 0 max 1000,b int min 0 max 1000,ts timestamp,a_string string);
-- Insert some data into the created table.
INSERT INTO stringscalarfunctions VALUES (1,10,100,'2012-11-01T22:08:41Z','hello');
select reverse(null);
select reverse('');
select reverse('this');
select reverse(reverse('this'));
-- From the following (commented) query, we would expect to get an error like "count of formal parameters (1) does not match count of actual parameters (0)"
-- select reverse();
-- From the following (commented) query, we would expect to get an error like "[1:16] string expression expected"
-- select reverse(22);
select reverse(a_string) from stringscalarfunctions;
-- From the following (commented) query, we would expect to get an error like "count of formal parameters (2) does not match count of actual parameters (0)"
-- select Substring();
select substring(null, 1, 3);
select substring('some_string', null, 3);
select substring('testing', 1, 3);
-- From the following (commented) query, we would expect to get an error like "[0:0] value '-10' out of range"
-- select substring('testing', -10, 14);
-- From the following (commented) query, we would expect to get an error like "[0:0] value '-5' out of range"
-- select substring('testing', -5);
select reverse(substring('testing', 0));
select substring(reverse('testing'), 3);
select substring(a_string, 1, 1) from stringscalarfunctions;
-- From the following (commented) query, we would expect to get an error like "count of formal parameters (2) does not match count of actual parameters (0)"
-- select StringSplit();
select stringsplit(null, ',');
select stringsplit('hello', null);
select stringsplit('test,hello', ',', null);
select stringsplit('string,split', ',');
select stringsplit('string,split,now', stringsplit(',mid,', 'mid', 1), 2);
select stringsplit(a_string, 'l') from stringscalarfunctions;
-- From the following (commented) query, we would expect to get an error like "count of formal parameters (1) does not match count of actual parameters (0)"
-- select char();
select char(null);
select char(82);
select char(255);
-- From the following (commented) query, we would expect to get an error like "integer expression expected"
-- select char('R');
-- From the following (commented) query, we would expect to get an error like "value '-1' out of range"
-- select char(-1);
-- From the following (commented) query, we would expect to get an error like "value '256' out of range"
-- select char(256);
select ascii(char(a)) from stringscalarfunctions;
-- From the following (commented) query, we would expect to get an error like "value 'ÿ' should be of the length 1"
-- select ascii(char(255));
-- From the following (commented) query, we would expect to get an error like "count of formal parameters (1) does not match count of actual parameters (0)"
-- select ascii();
select ascii(null);
-- From the following (commented) query, we would expect to get an error like "[0:0] value 'longer' should be of the length 1"
-- select ascii('longer');
select ascii('R');
-- From the following (commented) query, we would expect to get an error like "string expression expected"
-- select ascii(32);
select upper(null);
select upper('this');
-- From the following (commented) query, we would expect to get an error like "'upper': count of formal parameters (1) does not match count of actual parameters (2)"
-- select upper('a','b');
-- From the following (commented) query, we would expect to get an error like "string expression expected"
-- select upper(1);
select lower(null);
select lower('AaBbCcDdEeFfGg-_0123');
-- From the following (commented) query, we would expect to get an error like "'lower': count of formal parameters (1) does not match count of actual parameters (2)"
-- select lower('LOWER','lower');
-- From the following (commented) query, we would expect to get an error like "string expression expected"
-- select lower(1234);
select replaceall(null,'data','feature');
select replaceall('hello database',null,'feature');
select replaceall('hello database', 'data', null);
select replaceall('hello database','data','feature');
select replaceall('Buffalo Buffalo buffalo buffalo Buffalo', 'Buffalo', 'Buffalo buffalo');
select replaceall(reverse('gnitset'),substring('testing',4),upper('ed'));
-- From the following (commented) query, we would expect to get an error like "'replaceall': count of formal parameters (3) does not match count of actual parameters (2)"
-- select replaceall('ab','b');
-- From the following (commented) query, we would expect to get an error like "string expression expected"
-- select replaceall('test','e',1);
select trim(null);
select trim('  this  ');
-- From the following (commented) query, we would expect to get an error like "'trim': count of formal parameters (1) does not match count of actual parameters (2)"
-- select trim('  a ','b');
-- From the following (commented) query, we would expect to get an error like "string expression expected"
-- select trim(1);
SELECT PREFIX(NULL, 34);
SELECT PREFIX('string', null);
-- From the following (commented) query, we would expect to get an error like "'PREFIX': count of formal parameters (2) does not match count of actual parameters (1)"
-- SELECT PREFIX('string');
-- From the following (commented) query, we would expect to get an error like "string expression expected"
-- SELECT PREFIX(1,'string');
-- From the following (commented) query, we would expect to get an error like "[0:0] value '7' out of range"
-- SELECT PREFIX('string', 7);
-- From the following (commented) query, we would expect to get an error like "[0:0] value '-1' out of range"
-- SELECT PREFIX('string', -1);
SELECT PREFIX('string', 0);
SELECT PREFIX('string', 3);
SELECT PREFIX('string', 6);
SELECT SUFFIX(NULL, 23);
SELECT SUFFIX('string', null);
-- From the following (commented) query, we would expect to get an error like "'SUFFIX': count of formal parameters (2) does not match count of actual parameters (1)"
-- SELECT SUFFIX('string');
-- From the following (commented) query, we would expect to get an error like "string expression expected"
-- SELECT SUFFIX(1,'string');
-- From the following (commented) query, we would expect to get an error like "[0:0] value '7' out of range"
-- SELECT SUFFIX('string', 7);
-- From the following (commented) query, we would expect to get an error like "[0:0] value '-1' out of range"
-- SELECT SUFFIX('string', -1);
SELECT SUFFIX('string', 0);
SELECT SUFFIX('string', 3);
SELECT SUFFIX('string', 6);
select rtrim(null);
select rtrim('  this  ');
-- From the following (commented) query, we would expect to get an error like "'rtrim': count of formal parameters (1) does not match count of actual parameters (2)"
-- select rtrim(' a ',' b ');
-- From the following (commented) query, we would expect to get an error like "string expression expected"
-- select rtrim(1);
select ltrim(null);
SELECT ltrim(NULL);
select ltrim('  this  ');
-- From the following (commented) query, we would expect to get an error like "'ltrim': count of formal parameters (1) does not match count of actual parameters (2)"
-- select ltrim(' a ',' b ');
-- From the following (commented) query, we would expect to get an error like "string expression expected"
-- select ltrim(1);
SELECT space(NULL);
-- From the following (commented) query, we would expect to get an error like "count of formal parameters (1) does not match count of actual parameters (0)"
-- select space();
select space(0);
select space(5);
-- From the following (commented) query, we would expect to get an error like "count of formal parameters (1) does not match count of actual parameters (0)"
-- select len();
select len(null);
select len(' length  ');
select len(char(114));
select replicate('this', 2);
select replicate(null, 3);
select replicate('string',null);
-- From the following (commented) query, we would expect to get an error like "[1:25] 'replicate': count of formal parameters (2) does not match count of actual parameters (1)"
-- select replicate('this',);
-- From the following (commented) query, we would expect to get an error like "[1:18] string expression expected"
-- select replicate(1,2);
-- From the following (commented) query, we would expect to get an error like "[1:25] integer expression expected"
-- select replicate('this','this');
-- From the following (commented) query, we would expect to get an error like "[0:0] value '-1' out of range"
-- select replicate('this',-1);
select format('this or %s', 'that');
select format('is this %t?', true);
select format('%d > %d', 11 , 9);
select format(null,'this');
-- From the following (commented) query, we would expect to get an error like "[1:30] null literal not allowed"
-- select format('format = %d', null);
-- From the following (commented) query, we would expect to get an error like "[1:15] 'format': count of formal parameters (1) does not match count of actual parameters (0)"
-- select format();
select format('noArg');
-- From the following (commented) query, we would expect to get an error like "'charindex': count of formal parameters (3) does not match count of actual parameters (4)"
-- select charindex('is','this is great',3,4);
-- From the following (commented) query, we would expect to get an error like "integer expression expected"
-- select charindex('is','this is great','you');
-- From the following (commented) query, we would expect to get an error like "string expression expected"
-- select charindex('is',23,3);
-- From the following (commented) query, we would expect to get an error like "string expression expected"
-- select charindex(1,'this is great',3);
-- From the following (commented) query, we would expect to get an error like "value '-1' out of range"
-- select charindex('is','this is great',-1);
-- From the following (commented) query, we would expect to get an error like "value '15' out of range"
-- select charindex('is','this is great',15);
Select charindex('is','this is great');
Select charindex('is','this is great',3);
Select charindex('abc','this is great',3);
Select charindex(null, 'this is great', 3);
Select charindex('abc', Null, 3);
Select charindex('abc', 'this is great', Null);
select str(12345);
select str(12345, 5);
select str(12345, 5, 5);
select str(12345.678);
select str(12345.19, 5);
select str(12345.789, 8, 2);
select str(-2345.789, 8, 2);
-- From the following (commented) query, we would expect to get an error like "'str': count of formal parameters (1) does not match count of actual parameters (0)"
-- select str();
-- From the following (commented) query, we would expect to get an error like "'str': count of formal parameters (1) does not match count of actual parameters (4)"
-- select str(1, 1, 1, 1);
select str(1234.99, 10, 200);
select str(null);
-- From the following (commented) query, we would expect to get an error like "null literal not allowed"
-- select str(1, null);
-- From the following (commented) query, we would expect to get an error like "null literal not allowed"
-- select str(1, 0, null);


-- The following block of queries is for a test named insertTest
-- First we'll create a table.
CREATE TABLE testinsert (_id id,a int min 0 max 1000,b int min 0 max 1000,s string,bl bool,d decimal(2) min 0 max 1000,event stringset,ievent idset);
select _id, a from testinsert;
-- From the following (commented) query, we would expect to get an error like "error INSERTing into 'fb_views' (system tables cannot be an INSERT target)"
-- INSERT INTO fb_views (_id, name) values ('foo', 'bar');
insert into testinsert (_id, a, b, s, bl, d, event, ievent) values (4, 40, 400, 'foo', false, 10.12, ['A', 'B', 'C'], [1, 2, 3]);
replace into testinsert (_id, a, b, s, bl, d, event, ievent) values (4, 40, 400, 'foo', false, 10.12, ['A', 'B', 'C'], [1, 2, 3]);
insert into testinsert (_id, a, b, s, bl, d, event, ievent) values (4, 40, 400, 'foo', false, 10.12, ['A', 'B', 'C'], [1, 2, 3]), (5, 50, 500, 'var', true, 20.24, ['X', 'Y', 'Z'], [4, 5, 6]);
insert into testinsert (_id, a, b, s, bl, d, event, ievent) values (5, null, null, null, null, null, null, null);
insert into testinsert (_id, a, b, s, bl, d, event, ievent) values (6, 1, null, null, null, null, null, null);
insert into testinsert (_id, a, b, s, bl, d, event, ievent) values (4, 40*10, 400+1, 'foo' || 'bar', 1 > 2, 10.12 + 3.1, ['A', 'B', 'C'], [1, 2, 3]);
-- From the following (commented) query, we would expect to get an error like "table 'ifoo' not found"
-- insert into ifoo (a, b) values (1, 2);
-- From the following (commented) query, we would expect to get an error like "column 'c' not found"
-- insert into testinsert (c, b) values (1, 2);
-- From the following (commented) query, we would expect to get an error like "duplicate column 'a'"
-- insert into testinsert (a, a, b) values (1, 2);
-- From the following (commented) query, we would expect to get an error like "mismatch in the count of expressions and target columns"
-- insert into testinsert (_id, a, b) values (1);
-- From the following (commented) query, we would expect to get an error like "mismatch in the count of expressions and target columns"
-- insert into testinsert values (4, 40, 400);
-- From the following (commented) query, we would expect to get an error like "insert column list must have '_id' column specified"
-- insert into testinsert (a, b) values (1, 2);
-- From the following (commented) query, we would expect to get an error like "insert column list must have at least one non '_id' column specified"
-- insert into testinsert (_id) values (1);
-- From the following (commented) query, we would expect to get an error like "an expression of type 'array(int)' cannot be assigned to type 'stringset'"
-- insert into testinsert (_id, a, event) values (4, 40, [101, 150]);
-- From the following (commented) query, we would expect to get an error like "an expression of type 'array(string)' cannot be assigned to type 'idset'"
-- insert into testinsert (_id, a, ievent) values (4, 40, ['POST', 'GET']);
-- From the following (commented) query, we would expect to get an error like "inserting value into column 'a', row 1, value '-1' out of range"
-- insert into testinsert (_id, a) values (400, -1);
-- From the following (commented) query, we would expect to get an error like "inserting value into column 'a', row 1, value '1001' out of range"
-- insert into testinsert (_id, a) values (400, 1001);
-- From the following (commented) query, we would expect to get an error like "inserting value into column 'd', row 1, value '-1' out of range"
-- insert into testinsert (_id, d) values (400, -1.00);
-- From the following (commented) query, we would expect to get an error like "inserting value into column 'd', row 1, value '1001' out of range"
-- insert into testinsert (_id, d) values (400, 1001.00);


-- The following block of queries is for a test named table-0
CREATE TABLE insertTimestampTest (_id id, time timestamp timeunit 'ms', ids idset, strings stringset);
INSERT INTO insertTimestampTest(_id, time, ids, strings) VALUES (1, '2023-01-01', [6 , 1, 9], ['red', 'blue', 'green']);
INSERT INTO insertTimestampTest(_id, time, ids, strings) VALUES (2, 1672531200, [6 , 1, 9], ['red', 'blue', 'green']);
select time from insertTimestampTest;


-- The following block of queries is for a test named keyedinsert
-- First we'll create a table.
CREATE TABLE testkeyedinsert (_id string,a int min 0 max 1000,b int min 0 max 1000,s string,bl bool,d decimal(2),event stringset,ievent idset);
insert into testkeyedinsert (_id, a, b, s, bl, d, event, ievent) values ('four', 40, 400, 'foo', false, 10.12, ['A', 'B', 'C'], [1, 2, 3]);


-- The following block of queries is for a test named nokeys-null-insert
-- First we'll create a table.
CREATE TABLE nokeys-null-insert (_id id,int_fld int,dec_fld decimal(2),tst_fld timestamp,str_fld string,sts_fld stringset,id_fld id,ids_fld idset,bol_fld bool);
-- Insert some data into the created table.
INSERT INTO nokeys-null-insert VALUES (0,10,123.45,1681512134,'str1',['a1','b1','c1'],101,[10,20,30],false),(1,20,234.56,1681512134,'str2',['d1','e1','f1'],202,[20,30,40],true);
select * from nokeys-null-insert;
INSERT INTO nokeys-null-insert
					(_id, str_fld, sts_fld, int_fld, ids_fld, bol_fld, id_fld, dec_fld, tst_fld) VALUES
					(0, null, null, null, null, null, null, null, null),
					(1, 'str3', ['a1', 'g1'], 25, [10], false, 303, null, null);
select * from nokeys-null-insert;
INSERT INTO nokeys-null-insert
					(_id, str_fld, sts_fld, int_fld, ids_fld, bol_fld, id_fld, dec_fld, tst_fld) VALUES
					(0, 'str4', ['h1', 'c1'], 35, [15, 30], false, 404, 23.23, 1681512135),
					(1, null, null, null, null, null, null, null, null);
select * from nokeys-null-insert;


-- The following block of queries is for a test named nokeys-null-insert-keys
-- First we'll create a table.
CREATE TABLE nokeys-null-insert-keys (_id string,int_fld int,dec_fld decimal(2),tst_fld timestamp,str_fld string,sts_fld stringset,id_fld id,ids_fld idset,bol_fld bool);
-- Insert some data into the created table.
INSERT INTO nokeys-null-insert-keys VALUES ('id0',10,123.45,1681512134,'str1',['a1','b1','c1'],101,[10,20,30],false),('id1',20,234.56,1681512134,'str2',['d1','e1','f1'],202,[20,30,40],true);
select * from nokeys-null-insert-keys;
INSERT INTO nokeys-null-insert-keys
					(_id, str_fld, sts_fld, int_fld, ids_fld, bol_fld, id_fld, dec_fld, tst_fld) VALUES
					('id0', null, null, null, null, null, null, null, null),
					('id1', 'str3', ['a1', 'g1'], 25, [10], false, 303, null, null);
select * from nokeys-null-insert-keys;
INSERT INTO nokeys-null-insert-keys
					(_id, str_fld, sts_fld, int_fld, ids_fld, bol_fld, id_fld, dec_fld, tst_fld) VALUES
					('id0', 'str4', ['h1', 'c1'], 35, [15, 30], false, 404, 23.23, 1681512135),
					('id1', null, null, null, null, null, null, null, null);
select * from nokeys-null-insert-keys;


-- The following block of queries is for a test named nokeys-empty-set
-- First we'll create a table.
CREATE TABLE nokeys-empty-set (_id id,sts_fld stringset,ids_fld idset);
-- Insert some data into the created table.
INSERT INTO nokeys-empty-set VALUES (0,['a1','b1','c1'],[10,20,30]),(1,['d1','e1','f1'],[20,30,40]);
select * from nokeys-empty-set;
INSERT INTO nokeys-empty-set
					(_id, sts_fld, ids_fld) VALUES
					(0, [],[]);
select * from nokeys-empty-set;
INSERT INTO nokeys-empty-set
					(_id, sts_fld, ids_fld) VALUES
					(2, [],[]);
select * from nokeys-empty-set;
INSERT INTO nokeys-empty-set
					(_id, sts_fld, ids_fld) VALUES
					(1, null,null),
					(2, null,null);
select * from nokeys-empty-set;
INSERT INTO nokeys-empty-set
					(_id, sts_fld, ids_fld) VALUES
					(1, [],[]),
					(2, [],[]);
select * from nokeys-empty-set;


-- The following block of queries is for a test named nokeys-empty-string
-- First we'll create a table.
CREATE TABLE nokeys-empty-string (_id id,str string);
-- Insert some data into the created table.
INSERT INTO nokeys-empty-string VALUES (0,'str0'),(1,'str1');
select * from nokeys-empty-string;
INSERT INTO nokeys-empty-string
					(_id, str) VALUES
					(2, '');
select * from nokeys-empty-string where _id = 2;
INSERT INTO nokeys-empty-string
					(_id, str) VALUES
					(0, '');
select * from nokeys-empty-string where _id = 0;


-- The following block of queries is for a test named testtimestampliterals
-- First we'll create a table.
CREATE TABLE testtimestampliterals (_id id,a int min 0 max 1000,b int min 0 max 1000,d decimal(2),ts timestamp,event stringset,ievent idset);
insert into testtimestampliterals (_id, a, b, d, ts, event, ievent) values (1, 40, 400, 10.12, current_timestamp, ['A', 'B', 'C'], [1, 2, 3]);
insert into testtimestampliterals (_id, a, b, d, ts, event, ievent) values (2, 40, 400, 10.12, current_date, ['A', 'B', 'C'], [1, 2, 3]);
insert into testtimestampliterals (_id, a, b, d, ts, event, ievent) values (3, 40, 400, 10.12, 0, ['A', 'B', 'C'], [1, 2, 3]);
insert into testtimestampliterals (_id, a, b, d, ts, event, ievent) values (4, 40, 400, 10.12, -86400, ['A', 'B', 'C'], [1, 2, 3]);
select _id, datetimepart('yy', ts) as "yy" from testtimestampliterals where _id in (3,4);


-- The following block of queries is for a test named unoptesti
-- First we'll create a table.
CREATE TABLE unoptesti (_id id,i int min 0 max 1000);
-- Insert some data into the created table.
INSERT INTO unoptesti VALUES (1,10);
select -i from unoptesti;
select !i from unoptesti;
select +i from unoptesti;


-- The following block of queries is for a test named unoptestid
-- First we'll create a table.
CREATE TABLE unoptestid (_id id,a int min 0 max 1000);
-- Insert some data into the created table.
INSERT INTO unoptestid VALUES (1,10);
select -_id from unoptestid;
select !_id from unoptestid;
select +_id from unoptestid;


-- The following block of queries is for a test named unoptest_b
-- First we'll create a table.
CREATE TABLE unoptest_b (_id id,i bool);
-- Insert some data into the created table.
INSERT INTO unoptest_b VALUES (1,false);
-- From the following (commented) query, we would expect to get an error like "operator '-' incompatible with type 'bool'"
-- select -i from unoptest_b;
-- From the following (commented) query, we would expect to get an error like "operator '!' incompatible with type 'bool'"
-- select !i from unoptest_b;
-- From the following (commented) query, we would expect to get an error like "operator '+' incompatible with type 'bool'"
-- select +i from unoptest_b;


-- The following block of queries is for a test named unoptestd
-- First we'll create a table.
CREATE TABLE unoptestd (_id id,d decimal(2));
-- Insert some data into the created table.
INSERT INTO unoptestd VALUES (1,12.34);
select -d from unoptestd;
-- From the following (commented) query, we would expect to get an error like "operator '!' incompatible with type 'decimal(2)'"
-- select !d from unoptestd;
select +d from unoptestd;


-- The following block of queries is for a test named unoptestts
-- First we'll create a table.
CREATE TABLE unoptestts (_id id,ts timestamp);
-- Insert some data into the created table.
INSERT INTO unoptestts VALUES (1,'2012-11-01T22:08:41Z');
-- From the following (commented) query, we would expect to get an error like "operator '-' incompatible with type 'timestamp'"
-- select -ts from unoptestts;
-- From the following (commented) query, we would expect to get an error like "operator '!' incompatible with type 'timestamp'"
-- select !ts from unoptestts;
-- From the following (commented) query, we would expect to get an error like "operator '+' incompatible with type 'timestamp'"
-- select +ts from unoptestts;


-- The following block of queries is for a test named unoptestids
-- First we'll create a table.
CREATE TABLE unoptestids (_id id,ids idset);
-- Insert some data into the created table.
INSERT INTO unoptestids VALUES (1,[11,12,13]);
-- From the following (commented) query, we would expect to get an error like "operator '-' incompatible with type 'idset'"
-- select -ids from unoptestids;
-- From the following (commented) query, we would expect to get an error like "operator '!' incompatible with type 'idset'"
-- select !ids from unoptestids;
-- From the following (commented) query, we would expect to get an error like "operator '+' incompatible with type 'idset'"
-- select +ids from unoptestids;


-- The following block of queries is for a test named unoptest_s
-- First we'll create a table.
CREATE TABLE unoptest_s (_id id,s string);
-- Insert some data into the created table.
INSERT INTO unoptest_s VALUES (1,'foo');
-- From the following (commented) query, we would expect to get an error like "operator '-' incompatible with type 'string'"
-- select -s from unoptest_s;
-- From the following (commented) query, we would expect to get an error like "operator '!' incompatible with type 'string'"
-- select !s from unoptest_s;
-- From the following (commented) query, we would expect to get an error like "operator '+' incompatible with type 'string'"
-- select +s from unoptest_s;


-- The following block of queries is for a test named unoptestss
-- First we'll create a table.
CREATE TABLE unoptestss (_id id,s stringset);
-- Insert some data into the created table.
INSERT INTO unoptestss VALUES (1,['11','12','13']);
-- From the following (commented) query, we would expect to get an error like "operator '-' incompatible with type 'stringset'"
-- select -s from unoptestss;
-- From the following (commented) query, we would expect to get an error like "operator '!' incompatible with type 'stringset'"
-- select !s from unoptestss;
-- From the following (commented) query, we would expect to get an error like "operator '+' incompatible with type 'stringset'"
-- select +s from unoptestss;


-- The following block of queries is for a test named binoptesti_i
-- First we'll create a table.
CREATE TABLE binoptesti_i (_id id,a int min 0 max 1000,b int min 0 max 1000);
-- Insert some data into the created table.
INSERT INTO binoptesti_i VALUES (1,10,20);
-- From the following (commented) query, we would expect to get an error like "divisor is equal to zero"
-- select 1/0;
-- From the following (commented) query, we would expect to get an error like "divisor is equal to zero"
-- select a/0 from binoptesti_i;
-- From the following (commented) query, we would expect to get an error like "divisor is equal to zero"
-- select 1%0;
-- From the following (commented) query, we would expect to get an error like "divisor is equal to zero"
-- select a%0 from binoptesti_i;
select a != b from binoptesti_i;
select a = b from binoptesti_i;
select a <= b from binoptesti_i;
select a >= b from binoptesti_i;
select a < b from binoptesti_i;
select a > b from binoptesti_i;
select a & b from binoptesti_i;
select a | b from binoptesti_i;
select a << b from binoptesti_i;
select a >> b from binoptesti_i;
select a + b from binoptesti_i;
select a - b from binoptesti_i;
select a * b from binoptesti_i;
select a / b from binoptesti_i;
select a % b from binoptesti_i;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'int'"
-- select a || b from binoptesti_i;
select 1 - 1 ;
select 1 / 1 ;
select 1 % 1 ;


-- The following block of queries is for a test named binoptesti_b
-- First we'll create a table.
CREATE TABLE binoptesti_b (_id id,a int min 0 max 1000,b bool);
-- Insert some data into the created table.
INSERT INTO binoptesti_b VALUES (1,10,true);
-- From the following (commented) query, we would expect to get an error like "types 'int' and 'bool' are not equatable"
-- select a != b from binoptesti_b;
-- From the following (commented) query, we would expect to get an error like "types 'int' and 'bool' are not equatable"
-- select a = b from binoptesti_b;
-- From the following (commented) query, we would expect to get an error like "operator '<=' incompatible with type 'bool'"
-- select a <= b from binoptesti_b;
-- From the following (commented) query, we would expect to get an error like "operator '>=' incompatible with type 'bool'"
-- select a >= b from binoptesti_b;
-- From the following (commented) query, we would expect to get an error like "operator '<' incompatible with type 'bool'"
-- select a < b from binoptesti_b;
-- From the following (commented) query, we would expect to get an error like "operator '>' incompatible with type 'bool'"
-- select a > b from binoptesti_b;
-- From the following (commented) query, we would expect to get an error like "operator '&' incompatible with type 'bool'"
-- select a & b from binoptesti_b;
-- From the following (commented) query, we would expect to get an error like "operator '|' incompatible with type 'bool'"
-- select a | b from binoptesti_b;
-- From the following (commented) query, we would expect to get an error like "operator '<<' incompatible with type 'bool'"
-- select a << b from binoptesti_b;
-- From the following (commented) query, we would expect to get an error like "operator '>>' incompatible with type 'bool'"
-- select a >> b from binoptesti_b;
-- From the following (commented) query, we would expect to get an error like "operator '+' incompatible with type 'bool'"
-- select a + b from binoptesti_b;
-- From the following (commented) query, we would expect to get an error like "operator '-' incompatible with type 'bool'"
-- select a - b from binoptesti_b;
-- From the following (commented) query, we would expect to get an error like "operator '*' incompatible with type 'bool'"
-- select a * b from binoptesti_b;
-- From the following (commented) query, we would expect to get an error like "operator '/' incompatible with type 'bool'"
-- select a / b from binoptesti_b;
-- From the following (commented) query, we would expect to get an error like "operator '%' incompatible with type 'bool'"
-- select a % b from binoptesti_b;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'int'"
-- select a || b from binoptesti_b;


-- The following block of queries is for a test named binoptesti_id
-- First we'll create a table.
CREATE TABLE binoptesti_id (_id id,b int min 0 max 1000);
-- Insert some data into the created table.
INSERT INTO binoptesti_id VALUES (10,20);
select b != _id from binoptesti_id;
select b = _id from binoptesti_id;
select b <= _id from binoptesti_id;
select b >= _id from binoptesti_id;
select b < _id from binoptesti_id;
select b > _id from binoptesti_id;
select b & _id from binoptesti_id;
select b | _id from binoptesti_id;
select b << _id from binoptesti_id;
select b >> _id from binoptesti_id;
select b + _id from binoptesti_id;
select b - _id from binoptesti_id;
select b * _id from binoptesti_id;
select b / _id from binoptesti_id;
select b % _id from binoptesti_id;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'int'"
-- select b || _id from binoptesti_id;


-- The following block of queries is for a test named binoptesti_d
-- First we'll create a table.
CREATE TABLE binoptesti_d (_id id,a int min 0 max 1000,d decimal(2));
-- Insert some data into the created table.
INSERT INTO binoptesti_d VALUES (1,20,12.34);
select a != d from binoptesti_d;
select a = d from binoptesti_d;
select a <= d from binoptesti_d;
select a >= d from binoptesti_d;
select a < d from binoptesti_d;
select a > d from binoptesti_d;
-- From the following (commented) query, we would expect to get an error like "operator '&' incompatible with type 'decimal(2)'"
-- select a & d from binoptesti_d;
-- From the following (commented) query, we would expect to get an error like "operator '|' incompatible with type 'decimal(2)'"
-- select a | d from binoptesti_d;
-- From the following (commented) query, we would expect to get an error like "operator '<<' incompatible with type 'decimal(2)'"
-- select a << d from binoptesti_d;
-- From the following (commented) query, we would expect to get an error like "operator '>>' incompatible with type 'decimal(2)'"
-- select a >> d from binoptesti_d;
select a + d from binoptesti_d;
select a - d from binoptesti_d;
select a * d from binoptesti_d;
select a / d from binoptesti_d;
-- From the following (commented) query, we would expect to get an error like "operator '%' incompatible with type 'decimal(2)'"
-- select a % d from binoptesti_d;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'int'"
-- select a || d from binoptesti_d;


-- The following block of queries is for a test named binoptesti_ts
-- First we'll create a table.
CREATE TABLE binoptesti_ts (_id id,a int min 0 max 1000,ts timestamp);
-- Insert some data into the created table.
INSERT INTO binoptesti_ts VALUES (1,20,'2012-11-01T22:08:41Z');
-- From the following (commented) query, we would expect to get an error like "types 'int' and 'timestamp' are not equatable"
-- select a != ts from binoptesti_ts;
-- From the following (commented) query, we would expect to get an error like "types 'int' and 'timestamp' are not equatable"
-- select a = ts from binoptesti_ts;
-- From the following (commented) query, we would expect to get an error like "types 'int' and 'timestamp' are not equatable"
-- select a <= ts from binoptesti_ts;
-- From the following (commented) query, we would expect to get an error like "types 'int' and 'timestamp' are not equatable"
-- select a >= ts from binoptesti_ts;
-- From the following (commented) query, we would expect to get an error like "types 'int' and 'timestamp' are not equatable"
-- select a < ts from binoptesti_ts;
-- From the following (commented) query, we would expect to get an error like "types 'int' and 'timestamp' are not equatable"
-- select a > ts from binoptesti_ts;
-- From the following (commented) query, we would expect to get an error like "operator '&' incompatible with type 'timestamp'"
-- select a & ts from binoptesti_ts;
-- From the following (commented) query, we would expect to get an error like "operator '|' incompatible with type 'timestamp'"
-- select a | ts from binoptesti_ts;
-- From the following (commented) query, we would expect to get an error like "operator '<<' incompatible with type 'timestamp'"
-- select a << ts from binoptesti_ts;
-- From the following (commented) query, we would expect to get an error like "operator '>>' incompatible with type 'timestamp'"
-- select a >> ts from binoptesti_ts;
-- From the following (commented) query, we would expect to get an error like "operator '+' incompatible with type 'timestamp'"
-- select a + ts from binoptesti_ts;
-- From the following (commented) query, we would expect to get an error like "operator '-' incompatible with type 'timestamp'"
-- select a - ts from binoptesti_ts;
-- From the following (commented) query, we would expect to get an error like "operator '*' incompatible with type 'timestamp'"
-- select a * ts from binoptesti_ts;
-- From the following (commented) query, we would expect to get an error like "operator '/' incompatible with type 'timestamp'"
-- select a / ts from binoptesti_ts;
-- From the following (commented) query, we would expect to get an error like "operator '%' incompatible with type 'timestamp'"
-- select a % ts from binoptesti_ts;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'int'"
-- select a || ts from binoptesti_ts;


-- The following block of queries is for a test named binoptesti_ids
-- First we'll create a table.
CREATE TABLE binoptesti_ids (_id id,a int min 0 max 1000,b idset);
-- Insert some data into the created table.
INSERT INTO binoptesti_ids VALUES (1,20,[101,102]);
-- From the following (commented) query, we would expect to get an error like "types 'int' and 'idset' are not equatable"
-- select a != b from binoptesti_ids;
-- From the following (commented) query, we would expect to get an error like "types 'int' and 'idset' are not equatable"
-- select a = b from binoptesti_ids;
-- From the following (commented) query, we would expect to get an error like " operator '<=' incompatible with type 'idset'"
-- select a <= b from binoptesti_ids;
-- From the following (commented) query, we would expect to get an error like " operator '>=' incompatible with type 'idset'"
-- select a >= b from binoptesti_ids;
-- From the following (commented) query, we would expect to get an error like " operator '<' incompatible with type 'idset'"
-- select a < b from binoptesti_ids;
-- From the following (commented) query, we would expect to get an error like " operator '>' incompatible with type 'idset'"
-- select a > b from binoptesti_ids;
-- From the following (commented) query, we would expect to get an error like " operator '&' incompatible with type 'idset'"
-- select a & b from binoptesti_ids;
-- From the following (commented) query, we would expect to get an error like " operator '|' incompatible with type 'idset'"
-- select a | b from binoptesti_ids;
-- From the following (commented) query, we would expect to get an error like " operator '<<' incompatible with type 'idset'"
-- select a << b from binoptesti_ids;
-- From the following (commented) query, we would expect to get an error like " operator '>>' incompatible with type 'idset'"
-- select a >> b from binoptesti_ids;
-- From the following (commented) query, we would expect to get an error like " operator '+' incompatible with type 'idset'"
-- select a + b from binoptesti_ids;
-- From the following (commented) query, we would expect to get an error like " operator '-' incompatible with type 'idset'"
-- select a - b from binoptesti_ids;
-- From the following (commented) query, we would expect to get an error like " operator '*' incompatible with type 'idset'"
-- select a * b from binoptesti_ids;
-- From the following (commented) query, we would expect to get an error like " operator '/' incompatible with type 'idset'"
-- select a / b from binoptesti_ids;
-- From the following (commented) query, we would expect to get an error like " operator '%' incompatible with type 'idset'"
-- select a % b from binoptesti_ids;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'int'"
-- select a || b from binoptesti_ids;


-- The following block of queries is for a test named binoptesti_s
-- First we'll create a table.
CREATE TABLE binoptesti_s (_id id,a int min 0 max 1000,b string);
-- Insert some data into the created table.
INSERT INTO binoptesti_s VALUES (1,20,'101');
-- From the following (commented) query, we would expect to get an error like "types 'int' and 'string' are not equatable"
-- select a != b from binoptesti_s;
-- From the following (commented) query, we would expect to get an error like "types 'int' and 'string' are not equatable"
-- select a = b from binoptesti_s;
-- From the following (commented) query, we would expect to get an error like " operator '<=' incompatible with type 'string'"
-- select a <= b from binoptesti_s;
-- From the following (commented) query, we would expect to get an error like " operator '>=' incompatible with type 'string'"
-- select a >= b from binoptesti_s;
-- From the following (commented) query, we would expect to get an error like " operator '<' incompatible with type 'string'"
-- select a < b from binoptesti_s;
-- From the following (commented) query, we would expect to get an error like " operator '>' incompatible with type 'string'"
-- select a > b from binoptesti_s;
-- From the following (commented) query, we would expect to get an error like " operator '&' incompatible with type 'string'"
-- select a & b from binoptesti_s;
-- From the following (commented) query, we would expect to get an error like " operator '|' incompatible with type 'string'"
-- select a | b from binoptesti_s;
-- From the following (commented) query, we would expect to get an error like " operator '<<' incompatible with type 'string'"
-- select a << b from binoptesti_s;
-- From the following (commented) query, we would expect to get an error like " operator '>>' incompatible with type 'string'"
-- select a >> b from binoptesti_s;
-- From the following (commented) query, we would expect to get an error like " operator '+' incompatible with type 'string'"
-- select a + b from binoptesti_s;
-- From the following (commented) query, we would expect to get an error like " operator '-' incompatible with type 'string'"
-- select a - b from binoptesti_s;
-- From the following (commented) query, we would expect to get an error like " operator '*' incompatible with type 'string'"
-- select a * b from binoptesti_s;
-- From the following (commented) query, we would expect to get an error like " operator '/' incompatible with type 'string'"
-- select a / b from binoptesti_s;
-- From the following (commented) query, we would expect to get an error like " operator '%' incompatible with type 'string'"
-- select a % b from binoptesti_s;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'int'"
-- select a || b from binoptesti_s;


-- The following block of queries is for a test named binoptesti_ss
-- First we'll create a table.
CREATE TABLE binoptesti_ss (_id id,a int min 0 max 1000,b stringset);
-- Insert some data into the created table.
INSERT INTO binoptesti_ss VALUES (1,20,['101','102']);
-- From the following (commented) query, we would expect to get an error like "types 'int' and 'stringset' are not equatable"
-- select a != b from binoptesti_ss;
-- From the following (commented) query, we would expect to get an error like "types 'int' and 'stringset' are not equatable"
-- select a = b from binoptesti_ss;
-- From the following (commented) query, we would expect to get an error like " operator '<=' incompatible with type 'stringset'"
-- select a <= b from binoptesti_ss;
-- From the following (commented) query, we would expect to get an error like " operator '>=' incompatible with type 'stringset'"
-- select a >= b from binoptesti_ss;
-- From the following (commented) query, we would expect to get an error like " operator '<' incompatible with type 'stringset'"
-- select a < b from binoptesti_ss;
-- From the following (commented) query, we would expect to get an error like " operator '>' incompatible with type 'stringset'"
-- select a > b from binoptesti_ss;
-- From the following (commented) query, we would expect to get an error like " operator '&' incompatible with type 'stringset'"
-- select a & b from binoptesti_ss;
-- From the following (commented) query, we would expect to get an error like " operator '|' incompatible with type 'stringset'"
-- select a | b from binoptesti_ss;
-- From the following (commented) query, we would expect to get an error like " operator '<<' incompatible with type 'stringset'"
-- select a << b from binoptesti_ss;
-- From the following (commented) query, we would expect to get an error like " operator '>>' incompatible with type 'stringset'"
-- select a >> b from binoptesti_ss;
-- From the following (commented) query, we would expect to get an error like " operator '+' incompatible with type 'stringset'"
-- select a + b from binoptesti_ss;
-- From the following (commented) query, we would expect to get an error like " operator '-' incompatible with type 'stringset'"
-- select a - b from binoptesti_ss;
-- From the following (commented) query, we would expect to get an error like " operator '*' incompatible with type 'stringset'"
-- select a * b from binoptesti_ss;
-- From the following (commented) query, we would expect to get an error like " operator '/' incompatible with type 'stringset'"
-- select a / b from binoptesti_ss;
-- From the following (commented) query, we would expect to get an error like " operator '%' incompatible with type 'stringset'"
-- select a % b from binoptesti_ss;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'int'"
-- select a || b from binoptesti_ss;


-- The following block of queries is for a test named binoptestb_i
-- First we'll create a table.
CREATE TABLE binoptestb_i (_id id,a bool,b int min 0 max 1000);
-- Insert some data into the created table.
INSERT INTO binoptestb_i VALUES (1,true,20);
-- From the following (commented) query, we would expect to get an error like "types 'bool' and 'int' are not equatable"
-- select a != b from binoptestb_i;
-- From the following (commented) query, we would expect to get an error like "types 'bool' and 'int' are not equatable"
-- select a = b from binoptestb_i;
-- From the following (commented) query, we would expect to get an error like "operator '<=' incompatible with type 'bool'"
-- select a <= b from binoptestb_i;
-- From the following (commented) query, we would expect to get an error like "operator '>=' incompatible with type 'bool'"
-- select a >= b from binoptestb_i;
-- From the following (commented) query, we would expect to get an error like "operator '<' incompatible with type 'bool'"
-- select a < b from binoptestb_i;
-- From the following (commented) query, we would expect to get an error like "operator '>' incompatible with type 'bool'"
-- select a > b from binoptestb_i;
-- From the following (commented) query, we would expect to get an error like "operator '&' incompatible with type 'bool'"
-- select a & b from binoptestb_i;
-- From the following (commented) query, we would expect to get an error like "operator '|' incompatible with type 'bool'"
-- select a | b from binoptestb_i;
-- From the following (commented) query, we would expect to get an error like "operator '<<' incompatible with type 'bool'"
-- select a << b from binoptestb_i;
-- From the following (commented) query, we would expect to get an error like "operator '>>' incompatible with type 'bool'"
-- select a >> b from binoptestb_i;
-- From the following (commented) query, we would expect to get an error like "operator '+' incompatible with type 'bool'"
-- select a + b from binoptestb_i;
-- From the following (commented) query, we would expect to get an error like "operator '-' incompatible with type 'bool'"
-- select a - b from binoptestb_i;
-- From the following (commented) query, we would expect to get an error like "operator '*' incompatible with type 'bool'"
-- select a * b from binoptestb_i;
-- From the following (commented) query, we would expect to get an error like "operator '/' incompatible with type 'bool'"
-- select a / b from binoptestb_i;
-- From the following (commented) query, we would expect to get an error like "operator '%' incompatible with type 'bool'"
-- select a % b from binoptestb_i;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'bool'"
-- select a || b from binoptestb_i;


-- The following block of queries is for a test named binoptestb_b
-- First we'll create a table.
CREATE TABLE binoptestb_b (_id id,a bool,b bool,c bool);
-- Insert some data into the created table.
INSERT INTO binoptestb_b VALUES (1,true,true,false);
select a != b from binoptestb_b;
select a = b from binoptestb_b;
select a AND b from binoptestb_b;
select a OR b from binoptestb_b;
select a AND c from binoptestb_b;
select a OR c from binoptestb_b;
-- From the following (commented) query, we would expect to get an error like "operator '<=' incompatible with type 'bool'"
-- select a <= b from binoptestb_b;
-- From the following (commented) query, we would expect to get an error like "operator '>=' incompatible with type 'bool'"
-- select a >= b from binoptestb_b;
-- From the following (commented) query, we would expect to get an error like "operator '<' incompatible with type 'bool'"
-- select a < b from binoptestb_b;
-- From the following (commented) query, we would expect to get an error like "operator '>' incompatible with type 'bool'"
-- select a > b from binoptestb_b;
-- From the following (commented) query, we would expect to get an error like "operator '&' incompatible with type 'bool'"
-- select a & b from binoptestb_b;
-- From the following (commented) query, we would expect to get an error like "operator '|' incompatible with type 'bool'"
-- select a | b from binoptestb_b;
-- From the following (commented) query, we would expect to get an error like "operator '<<' incompatible with type 'bool'"
-- select a << b from binoptestb_b;
-- From the following (commented) query, we would expect to get an error like "operator '>>' incompatible with type 'bool'"
-- select a >> b from binoptestb_b;
-- From the following (commented) query, we would expect to get an error like "operator '+' incompatible with type 'bool'"
-- select a + b from binoptestb_b;
-- From the following (commented) query, we would expect to get an error like "operator '-' incompatible with type 'bool'"
-- select a - b from binoptestb_b;
-- From the following (commented) query, we would expect to get an error like "operator '*' incompatible with type 'bool'"
-- select a * b from binoptestb_b;
-- From the following (commented) query, we would expect to get an error like "operator '/' incompatible with type 'bool'"
-- select a / b from binoptestb_b;
-- From the following (commented) query, we would expect to get an error like "operator '%' incompatible with type 'bool'"
-- select a % b from binoptestb_b;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'bool'"
-- select a || b from binoptestb_b;


-- The following block of queries is for a test named binoptestb_id
-- First we'll create a table.
CREATE TABLE binoptestb_id (_id id,b bool);
-- Insert some data into the created table.
INSERT INTO binoptestb_id VALUES (10,true);
-- From the following (commented) query, we would expect to get an error like "types 'bool' and 'id' are not equatable"
-- select b != _id from binoptestb_id;
-- From the following (commented) query, we would expect to get an error like "types 'bool' and 'id' are not equatable"
-- select b = _id from binoptestb_id;
-- From the following (commented) query, we would expect to get an error like "operator '<=' incompatible with type 'bool'"
-- select b <= _id from binoptestb_id;
-- From the following (commented) query, we would expect to get an error like "operator '>=' incompatible with type 'bool'"
-- select b >= _id from binoptestb_id;
-- From the following (commented) query, we would expect to get an error like "operator '<' incompatible with type 'bool'"
-- select b < _id from binoptestb_id;
-- From the following (commented) query, we would expect to get an error like "operator '>' incompatible with type 'bool'"
-- select b > _id from binoptestb_id;
-- From the following (commented) query, we would expect to get an error like "operator '&' incompatible with type 'bool'"
-- select b & _id from binoptestb_id;
-- From the following (commented) query, we would expect to get an error like "operator '|' incompatible with type 'bool'"
-- select b | _id from binoptestb_id;
-- From the following (commented) query, we would expect to get an error like "operator '<<' incompatible with type 'bool'"
-- select b << _id from binoptestb_id;
-- From the following (commented) query, we would expect to get an error like "operator '>>' incompatible with type 'bool'"
-- select b >> _id from binoptestb_id;
-- From the following (commented) query, we would expect to get an error like "operator '+' incompatible with type 'bool'"
-- select b + _id from binoptestb_id;
-- From the following (commented) query, we would expect to get an error like "operator '-' incompatible with type 'bool'"
-- select b - _id from binoptestb_id;
-- From the following (commented) query, we would expect to get an error like "operator '*' incompatible with type 'bool'"
-- select b * _id from binoptestb_id;
-- From the following (commented) query, we would expect to get an error like "operator '/' incompatible with type 'bool'"
-- select b / _id from binoptestb_id;
-- From the following (commented) query, we would expect to get an error like "operator '%' incompatible with type 'bool'"
-- select b % _id from binoptestb_id;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'bool'"
-- select b || _id from binoptestb_id;


-- The following block of queries is for a test named binoptestb_d
-- First we'll create a table.
CREATE TABLE binoptestb_d (_id id,a bool,d decimal(2));
-- Insert some data into the created table.
INSERT INTO binoptestb_d VALUES (1,true,12.34);
-- From the following (commented) query, we would expect to get an error like "types 'bool' and 'decimal(2)' are not equatable"
-- select a != d from binoptestb_d;
-- From the following (commented) query, we would expect to get an error like "types 'bool' and 'decimal(2)' are not equatable"
-- select a = d from binoptestb_d;
-- From the following (commented) query, we would expect to get an error like "operator '<=' incompatible with type 'bool'"
-- select a <= d from binoptestb_d;
-- From the following (commented) query, we would expect to get an error like "operator '>=' incompatible with type 'bool'"
-- select a >= d from binoptestb_d;
-- From the following (commented) query, we would expect to get an error like "operator '<' incompatible with type 'bool'"
-- select a < d from binoptestb_d;
-- From the following (commented) query, we would expect to get an error like "operator '>' incompatible with type 'bool'"
-- select a > d from binoptestb_d;
-- From the following (commented) query, we would expect to get an error like "operator '&' incompatible with type 'bool'"
-- select a & d from binoptestb_d;
-- From the following (commented) query, we would expect to get an error like "operator '|' incompatible with type 'bool'"
-- select a | d from binoptestb_d;
-- From the following (commented) query, we would expect to get an error like "operator '<<' incompatible with type 'bool'"
-- select a << d from binoptestb_d;
-- From the following (commented) query, we would expect to get an error like "operator '>>' incompatible with type 'bool'"
-- select a >> d from binoptestb_d;
-- From the following (commented) query, we would expect to get an error like "operator '+' incompatible with type 'bool'"
-- select a + d from binoptestb_d;
-- From the following (commented) query, we would expect to get an error like "operator '-' incompatible with type 'bool'"
-- select a - d from binoptestb_d;
-- From the following (commented) query, we would expect to get an error like "operator '*' incompatible with type 'bool'"
-- select a * d from binoptestb_d;
-- From the following (commented) query, we would expect to get an error like "operator '/' incompatible with type 'bool'"
-- select a / d from binoptestb_d;
-- From the following (commented) query, we would expect to get an error like "operator '%' incompatible with type 'bool'"
-- select a % d from binoptestb_d;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'bool'"
-- select a || d from binoptestb_d;


-- The following block of queries is for a test named binoptestb_ts
-- First we'll create a table.
CREATE TABLE binoptestb_ts (_id id,a bool,ts timestamp);
-- Insert some data into the created table.
INSERT INTO binoptestb_ts VALUES (1,true,'2012-11-01T22:08:41Z');
-- From the following (commented) query, we would expect to get an error like "types 'bool' and 'timestamp' are not equatable"
-- select a != ts from binoptestb_ts;
-- From the following (commented) query, we would expect to get an error like "types 'bool' and 'timestamp' are not equatable"
-- select a = ts from binoptestb_ts;
-- From the following (commented) query, we would expect to get an error like "operator '<=' incompatible with type 'bool'"
-- select a <= ts from binoptestb_ts;
-- From the following (commented) query, we would expect to get an error like "operator '>=' incompatible with type 'bool'"
-- select a >= ts from binoptestb_ts;
-- From the following (commented) query, we would expect to get an error like "operator '<' incompatible with type 'bool'"
-- select a < ts from binoptestb_ts;
-- From the following (commented) query, we would expect to get an error like "operator '>' incompatible with type 'bool'"
-- select a > ts from binoptestb_ts;
-- From the following (commented) query, we would expect to get an error like "operator '&' incompatible with type 'bool'"
-- select a & ts from binoptestb_ts;
-- From the following (commented) query, we would expect to get an error like "operator '|' incompatible with type 'bool'"
-- select a | ts from binoptestb_ts;
-- From the following (commented) query, we would expect to get an error like "operator '<<' incompatible with type 'bool'"
-- select a << ts from binoptestb_ts;
-- From the following (commented) query, we would expect to get an error like "operator '>>' incompatible with type 'bool'"
-- select a >> ts from binoptestb_ts;
-- From the following (commented) query, we would expect to get an error like "operator '+' incompatible with type 'bool'"
-- select a + ts from binoptestb_ts;
-- From the following (commented) query, we would expect to get an error like "operator '-' incompatible with type 'bool'"
-- select a - ts from binoptestb_ts;
-- From the following (commented) query, we would expect to get an error like "operator '*' incompatible with type 'bool'"
-- select a * ts from binoptestb_ts;
-- From the following (commented) query, we would expect to get an error like "operator '/' incompatible with type 'bool'"
-- select a / ts from binoptestb_ts;
-- From the following (commented) query, we would expect to get an error like "operator '%' incompatible with type 'bool'"
-- select a % ts from binoptestb_ts;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'bool'"
-- select a || ts from binoptestb_ts;


-- The following block of queries is for a test named binoptestb_ids
-- First we'll create a table.
CREATE TABLE binoptestb_ids (_id id,a bool,b idset);
-- Insert some data into the created table.
INSERT INTO binoptestb_ids VALUES (1,true,[101,102]);
-- From the following (commented) query, we would expect to get an error like "types 'bool' and 'idset' are not equatable"
-- select a != b from binoptestb_ids;
-- From the following (commented) query, we would expect to get an error like "types 'bool' and 'idset' are not equatable"
-- select a = b from binoptestb_ids;
-- From the following (commented) query, we would expect to get an error like " operator '<=' incompatible with type 'bool'"
-- select a <= b from binoptestb_ids;
-- From the following (commented) query, we would expect to get an error like " operator '>=' incompatible with type 'bool'"
-- select a >= b from binoptestb_ids;
-- From the following (commented) query, we would expect to get an error like " operator '<' incompatible with type 'bool'"
-- select a < b from binoptestb_ids;
-- From the following (commented) query, we would expect to get an error like " operator '>' incompatible with type 'bool'"
-- select a > b from binoptestb_ids;
-- From the following (commented) query, we would expect to get an error like " operator '&' incompatible with type 'bool'"
-- select a & b from binoptestb_ids;
-- From the following (commented) query, we would expect to get an error like " operator '|' incompatible with type 'bool'"
-- select a | b from binoptestb_ids;
-- From the following (commented) query, we would expect to get an error like " operator '<<' incompatible with type 'bool'"
-- select a << b from binoptestb_ids;
-- From the following (commented) query, we would expect to get an error like " operator '>>' incompatible with type 'bool'"
-- select a >> b from binoptestb_ids;
-- From the following (commented) query, we would expect to get an error like " operator '+' incompatible with type 'bool'"
-- select a + b from binoptestb_ids;
-- From the following (commented) query, we would expect to get an error like " operator '-' incompatible with type 'bool'"
-- select a - b from binoptestb_ids;
-- From the following (commented) query, we would expect to get an error like " operator '*' incompatible with type 'bool'"
-- select a * b from binoptestb_ids;
-- From the following (commented) query, we would expect to get an error like " operator '/' incompatible with type 'bool'"
-- select a / b from binoptestb_ids;
-- From the following (commented) query, we would expect to get an error like " operator '%' incompatible with type 'bool'"
-- select a % b from binoptestb_ids;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'bool'"
-- select a || b from binoptestb_ids;


-- The following block of queries is for a test named binoptestb_s
-- First we'll create a table.
CREATE TABLE binoptestb_s (_id id,a bool,b string);
-- Insert some data into the created table.
INSERT INTO binoptestb_s VALUES (1,true,'101');
-- From the following (commented) query, we would expect to get an error like "types 'bool' and 'string' are not equatable"
-- select a != b from binoptestb_s;
-- From the following (commented) query, we would expect to get an error like "types 'bool' and 'string' are not equatable"
-- select a = b from binoptestb_s;
-- From the following (commented) query, we would expect to get an error like " operator '<=' incompatible with type 'bool'"
-- select a <= b from binoptestb_s;
-- From the following (commented) query, we would expect to get an error like " operator '>=' incompatible with type 'bool'"
-- select a >= b from binoptestb_s;
-- From the following (commented) query, we would expect to get an error like " operator '<' incompatible with type 'bool'"
-- select a < b from binoptestb_s;
-- From the following (commented) query, we would expect to get an error like " operator '>' incompatible with type 'bool'"
-- select a > b from binoptestb_s;
-- From the following (commented) query, we would expect to get an error like " operator '&' incompatible with type 'bool'"
-- select a & b from binoptestb_s;
-- From the following (commented) query, we would expect to get an error like " operator '|' incompatible with type 'bool'"
-- select a | b from binoptestb_s;
-- From the following (commented) query, we would expect to get an error like " operator '<<' incompatible with type 'bool'"
-- select a << b from binoptestb_s;
-- From the following (commented) query, we would expect to get an error like " operator '>>' incompatible with type 'bool'"
-- select a >> b from binoptestb_s;
-- From the following (commented) query, we would expect to get an error like " operator '+' incompatible with type 'bool'"
-- select a + b from binoptestb_s;
-- From the following (commented) query, we would expect to get an error like " operator '-' incompatible with type 'bool'"
-- select a - b from binoptestb_s;
-- From the following (commented) query, we would expect to get an error like " operator '*' incompatible with type 'bool'"
-- select a * b from binoptestb_s;
-- From the following (commented) query, we would expect to get an error like " operator '/' incompatible with type 'bool'"
-- select a / b from binoptestb_s;
-- From the following (commented) query, we would expect to get an error like " operator '%' incompatible with type 'bool'"
-- select a % b from binoptestb_s;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'bool'"
-- select a || b from binoptestb_s;


-- The following block of queries is for a test named binoptestb_ss
-- First we'll create a table.
CREATE TABLE binoptestb_ss (_id id,a bool,b stringset);
-- Insert some data into the created table.
INSERT INTO binoptestb_ss VALUES (1,true,['101','102']);
-- From the following (commented) query, we would expect to get an error like "types 'bool' and 'stringset' are not equatable"
-- select a != b from binoptestb_ss;
-- From the following (commented) query, we would expect to get an error like "types 'bool' and 'stringset' are not equatable"
-- select a = b from binoptestb_ss;
-- From the following (commented) query, we would expect to get an error like " operator '<=' incompatible with type 'bool'"
-- select a <= b from binoptestb_ss;
-- From the following (commented) query, we would expect to get an error like " operator '>=' incompatible with type 'bool'"
-- select a >= b from binoptestb_ss;
-- From the following (commented) query, we would expect to get an error like " operator '<' incompatible with type 'bool'"
-- select a < b from binoptestb_ss;
-- From the following (commented) query, we would expect to get an error like " operator '>' incompatible with type 'bool'"
-- select a > b from binoptestb_ss;
-- From the following (commented) query, we would expect to get an error like " operator '&' incompatible with type 'bool'"
-- select a & b from binoptestb_ss;
-- From the following (commented) query, we would expect to get an error like " operator '|' incompatible with type 'bool'"
-- select a | b from binoptestb_ss;
-- From the following (commented) query, we would expect to get an error like " operator '<<' incompatible with type 'bool'"
-- select a << b from binoptestb_ss;
-- From the following (commented) query, we would expect to get an error like " operator '>>' incompatible with type 'bool'"
-- select a >> b from binoptestb_ss;
-- From the following (commented) query, we would expect to get an error like " operator '+' incompatible with type 'bool'"
-- select a + b from binoptestb_ss;
-- From the following (commented) query, we would expect to get an error like " operator '-' incompatible with type 'bool'"
-- select a - b from binoptestb_ss;
-- From the following (commented) query, we would expect to get an error like " operator '*' incompatible with type 'bool'"
-- select a * b from binoptestb_ss;
-- From the following (commented) query, we would expect to get an error like " operator '/' incompatible with type 'bool'"
-- select a / b from binoptestb_ss;
-- From the following (commented) query, we would expect to get an error like " operator '%' incompatible with type 'bool'"
-- select a % b from binoptestb_ss;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'bool'"
-- select a || b from binoptestb_ss;


-- The following block of queries is for a test named binoptestid_i
-- First we'll create a table.
CREATE TABLE binoptestid_i (_id id,b int min 0 max 1000);
-- Insert some data into the created table.
INSERT INTO binoptestid_i VALUES (10,20);
select _id != b from binoptestid_i;
select _id = b from binoptestid_i;
select _id <= b from binoptestid_i;
select _id >= b from binoptestid_i;
select _id < b from binoptestid_i;
select _id > b from binoptestid_i;
select _id & b from binoptestid_i;
select _id | b from binoptestid_i;
select _id << b from binoptestid_i;
select _id >> b from binoptestid_i;
select _id + b from binoptestid_i;
select _id - b from binoptestid_i;
select _id * b from binoptestid_i;
select _id / b from binoptestid_i;
select _id % b from binoptestid_i;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'id'"
-- select _id || b from binoptestid_i;


-- The following block of queries is for a test named binoptestid_b
-- First we'll create a table.
CREATE TABLE binoptestid_b (_id id,b bool);
-- Insert some data into the created table.
INSERT INTO binoptestid_b VALUES (10,true);
-- From the following (commented) query, we would expect to get an error like "types 'id' and 'bool' are not equatable"
-- select _id != b from binoptestid_b;
-- From the following (commented) query, we would expect to get an error like "types 'id' and 'bool' are not equatable"
-- select _id = b from binoptestid_b;
-- From the following (commented) query, we would expect to get an error like "operator '<=' incompatible with type 'bool'"
-- select _id <= b from binoptestid_b;
-- From the following (commented) query, we would expect to get an error like "operator '>=' incompatible with type 'bool'"
-- select _id >= b from binoptestid_b;
-- From the following (commented) query, we would expect to get an error like "operator '<' incompatible with type 'bool'"
-- select _id < b from binoptestid_b;
-- From the following (commented) query, we would expect to get an error like "operator '>' incompatible with type 'bool'"
-- select _id > b from binoptestid_b;
-- From the following (commented) query, we would expect to get an error like "operator '&' incompatible with type 'bool'"
-- select _id & b from binoptestid_b;
-- From the following (commented) query, we would expect to get an error like "operator '|' incompatible with type 'bool'"
-- select _id | b from binoptestid_b;
-- From the following (commented) query, we would expect to get an error like "operator '<<' incompatible with type 'bool'"
-- select _id << b from binoptestid_b;
-- From the following (commented) query, we would expect to get an error like "operator '>>' incompatible with type 'bool'"
-- select _id >> b from binoptestid_b;
-- From the following (commented) query, we would expect to get an error like "operator '+' incompatible with type 'bool'"
-- select _id + b from binoptestid_b;
-- From the following (commented) query, we would expect to get an error like "operator '-' incompatible with type 'bool'"
-- select _id - b from binoptestid_b;
-- From the following (commented) query, we would expect to get an error like "operator '*' incompatible with type 'bool'"
-- select _id * b from binoptestid_b;
-- From the following (commented) query, we would expect to get an error like "operator '/' incompatible with type 'bool'"
-- select _id / b from binoptestid_b;
-- From the following (commented) query, we would expect to get an error like "operator '%' incompatible with type 'bool'"
-- select _id % b from binoptestid_b;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'id'"
-- select _id || b from binoptestid_b;


-- The following block of queries is for a test named binoptestid_id
-- First we'll create a table.
CREATE TABLE binoptestid_id (_id id,b id);
-- Insert some data into the created table.
INSERT INTO binoptestid_id VALUES (10,20);
select _id != b from binoptestid_id;
select _id = b from binoptestid_id;
select _id <= b from binoptestid_id;
select _id >= b from binoptestid_id;
select _id < b from binoptestid_id;
select _id > b from binoptestid_id;
select _id & b from binoptestid_id;
select _id | b from binoptestid_id;
select _id << b from binoptestid_id;
select _id >> b from binoptestid_id;
select _id + b from binoptestid_id;
select _id - b from binoptestid_id;
select _id * b from binoptestid_id;
select _id / b from binoptestid_id;
select _id % b from binoptestid_id;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'id'"
-- select _id || b from binoptestid_id;
select _id + _id from binoptestid_id;
select _id - _id from binoptestid_id;


-- The following block of queries is for a test named binoptestid_d
-- First we'll create a table.
CREATE TABLE binoptestid_d (_id id,a id,d decimal(2));
-- Insert some data into the created table.
INSERT INTO binoptestid_d VALUES (1,20,12.34);
select a != d from binoptesti_d;
select a = d from binoptesti_d;
select a <= d from binoptesti_d;
select a >= d from binoptesti_d;
select a < d from binoptesti_d;
select a > d from binoptesti_d;
-- From the following (commented) query, we would expect to get an error like "operator '&' incompatible with type 'decimal(2)'"
-- select a & d from binoptesti_d;
-- From the following (commented) query, we would expect to get an error like "operator '|' incompatible with type 'decimal(2)'"
-- select a | d from binoptesti_d;
-- From the following (commented) query, we would expect to get an error like "operator '<<' incompatible with type 'decimal(2)'"
-- select a << d from binoptesti_d;
-- From the following (commented) query, we would expect to get an error like "operator '>>' incompatible with type 'decimal(2)'"
-- select a >> d from binoptesti_d;
select a + d from binoptesti_d;
select a - d from binoptesti_d;
select a * d from binoptesti_d;
select a / d from binoptesti_d;
-- From the following (commented) query, we would expect to get an error like "operator '%' incompatible with type 'decimal(2)'"
-- select a % d from binoptesti_d;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'int'"
-- select a || d from binoptesti_d;


-- The following block of queries is for a test named binoptestid_ts
-- First we'll create a table.
CREATE TABLE binoptestid_ts (_id id,a id,ts timestamp);
-- Insert some data into the created table.
INSERT INTO binoptestid_ts VALUES (1,20,'2012-11-01T22:08:41Z');
-- From the following (commented) query, we would expect to get an error like "types 'int' and 'timestamp' are not equatable"
-- select a != ts from binoptesti_ts;
-- From the following (commented) query, we would expect to get an error like "types 'int' and 'timestamp' are not equatable"
-- select a = ts from binoptesti_ts;
-- From the following (commented) query, we would expect to get an error like "types 'int' and 'timestamp' are not equatable"
-- select a <= ts from binoptesti_ts;
-- From the following (commented) query, we would expect to get an error like "types 'int' and 'timestamp' are not equatable"
-- select a >= ts from binoptesti_ts;
-- From the following (commented) query, we would expect to get an error like "types 'int' and 'timestamp' are not equatable"
-- select a < ts from binoptesti_ts;
-- From the following (commented) query, we would expect to get an error like "types 'int' and 'timestamp' are not equatable"
-- select a > ts from binoptesti_ts;
-- From the following (commented) query, we would expect to get an error like "operator '&' incompatible with type 'timestamp'"
-- select a & ts from binoptesti_ts;
-- From the following (commented) query, we would expect to get an error like "operator '|' incompatible with type 'timestamp'"
-- select a | ts from binoptesti_ts;
-- From the following (commented) query, we would expect to get an error like "operator '<<' incompatible with type 'timestamp'"
-- select a << ts from binoptesti_ts;
-- From the following (commented) query, we would expect to get an error like "operator '>>' incompatible with type 'timestamp'"
-- select a >> ts from binoptesti_ts;
-- From the following (commented) query, we would expect to get an error like "operator '+' incompatible with type 'timestamp'"
-- select a + ts from binoptesti_ts;
-- From the following (commented) query, we would expect to get an error like "operator '-' incompatible with type 'timestamp'"
-- select a - ts from binoptesti_ts;
-- From the following (commented) query, we would expect to get an error like "operator '*' incompatible with type 'timestamp'"
-- select a * ts from binoptesti_ts;
-- From the following (commented) query, we would expect to get an error like "operator '/' incompatible with type 'timestamp'"
-- select a / ts from binoptesti_ts;
-- From the following (commented) query, we would expect to get an error like "operator '%' incompatible with type 'timestamp'"
-- select a % ts from binoptesti_ts;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'int'"
-- select a || ts from binoptesti_ts;


-- The following block of queries is for a test named binoptestid_ids
-- First we'll create a table.
CREATE TABLE binoptestid_ids (_id id,a id,b idset);
-- Insert some data into the created table.
INSERT INTO binoptestid_ids VALUES (1,20,[101,102]);
-- From the following (commented) query, we would expect to get an error like "types 'int' and 'idset' are not equatable"
-- select a != b from binoptesti_ids;
-- From the following (commented) query, we would expect to get an error like "types 'int' and 'idset' are not equatable"
-- select a = b from binoptesti_ids;
-- From the following (commented) query, we would expect to get an error like " operator '<=' incompatible with type 'idset'"
-- select a <= b from binoptesti_ids;
-- From the following (commented) query, we would expect to get an error like " operator '>=' incompatible with type 'idset'"
-- select a >= b from binoptesti_ids;
-- From the following (commented) query, we would expect to get an error like " operator '<' incompatible with type 'idset'"
-- select a < b from binoptesti_ids;
-- From the following (commented) query, we would expect to get an error like " operator '>' incompatible with type 'idset'"
-- select a > b from binoptesti_ids;
-- From the following (commented) query, we would expect to get an error like " operator '&' incompatible with type 'idset'"
-- select a & b from binoptesti_ids;
-- From the following (commented) query, we would expect to get an error like " operator '|' incompatible with type 'idset'"
-- select a | b from binoptesti_ids;
-- From the following (commented) query, we would expect to get an error like " operator '<<' incompatible with type 'idset'"
-- select a << b from binoptesti_ids;
-- From the following (commented) query, we would expect to get an error like " operator '>>' incompatible with type 'idset'"
-- select a >> b from binoptesti_ids;
-- From the following (commented) query, we would expect to get an error like " operator '+' incompatible with type 'idset'"
-- select a + b from binoptesti_ids;
-- From the following (commented) query, we would expect to get an error like " operator '-' incompatible with type 'idset'"
-- select a - b from binoptesti_ids;
-- From the following (commented) query, we would expect to get an error like " operator '*' incompatible with type 'idset'"
-- select a * b from binoptesti_ids;
-- From the following (commented) query, we would expect to get an error like " operator '/' incompatible with type 'idset'"
-- select a / b from binoptesti_ids;
-- From the following (commented) query, we would expect to get an error like " operator '%' incompatible with type 'idset'"
-- select a % b from binoptesti_ids;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'int'"
-- select a || b from binoptesti_ids;


-- The following block of queries is for a test named binoptestid_s
-- First we'll create a table.
CREATE TABLE binoptestid_s (_id id,a id,b string);
-- Insert some data into the created table.
INSERT INTO binoptestid_s VALUES (1,20,'101');
-- From the following (commented) query, we would expect to get an error like "types 'int' and 'string' are not equatable"
-- select a != b from binoptesti_s;
-- From the following (commented) query, we would expect to get an error like "types 'int' and 'string' are not equatable"
-- select a = b from binoptesti_s;
-- From the following (commented) query, we would expect to get an error like " operator '<=' incompatible with type 'string'"
-- select a <= b from binoptesti_s;
-- From the following (commented) query, we would expect to get an error like " operator '>=' incompatible with type 'string'"
-- select a >= b from binoptesti_s;
-- From the following (commented) query, we would expect to get an error like " operator '<' incompatible with type 'string'"
-- select a < b from binoptesti_s;
-- From the following (commented) query, we would expect to get an error like " operator '>' incompatible with type 'string'"
-- select a > b from binoptesti_s;
-- From the following (commented) query, we would expect to get an error like " operator '&' incompatible with type 'string'"
-- select a & b from binoptesti_s;
-- From the following (commented) query, we would expect to get an error like " operator '|' incompatible with type 'string'"
-- select a | b from binoptesti_s;
-- From the following (commented) query, we would expect to get an error like " operator '<<' incompatible with type 'string'"
-- select a << b from binoptesti_s;
-- From the following (commented) query, we would expect to get an error like " operator '>>' incompatible with type 'string'"
-- select a >> b from binoptesti_s;
-- From the following (commented) query, we would expect to get an error like " operator '+' incompatible with type 'string'"
-- select a + b from binoptesti_s;
-- From the following (commented) query, we would expect to get an error like " operator '-' incompatible with type 'string'"
-- select a - b from binoptesti_s;
-- From the following (commented) query, we would expect to get an error like " operator '*' incompatible with type 'string'"
-- select a * b from binoptesti_s;
-- From the following (commented) query, we would expect to get an error like " operator '/' incompatible with type 'string'"
-- select a / b from binoptesti_s;
-- From the following (commented) query, we would expect to get an error like " operator '%' incompatible with type 'string'"
-- select a % b from binoptesti_s;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'int'"
-- select a || b from binoptesti_s;


-- The following block of queries is for a test named binoptestid_ss
-- First we'll create a table.
CREATE TABLE binoptestid_ss (_id id,a id,b stringset);
-- Insert some data into the created table.
INSERT INTO binoptestid_ss VALUES (1,20,['101','102']);
-- From the following (commented) query, we would expect to get an error like "types 'int' and 'stringset' are not equatable"
-- select a != b from binoptesti_ss;
-- From the following (commented) query, we would expect to get an error like "types 'int' and 'stringset' are not equatable"
-- select a = b from binoptesti_ss;
-- From the following (commented) query, we would expect to get an error like " operator '<=' incompatible with type 'stringset'"
-- select a <= b from binoptesti_ss;
-- From the following (commented) query, we would expect to get an error like " operator '>=' incompatible with type 'stringset'"
-- select a >= b from binoptesti_ss;
-- From the following (commented) query, we would expect to get an error like " operator '<' incompatible with type 'stringset'"
-- select a < b from binoptesti_ss;
-- From the following (commented) query, we would expect to get an error like " operator '>' incompatible with type 'stringset'"
-- select a > b from binoptesti_ss;
-- From the following (commented) query, we would expect to get an error like " operator '&' incompatible with type 'stringset'"
-- select a & b from binoptesti_ss;
-- From the following (commented) query, we would expect to get an error like " operator '|' incompatible with type 'stringset'"
-- select a | b from binoptesti_ss;
-- From the following (commented) query, we would expect to get an error like " operator '<<' incompatible with type 'stringset'"
-- select a << b from binoptesti_ss;
-- From the following (commented) query, we would expect to get an error like " operator '>>' incompatible with type 'stringset'"
-- select a >> b from binoptesti_ss;
-- From the following (commented) query, we would expect to get an error like " operator '+' incompatible with type 'stringset'"
-- select a + b from binoptesti_ss;
-- From the following (commented) query, we would expect to get an error like " operator '-' incompatible with type 'stringset'"
-- select a - b from binoptesti_ss;
-- From the following (commented) query, we would expect to get an error like " operator '*' incompatible with type 'stringset'"
-- select a * b from binoptesti_ss;
-- From the following (commented) query, we would expect to get an error like " operator '/' incompatible with type 'stringset'"
-- select a / b from binoptesti_ss;
-- From the following (commented) query, we would expect to get an error like " operator '%' incompatible with type 'stringset'"
-- select a % b from binoptesti_ss;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'int'"
-- select a || b from binoptesti_ss;


-- The following block of queries is for a test named binoptestdec_i
-- First we'll create a table.
CREATE TABLE binoptestdec_i (_id id,b int min 0 max 1000,d decimal(2));
-- Insert some data into the created table.
INSERT INTO binoptestdec_i VALUES (10,20,12.34);
select d != b from binoptestdec_i;
select d = b from binoptestdec_i;
select d <= b from binoptestdec_i;
select d >= b from binoptestdec_i;
select d < b from binoptestdec_i;
select d > b from binoptestdec_i;
-- From the following (commented) query, we would expect to get an error like "operator '&' incompatible with type 'decimal(2)'"
-- select d & b from binoptestdec_i;
-- From the following (commented) query, we would expect to get an error like "operator '|' incompatible with type 'decimal(2)'"
-- select d | b from binoptestdec_i;
-- From the following (commented) query, we would expect to get an error like "operator '<<' incompatible with type 'decimal(2)'"
-- select d << b from binoptestdec_i;
-- From the following (commented) query, we would expect to get an error like "operator '>>' incompatible with type 'decimal(2)'"
-- select d >> b from binoptestdec_i;
select d + b from binoptestdec_i;
select d - b from binoptestdec_i;
select d * b from binoptestdec_i;
select d / b from binoptestdec_i;
-- From the following (commented) query, we would expect to get an error like "operator '%' incompatible with type 'decimal(2)'"
-- select d % b from binoptestdec_i;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'decimal(2)'"
-- select d || b from binoptestdec_i;


-- The following block of queries is for a test named binoptestdec_b
-- First we'll create a table.
CREATE TABLE binoptestdec_b (_id id,b bool,d decimal(2));
-- Insert some data into the created table.
INSERT INTO binoptestdec_b VALUES (10,true,12.34);
-- From the following (commented) query, we would expect to get an error like "types 'decimal(2)' and 'bool' are not equatable"
-- select d != b from binoptestdec_b;
-- From the following (commented) query, we would expect to get an error like "types 'decimal(2)' and 'bool' are not equatable"
-- select d = b from binoptestdec_b;
-- From the following (commented) query, we would expect to get an error like "operator '<=' incompatible with type 'bool'"
-- select d <= b from binoptestdec_b;
-- From the following (commented) query, we would expect to get an error like "operator '>=' incompatible with type 'bool'"
-- select d >= b from binoptestdec_b;
-- From the following (commented) query, we would expect to get an error like "operator '<' incompatible with type 'bool'"
-- select d < b from binoptestdec_b;
-- From the following (commented) query, we would expect to get an error like "operator '>' incompatible with type 'bool'"
-- select d > b from binoptestdec_b;
-- From the following (commented) query, we would expect to get an error like "operator '&' incompatible with type 'decimal(2)'"
-- select d & b from binoptestdec_b;
-- From the following (commented) query, we would expect to get an error like "operator '|' incompatible with type 'decimal(2)'"
-- select d | b from binoptestdec_b;
-- From the following (commented) query, we would expect to get an error like "operator '<<' incompatible with type 'decimal(2)'"
-- select d << b from binoptestdec_b;
-- From the following (commented) query, we would expect to get an error like "operator '>>' incompatible with type 'decimal(2)'"
-- select d >> b from binoptestdec_b;
-- From the following (commented) query, we would expect to get an error like "operator '+' incompatible with type 'bool'"
-- select d + b from binoptestdec_b;
-- From the following (commented) query, we would expect to get an error like "operator '-' incompatible with type 'bool'"
-- select d - b from binoptestdec_b;
-- From the following (commented) query, we would expect to get an error like "operator '*' incompatible with type 'bool'"
-- select d * b from binoptestdec_b;
-- From the following (commented) query, we would expect to get an error like "operator '/' incompatible with type 'bool'"
-- select d / b from binoptestdec_b;
-- From the following (commented) query, we would expect to get an error like "operator '%' incompatible with type 'decimal(2)'"
-- select d % b from binoptestdec_b;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'decimal(2)'"
-- select d || b from binoptestdec_b;


-- The following block of queries is for a test named binoptestdec_id
-- First we'll create a table.
CREATE TABLE binoptestdec_id (_id id,b id,d decimal(2));
-- Insert some data into the created table.
INSERT INTO binoptestdec_id VALUES (10,20,12.34);
select d != b from binoptestdec_id;
select d = b from binoptestdec_id;
select d <= b from binoptestdec_id;
select d >= b from binoptestdec_id;
select d < b from binoptestdec_id;
select d > b from binoptestdec_id;
-- From the following (commented) query, we would expect to get an error like "operator '&' incompatible with type 'decimal(2)'"
-- select d & b from binoptestdec_id;
-- From the following (commented) query, we would expect to get an error like "operator '|' incompatible with type 'decimal(2)'"
-- select d | b from binoptestdec_id;
-- From the following (commented) query, we would expect to get an error like "operator '<<' incompatible with type 'decimal(2)'"
-- select d << b from binoptestdec_id;
-- From the following (commented) query, we would expect to get an error like "operator '>>' incompatible with type 'decimal(2)'"
-- select d >> b from binoptestdec_id;
select d + b from binoptestdec_id;
select d - b from binoptestdec_id;
select d * b from binoptestdec_id;
select d / b from binoptestdec_id;
-- From the following (commented) query, we would expect to get an error like "operator '%' incompatible with type 'decimal(2)'"
-- select d % b from binoptestdec_id;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'decimal(2)'"
-- select d || b from binoptestdec_id;


-- The following block of queries is for a test named binoptestdec_d
-- First we'll create a table.
CREATE TABLE binoptestdec_d (_id id,a decimal(2),d decimal(2));
-- Insert some data into the created table.
INSERT INTO binoptestdec_d VALUES (1,20.00,12.34);
select a != d from binoptestdec_d;
select a = d from binoptestdec_d;
select a <= d from binoptestdec_d;
select a >= d from binoptestdec_d;
select a < d from binoptestdec_d;
select a > d from binoptestdec_d;
-- From the following (commented) query, we would expect to get an error like "operator '&' incompatible with type 'decimal(2)'"
-- select a & d from binoptestdec_d;
-- From the following (commented) query, we would expect to get an error like "operator '|' incompatible with type 'decimal(2)'"
-- select a | d from binoptestdec_d;
-- From the following (commented) query, we would expect to get an error like "operator '<<' incompatible with type 'decimal(2)'"
-- select a << d from binoptestdec_d;
-- From the following (commented) query, we would expect to get an error like "operator '>>' incompatible with type 'decimal(2)'"
-- select a >> d from binoptestdec_d;
select a + d from binoptestdec_d;
select a - d from binoptestdec_d;
select a * d from binoptestdec_d;
select a / d from binoptestdec_d;
-- From the following (commented) query, we would expect to get an error like "operator '%' incompatible with type 'decimal(2)'"
-- select a % d from binoptestdec_d;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'decimal(2)'"
-- select a || d from binoptestdec_d;


-- The following block of queries is for a test named binoptestdec_ts
-- First we'll create a table.
CREATE TABLE binoptestdec_ts (_id id,a decimal(2),ts timestamp);
-- Insert some data into the created table.
INSERT INTO binoptestdec_ts VALUES (1,20.00,'2012-11-01T22:08:41Z');
-- From the following (commented) query, we would expect to get an error like "types 'decimal(2)' and 'timestamp' are not equatable"
-- select a != ts from binoptestdec_ts;
-- From the following (commented) query, we would expect to get an error like "types 'decimal(2)' and 'timestamp' are not equatable"
-- select a = ts from binoptestdec_ts;
-- From the following (commented) query, we would expect to get an error like "types 'decimal(2)' and 'timestamp' are not equatable"
-- select a <= ts from binoptestdec_ts;
-- From the following (commented) query, we would expect to get an error like "types 'decimal(2)' and 'timestamp' are not equatable"
-- select a >= ts from binoptestdec_ts;
-- From the following (commented) query, we would expect to get an error like "types 'decimal(2)' and 'timestamp' are not equatable"
-- select a < ts from binoptestdec_ts;
-- From the following (commented) query, we would expect to get an error like "types 'decimal(2)' and 'timestamp' are not equatable"
-- select a > ts from binoptestdec_ts;
-- From the following (commented) query, we would expect to get an error like "operator '&' incompatible with type 'decimal(2)'"
-- select a & ts from binoptestdec_ts;
-- From the following (commented) query, we would expect to get an error like "operator '|' incompatible with type 'decimal(2)'"
-- select a | ts from binoptestdec_ts;
-- From the following (commented) query, we would expect to get an error like "operator '<<' incompatible with type 'decimal(2)'"
-- select a << ts from binoptestdec_ts;
-- From the following (commented) query, we would expect to get an error like "operator '>>' incompatible with type 'decimal(2)'"
-- select a >> ts from binoptestdec_ts;
-- From the following (commented) query, we would expect to get an error like "operator '+' incompatible with type 'timestamp'"
-- select a + ts from binoptestdec_ts;
-- From the following (commented) query, we would expect to get an error like "operator '-' incompatible with type 'timestamp'"
-- select a - ts from binoptestdec_ts;
-- From the following (commented) query, we would expect to get an error like "operator '*' incompatible with type 'timestamp'"
-- select a * ts from binoptestdec_ts;
-- From the following (commented) query, we would expect to get an error like "operator '/' incompatible with type 'timestamp'"
-- select a / ts from binoptestdec_ts;
-- From the following (commented) query, we would expect to get an error like "operator '%' incompatible with type 'decimal(2)'"
-- select a % ts from binoptestdec_ts;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'decimal(2)'"
-- select a || ts from binoptestdec_ts;


-- The following block of queries is for a test named binoptestdec_ids
-- First we'll create a table.
CREATE TABLE binoptestdec_ids (_id id,a decimal(2),b idset);
-- Insert some data into the created table.
INSERT INTO binoptestdec_ids VALUES (1,20.00,[101,102]);
-- From the following (commented) query, we would expect to get an error like "types 'decimal(2)' and 'idset' are not equatable"
-- select a != b from binoptestdec_ids;
-- From the following (commented) query, we would expect to get an error like "types 'decimal(2)' and 'idset' are not equatable"
-- select a = b from binoptestdec_ids;
-- From the following (commented) query, we would expect to get an error like " operator '<=' incompatible with type 'idset'"
-- select a <= b from binoptestdec_ids;
-- From the following (commented) query, we would expect to get an error like " operator '>=' incompatible with type 'idset'"
-- select a >= b from binoptestdec_ids;
-- From the following (commented) query, we would expect to get an error like " operator '<' incompatible with type 'idset'"
-- select a < b from binoptestdec_ids;
-- From the following (commented) query, we would expect to get an error like " operator '>' incompatible with type 'idset'"
-- select a > b from binoptestdec_ids;
-- From the following (commented) query, we would expect to get an error like " operator '&' incompatible with type 'decimal(2)'"
-- select a & b from binoptestdec_ids;
-- From the following (commented) query, we would expect to get an error like " operator '|' incompatible with type 'decimal(2)'"
-- select a | b from binoptestdec_ids;
-- From the following (commented) query, we would expect to get an error like " operator '<<' incompatible with type 'decimal(2)'"
-- select a << b from binoptestdec_ids;
-- From the following (commented) query, we would expect to get an error like " operator '>>' incompatible with type 'decimal(2)'"
-- select a >> b from binoptestdec_ids;
-- From the following (commented) query, we would expect to get an error like " operator '+' incompatible with type 'idset'"
-- select a + b from binoptestdec_ids;
-- From the following (commented) query, we would expect to get an error like " operator '-' incompatible with type 'idset'"
-- select a - b from binoptestdec_ids;
-- From the following (commented) query, we would expect to get an error like " operator '*' incompatible with type 'idset'"
-- select a * b from binoptestdec_ids;
-- From the following (commented) query, we would expect to get an error like " operator '/' incompatible with type 'idset'"
-- select a / b from binoptestdec_ids;
-- From the following (commented) query, we would expect to get an error like " operator '%' incompatible with type 'decimal(2)'"
-- select a % b from binoptestdec_ids;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'decimal(2)'"
-- select a || b from binoptestdec_ids;


-- The following block of queries is for a test named binoptestdec_s
-- First we'll create a table.
CREATE TABLE binoptestdec_s (_id id,a decimal(2),b string);
-- Insert some data into the created table.
INSERT INTO binoptestdec_s VALUES (1,20.00,'101');
-- From the following (commented) query, we would expect to get an error like "types 'decimal(2)' and 'string' are not equatable"
-- select a != b from binoptestdec_s;
-- From the following (commented) query, we would expect to get an error like "types 'decimal(2)' and 'string' are not equatable"
-- select a = b from binoptestdec_s;
-- From the following (commented) query, we would expect to get an error like " operator '<=' incompatible with type 'string'"
-- select a <= b from binoptestdec_s;
-- From the following (commented) query, we would expect to get an error like " operator '>=' incompatible with type 'string'"
-- select a >= b from binoptestdec_s;
-- From the following (commented) query, we would expect to get an error like " operator '<' incompatible with type 'string'"
-- select a < b from binoptestdec_s;
-- From the following (commented) query, we would expect to get an error like " operator '>' incompatible with type 'string'"
-- select a > b from binoptestdec_s;
-- From the following (commented) query, we would expect to get an error like " operator '&' incompatible with type 'decimal(2)'"
-- select a & b from binoptestdec_s;
-- From the following (commented) query, we would expect to get an error like " operator '|' incompatible with type 'decimal(2)'"
-- select a | b from binoptestdec_s;
-- From the following (commented) query, we would expect to get an error like " operator '<<' incompatible with type 'decimal(2)'"
-- select a << b from binoptestdec_s;
-- From the following (commented) query, we would expect to get an error like " operator '>>' incompatible with type 'decimal(2)'"
-- select a >> b from binoptestdec_s;
-- From the following (commented) query, we would expect to get an error like " operator '+' incompatible with type 'string'"
-- select a + b from binoptestdec_s;
-- From the following (commented) query, we would expect to get an error like " operator '-' incompatible with type 'string'"
-- select a - b from binoptestdec_s;
-- From the following (commented) query, we would expect to get an error like " operator '*' incompatible with type 'string'"
-- select a * b from binoptestdec_s;
-- From the following (commented) query, we would expect to get an error like " operator '/' incompatible with type 'string'"
-- select a / b from binoptestdec_s;
-- From the following (commented) query, we would expect to get an error like " operator '%' incompatible with type 'decimal(2)'"
-- select a % b from binoptestdec_s;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'decimal(2)'"
-- select a || b from binoptestdec_s;


-- The following block of queries is for a test named binoptestdec_ss
-- First we'll create a table.
CREATE TABLE binoptestdec_ss (_id id,a decimal(2),b stringset);
-- Insert some data into the created table.
INSERT INTO binoptestdec_ss VALUES (1,20.00,['101','102']);
-- From the following (commented) query, we would expect to get an error like "types 'decimal(2)' and 'stringset' are not equatable"
-- select a != b from binoptestdec_ss;
-- From the following (commented) query, we would expect to get an error like "types 'decimal(2)' and 'stringset' are not equatable"
-- select a = b from binoptestdec_ss;
-- From the following (commented) query, we would expect to get an error like " operator '<=' incompatible with type 'stringset'"
-- select a <= b from binoptestdec_ss;
-- From the following (commented) query, we would expect to get an error like " operator '>=' incompatible with type 'stringset'"
-- select a >= b from binoptestdec_ss;
-- From the following (commented) query, we would expect to get an error like " operator '<' incompatible with type 'stringset'"
-- select a < b from binoptestdec_ss;
-- From the following (commented) query, we would expect to get an error like " operator '>' incompatible with type 'stringset'"
-- select a > b from binoptestdec_ss;
-- From the following (commented) query, we would expect to get an error like " operator '&' incompatible with type 'decimal(2)'"
-- select a & b from binoptestdec_ss;
-- From the following (commented) query, we would expect to get an error like " operator '|' incompatible with type 'decimal(2)'"
-- select a | b from binoptestdec_ss;
-- From the following (commented) query, we would expect to get an error like " operator '<<' incompatible with type 'decimal(2)'"
-- select a << b from binoptestdec_ss;
-- From the following (commented) query, we would expect to get an error like " operator '>>' incompatible with type 'decimal(2)'"
-- select a >> b from binoptestdec_ss;
-- From the following (commented) query, we would expect to get an error like " operator '+' incompatible with type 'stringset'"
-- select a + b from binoptestdec_ss;
-- From the following (commented) query, we would expect to get an error like " operator '-' incompatible with type 'stringset'"
-- select a - b from binoptestdec_ss;
-- From the following (commented) query, we would expect to get an error like " operator '*' incompatible with type 'stringset'"
-- select a * b from binoptestdec_ss;
-- From the following (commented) query, we would expect to get an error like " operator '/' incompatible with type 'stringset'"
-- select a / b from binoptestdec_ss;
-- From the following (commented) query, we would expect to get an error like " operator '%' incompatible with type 'decimal(2)'"
-- select a % b from binoptestdec_ss;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'decimal(2)'"
-- select a || b from binoptestdec_ss;


-- The following block of queries is for a test named binoptestts_i
-- First we'll create a table.
CREATE TABLE binoptestts_i (_id id,b int min 0 max 1000,d timestamp);
-- Insert some data into the created table.
INSERT INTO binoptestts_i VALUES (10,20,'2012-11-01T22:08:41Z');
-- From the following (commented) query, we would expect to get an error like "types 'timestamp' and 'int' are not equatable"
-- select d != b from binoptestts_i;
-- From the following (commented) query, we would expect to get an error like "types 'timestamp' and 'int' are not equatable"
-- select d = b from binoptestts_i;
-- From the following (commented) query, we would expect to get an error like "types 'timestamp' and 'int' are not equatable"
-- select d <= b from binoptestts_i;
-- From the following (commented) query, we would expect to get an error like "types 'timestamp' and 'int' are not equatable"
-- select d >= b from binoptestts_i;
-- From the following (commented) query, we would expect to get an error like "types 'timestamp' and 'int' are not equatable"
-- select d < b from binoptestts_i;
-- From the following (commented) query, we would expect to get an error like "types 'timestamp' and 'int' are not equatable"
-- select d > b from binoptestts_i;
-- From the following (commented) query, we would expect to get an error like "operator '&' incompatible with type 'timestamp'"
-- select d & b from binoptestts_i;
-- From the following (commented) query, we would expect to get an error like "operator '|' incompatible with type 'timestamp'"
-- select d | b from binoptestts_i;
-- From the following (commented) query, we would expect to get an error like "operator '<<' incompatible with type 'timestamp'"
-- select d << b from binoptestts_i;
-- From the following (commented) query, we would expect to get an error like "operator '>>' incompatible with type 'timestamp'"
-- select d >> b from binoptestts_i;
-- From the following (commented) query, we would expect to get an error like "operator '+' incompatible with type 'timestamp'"
-- select d + b from binoptestts_i;
-- From the following (commented) query, we would expect to get an error like "operator '-' incompatible with type 'timestamp'"
-- select d - b from binoptestts_i;
-- From the following (commented) query, we would expect to get an error like "operator '*' incompatible with type 'timestamp'"
-- select d * b from binoptestts_i;
-- From the following (commented) query, we would expect to get an error like "operator '/' incompatible with type 'timestamp'"
-- select d / b from binoptestts_i;
-- From the following (commented) query, we would expect to get an error like "operator '%' incompatible with type 'timestamp'"
-- select d % b from binoptestts_i;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'timestamp'"
-- select d || b from binoptestts_i;


-- The following block of queries is for a test named binoptestts_b
-- First we'll create a table.
CREATE TABLE binoptestts_b (_id id,b bool,d timestamp);
-- Insert some data into the created table.
INSERT INTO binoptestts_b VALUES (10,true,'2012-11-01T22:08:41Z');
-- From the following (commented) query, we would expect to get an error like "types 'timestamp' and 'bool' are not equatable"
-- select d != b from binoptestts_b;
-- From the following (commented) query, we would expect to get an error like "types 'timestamp' and 'bool' are not equatable"
-- select d = b from binoptestts_b;
-- From the following (commented) query, we would expect to get an error like "operator '<=' incompatible with type 'bool'"
-- select d <= b from binoptestts_b;
-- From the following (commented) query, we would expect to get an error like "operator '>=' incompatible with type 'bool'"
-- select d >= b from binoptestts_b;
-- From the following (commented) query, we would expect to get an error like "operator '<' incompatible with type 'bool'"
-- select d < b from binoptestts_b;
-- From the following (commented) query, we would expect to get an error like "operator '>' incompatible with type 'bool'"
-- select d > b from binoptestts_b;
-- From the following (commented) query, we would expect to get an error like "operator '&' incompatible with type 'timestamp'"
-- select d & b from binoptestts_b;
-- From the following (commented) query, we would expect to get an error like "operator '|' incompatible with type 'timestamp'"
-- select d | b from binoptestts_b;
-- From the following (commented) query, we would expect to get an error like "operator '<<' incompatible with type 'timestamp'"
-- select d << b from binoptestts_b;
-- From the following (commented) query, we would expect to get an error like "operator '>>' incompatible with type 'timestamp'"
-- select d >> b from binoptestts_b;
-- From the following (commented) query, we would expect to get an error like "operator '+' incompatible with type 'timestamp'"
-- select d + b from binoptestts_b;
-- From the following (commented) query, we would expect to get an error like "operator '-' incompatible with type 'timestamp'"
-- select d - b from binoptestts_b;
-- From the following (commented) query, we would expect to get an error like "operator '*' incompatible with type 'timestamp'"
-- select d * b from binoptestts_b;
-- From the following (commented) query, we would expect to get an error like "operator '/' incompatible with type 'timestamp'"
-- select d / b from binoptestts_b;
-- From the following (commented) query, we would expect to get an error like "operator '%' incompatible with type 'timestamp'"
-- select d % b from binoptestts_b;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'timestamp'"
-- select d || b from binoptestts_b;


-- The following block of queries is for a test named binoptestts_id
-- First we'll create a table.
CREATE TABLE binoptestts_id (_id id,b id,d timestamp);
-- Insert some data into the created table.
INSERT INTO binoptestts_id VALUES (10,20,'2012-11-01T22:08:41Z');
-- From the following (commented) query, we would expect to get an error like "types 'timestamp' and 'id' are not equatable"
-- select d != b from binoptestts_id;
-- From the following (commented) query, we would expect to get an error like "types 'timestamp' and 'id' are not equatable"
-- select d = b from binoptestts_id;
-- From the following (commented) query, we would expect to get an error like "types 'timestamp' and 'id' are not equatable"
-- select d <= b from binoptestts_id;
-- From the following (commented) query, we would expect to get an error like "types 'timestamp' and 'id' are not equatable"
-- select d >= b from binoptestts_id;
-- From the following (commented) query, we would expect to get an error like "types 'timestamp' and 'id' are not equatable"
-- select d < b from binoptestts_id;
-- From the following (commented) query, we would expect to get an error like "types 'timestamp' and 'id' are not equatable"
-- select d > b from binoptestts_id;
-- From the following (commented) query, we would expect to get an error like "operator '&' incompatible with type 'timestamp'"
-- select d & b from binoptestts_id;
-- From the following (commented) query, we would expect to get an error like "operator '|' incompatible with type 'timestamp'"
-- select d | b from binoptestts_id;
-- From the following (commented) query, we would expect to get an error like "operator '<<' incompatible with type 'timestamp'"
-- select d << b from binoptestts_id;
-- From the following (commented) query, we would expect to get an error like "operator '>>' incompatible with type 'timestamp'"
-- select d >> b from binoptestts_id;
-- From the following (commented) query, we would expect to get an error like "operator '+' incompatible with type 'timestamp'"
-- select d + b from binoptestts_id;
-- From the following (commented) query, we would expect to get an error like "operator '-' incompatible with type 'timestamp'"
-- select d - b from binoptestts_id;
-- From the following (commented) query, we would expect to get an error like "operator '*' incompatible with type 'timestamp'"
-- select d * b from binoptestts_id;
-- From the following (commented) query, we would expect to get an error like "operator '/' incompatible with type 'timestamp'"
-- select d / b from binoptestts_id;
-- From the following (commented) query, we would expect to get an error like "operator '%' incompatible with type 'timestamp'"
-- select d % b from binoptestts_id;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'timestamp'"
-- select d || b from binoptestts_id;


-- The following block of queries is for a test named binoptestts_d
-- First we'll create a table.
CREATE TABLE binoptestts_d (_id id,a timestamp,d decimal(2));
-- Insert some data into the created table.
INSERT INTO binoptestts_d VALUES (1,'2012-11-01T22:08:41Z',12.34);
-- From the following (commented) query, we would expect to get an error like "types 'timestamp' and 'decimal(2)' are not equatable"
-- select a != d from binoptestts_d;
-- From the following (commented) query, we would expect to get an error like "types 'timestamp' and 'decimal(2)' are not equatable"
-- select a = d from binoptestts_d;
-- From the following (commented) query, we would expect to get an error like "types 'timestamp' and 'decimal(2)' are not equatable"
-- select a <= d from binoptestts_d;
-- From the following (commented) query, we would expect to get an error like "types 'timestamp' and 'decimal(2)' are not equatable"
-- select a >= d from binoptestts_d;
-- From the following (commented) query, we would expect to get an error like "types 'timestamp' and 'decimal(2)' are not equatable"
-- select a < d from binoptestts_d;
-- From the following (commented) query, we would expect to get an error like "types 'timestamp' and 'decimal(2)' are not equatable"
-- select a > d from binoptestts_d;
-- From the following (commented) query, we would expect to get an error like "operator '&' incompatible with type 'timestamp'"
-- select a & d from binoptestts_d;
-- From the following (commented) query, we would expect to get an error like "operator '|' incompatible with type 'timestamp'"
-- select a | d from binoptestts_d;
-- From the following (commented) query, we would expect to get an error like "operator '<<' incompatible with type 'timestamp'"
-- select a << d from binoptestts_d;
-- From the following (commented) query, we would expect to get an error like "operator '>>' incompatible with type 'timestamp'"
-- select a >> d from binoptestts_d;
-- From the following (commented) query, we would expect to get an error like "operator '+' incompatible with type 'timestamp'"
-- select a + d from binoptestts_d;
-- From the following (commented) query, we would expect to get an error like "operator '-' incompatible with type 'timestamp'"
-- select a - d from binoptestts_d;
-- From the following (commented) query, we would expect to get an error like "operator '*' incompatible with type 'timestamp'"
-- select a * d from binoptestts_d;
-- From the following (commented) query, we would expect to get an error like "operator '/' incompatible with type 'timestamp'"
-- select a / d from binoptestts_d;
-- From the following (commented) query, we would expect to get an error like "operator '%' incompatible with type 'timestamp'"
-- select a % d from binoptestts_d;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'timestamp'"
-- select a || d from binoptestts_d;


-- The following block of queries is for a test named binoptestts_ts
-- First we'll create a table.
CREATE TABLE binoptestts_ts (_id id,a timestamp,ts timestamp);
-- Insert some data into the created table.
INSERT INTO binoptestts_ts VALUES (1,'2012-11-01T22:08:41Z','2012-11-01T22:08:41Z');
select a != ts from binoptestts_ts;
select a = ts from binoptestts_ts;
select a <= ts from binoptestts_ts;
select a >= ts from binoptestts_ts;
select a < ts from binoptestts_ts;
select a > ts from binoptestts_ts;
-- From the following (commented) query, we would expect to get an error like "operator '&' incompatible with type 'timestamp'"
-- select a & ts from binoptestts_ts;
-- From the following (commented) query, we would expect to get an error like "operator '|' incompatible with type 'timestamp'"
-- select a | ts from binoptestts_ts;
-- From the following (commented) query, we would expect to get an error like "operator '<<' incompatible with type 'timestamp'"
-- select a << ts from binoptestts_ts;
-- From the following (commented) query, we would expect to get an error like "operator '>>' incompatible with type 'timestamp'"
-- select a >> ts from binoptestts_ts;
-- From the following (commented) query, we would expect to get an error like "operator '+' incompatible with type 'timestamp'"
-- select a + ts from binoptestts_ts;
-- From the following (commented) query, we would expect to get an error like "operator '-' incompatible with type 'timestamp'"
-- select a - ts from binoptestts_ts;
-- From the following (commented) query, we would expect to get an error like "operator '*' incompatible with type 'timestamp'"
-- select a * ts from binoptestts_ts;
-- From the following (commented) query, we would expect to get an error like "operator '/' incompatible with type 'timestamp'"
-- select a / ts from binoptestts_ts;
-- From the following (commented) query, we would expect to get an error like "operator '%' incompatible with type 'timestamp'"
-- select a % ts from binoptestts_ts;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'timestamp'"
-- select a || ts from binoptestts_ts;


-- The following block of queries is for a test named binoptestts_ids
-- First we'll create a table.
CREATE TABLE binoptestts_ids (_id id,a timestamp,b idset);
-- Insert some data into the created table.
INSERT INTO binoptestts_ids VALUES (1,'2012-11-01T22:08:41Z',[101,102]);
-- From the following (commented) query, we would expect to get an error like "types 'timestamp' and 'idset' are not equatable"
-- select a != b from binoptestts_ids;
-- From the following (commented) query, we would expect to get an error like "types 'timestamp' and 'idset' are not equatable"
-- select a = b from binoptestts_ids;
-- From the following (commented) query, we would expect to get an error like " operator '<=' incompatible with type 'idset'"
-- select a <= b from binoptestts_ids;
-- From the following (commented) query, we would expect to get an error like " operator '>=' incompatible with type 'idset'"
-- select a >= b from binoptestts_ids;
-- From the following (commented) query, we would expect to get an error like " operator '<' incompatible with type 'idset'"
-- select a < b from binoptestts_ids;
-- From the following (commented) query, we would expect to get an error like " operator '>' incompatible with type 'idset'"
-- select a > b from binoptestts_ids;
-- From the following (commented) query, we would expect to get an error like " operator '&' incompatible with type 'timestamp'"
-- select a & b from binoptestts_ids;
-- From the following (commented) query, we would expect to get an error like " operator '|' incompatible with type 'timestamp'"
-- select a | b from binoptestts_ids;
-- From the following (commented) query, we would expect to get an error like " operator '<<' incompatible with type 'timestamp'"
-- select a << b from binoptestts_ids;
-- From the following (commented) query, we would expect to get an error like " operator '>>' incompatible with type 'timestamp'"
-- select a >> b from binoptestts_ids;
-- From the following (commented) query, we would expect to get an error like " operator '+' incompatible with type 'timestamp'"
-- select a + b from binoptestts_ids;
-- From the following (commented) query, we would expect to get an error like " operator '-' incompatible with type 'timestamp'"
-- select a - b from binoptestts_ids;
-- From the following (commented) query, we would expect to get an error like " operator '*' incompatible with type 'timestamp'"
-- select a * b from binoptestts_ids;
-- From the following (commented) query, we would expect to get an error like " operator '/' incompatible with type 'timestamp'"
-- select a / b from binoptestts_ids;
-- From the following (commented) query, we would expect to get an error like " operator '%' incompatible with type 'timestamp'"
-- select a % b from binoptestts_ids;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'timestamp'"
-- select a || b from binoptestts_ids;


-- The following block of queries is for a test named binoptestts_s
-- First we'll create a table.
CREATE TABLE binoptestts_s (_id id,a timestamp,b string);
-- Insert some data into the created table.
INSERT INTO binoptestts_s VALUES (1,'2012-11-01T22:08:41Z','101');
-- From the following (commented) query, we would expect to get an error like "types 'timestamp' and 'string' are not equatable"
-- select a != b from binoptestts_s;
-- From the following (commented) query, we would expect to get an error like "types 'timestamp' and 'string' are not equatable"
-- select a = b from binoptestts_s;
-- From the following (commented) query, we would expect to get an error like " operator '<=' incompatible with type 'string'"
-- select a <= b from binoptestts_s;
-- From the following (commented) query, we would expect to get an error like " operator '>=' incompatible with type 'string'"
-- select a >= b from binoptestts_s;
-- From the following (commented) query, we would expect to get an error like " operator '<' incompatible with type 'string'"
-- select a < b from binoptestts_s;
-- From the following (commented) query, we would expect to get an error like " operator '>' incompatible with type 'string'"
-- select a > b from binoptestts_s;
-- From the following (commented) query, we would expect to get an error like " operator '&' incompatible with type 'timestamp'"
-- select a & b from binoptestts_s;
-- From the following (commented) query, we would expect to get an error like " operator '|' incompatible with type 'timestamp'"
-- select a | b from binoptestts_s;
-- From the following (commented) query, we would expect to get an error like " operator '<<' incompatible with type 'timestamp'"
-- select a << b from binoptestts_s;
-- From the following (commented) query, we would expect to get an error like " operator '>>' incompatible with type 'timestamp'"
-- select a >> b from binoptestts_s;
-- From the following (commented) query, we would expect to get an error like " operator '+' incompatible with type 'timestamp'"
-- select a + b from binoptestts_s;
-- From the following (commented) query, we would expect to get an error like " operator '-' incompatible with type 'timestamp'"
-- select a - b from binoptestts_s;
-- From the following (commented) query, we would expect to get an error like " operator '*' incompatible with type 'timestamp'"
-- select a * b from binoptestts_s;
-- From the following (commented) query, we would expect to get an error like " operator '/' incompatible with type 'timestamp'"
-- select a / b from binoptestts_s;
-- From the following (commented) query, we would expect to get an error like " operator '%' incompatible with type 'timestamp'"
-- select a % b from binoptestts_s;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'timestamp'"
-- select a || b from binoptestts_s;


-- The following block of queries is for a test named binoptestts_ss
-- First we'll create a table.
CREATE TABLE binoptestts_ss (_id id,a timestamp,b stringset);
-- Insert some data into the created table.
INSERT INTO binoptestts_ss VALUES (1,'2012-11-01T22:08:41Z',['101','102']);
-- From the following (commented) query, we would expect to get an error like "types 'timestamp' and 'stringset' are not equatable"
-- select a != b from binoptestts_ss;
-- From the following (commented) query, we would expect to get an error like "types 'timestamp' and 'stringset' are not equatable"
-- select a = b from binoptestts_ss;
-- From the following (commented) query, we would expect to get an error like " operator '<=' incompatible with type 'stringset'"
-- select a <= b from binoptestts_ss;
-- From the following (commented) query, we would expect to get an error like " operator '>=' incompatible with type 'stringset'"
-- select a >= b from binoptestts_ss;
-- From the following (commented) query, we would expect to get an error like " operator '<' incompatible with type 'stringset'"
-- select a < b from binoptestts_ss;
-- From the following (commented) query, we would expect to get an error like " operator '>' incompatible with type 'stringset'"
-- select a > b from binoptestts_ss;
-- From the following (commented) query, we would expect to get an error like " operator '&' incompatible with type 'timestamp'"
-- select a & b from binoptestts_ss;
-- From the following (commented) query, we would expect to get an error like " operator '|' incompatible with type 'timestamp'"
-- select a | b from binoptestts_ss;
-- From the following (commented) query, we would expect to get an error like " operator '<<' incompatible with type 'timestamp'"
-- select a << b from binoptestts_ss;
-- From the following (commented) query, we would expect to get an error like " operator '>>' incompatible with type 'timestamp'"
-- select a >> b from binoptestts_ss;
-- From the following (commented) query, we would expect to get an error like " operator '+' incompatible with type 'timestamp'"
-- select a + b from binoptestts_ss;
-- From the following (commented) query, we would expect to get an error like " operator '-' incompatible with type 'timestamp'"
-- select a - b from binoptestts_ss;
-- From the following (commented) query, we would expect to get an error like " operator '*' incompatible with type 'timestamp'"
-- select a * b from binoptestts_ss;
-- From the following (commented) query, we would expect to get an error like " operator '/' incompatible with type 'timestamp'"
-- select a / b from binoptestts_ss;
-- From the following (commented) query, we would expect to get an error like " operator '%' incompatible with type 'timestamp'"
-- select a % b from binoptestts_ss;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'timestamp'"
-- select a || b from binoptestts_ss;


-- The following block of queries is for a test named binoptestids_i
-- First we'll create a table.
CREATE TABLE binoptestids_i (_id id,b int,d idset);
-- Insert some data into the created table.
INSERT INTO binoptestids_i VALUES (10,20,[20,21]);
-- From the following (commented) query, we would expect to get an error like "types 'idset' and 'int' are not equatable"
-- select d != b from binoptestids_i;
-- From the following (commented) query, we would expect to get an error like "types 'idset' and 'int' are not equatable"
-- select d = b from binoptestids_i;
-- From the following (commented) query, we would expect to get an error like "operator '<=' incompatible with type 'idset'"
-- select d <= b from binoptestids_i;
-- From the following (commented) query, we would expect to get an error like "operator '>=' incompatible with type 'idset'"
-- select d >= b from binoptestids_i;
-- From the following (commented) query, we would expect to get an error like "operator '<' incompatible with type 'idset'"
-- select d < b from binoptestids_i;
-- From the following (commented) query, we would expect to get an error like "operator '>' incompatible with type 'idset'"
-- select d > b from binoptestids_i;
-- From the following (commented) query, we would expect to get an error like "operator '&' incompatible with type 'idset'"
-- select d & b from binoptestids_i;
-- From the following (commented) query, we would expect to get an error like "operator '|' incompatible with type 'idset'"
-- select d | b from binoptestids_i;
-- From the following (commented) query, we would expect to get an error like "operator '<<' incompatible with type 'idset'"
-- select d << b from binoptestids_i;
-- From the following (commented) query, we would expect to get an error like "operator '>>' incompatible with type 'idset'"
-- select d >> b from binoptestids_i;
-- From the following (commented) query, we would expect to get an error like "operator '+' incompatible with type 'idset'"
-- select d + b from binoptestids_i;
-- From the following (commented) query, we would expect to get an error like "operator '-' incompatible with type 'idset'"
-- select d - b from binoptestids_i;
-- From the following (commented) query, we would expect to get an error like "operator '*' incompatible with type 'idset'"
-- select d * b from binoptestids_i;
-- From the following (commented) query, we would expect to get an error like "operator '/' incompatible with type 'idset'"
-- select d / b from binoptestids_i;
-- From the following (commented) query, we would expect to get an error like "operator '%' incompatible with type 'idset'"
-- select d % b from binoptestids_i;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'idset'"
-- select d || b from binoptestids_i;


-- The following block of queries is for a test named binoptestids_b
-- First we'll create a table.
CREATE TABLE binoptestids_b (_id id,b bool,d idset);
-- Insert some data into the created table.
INSERT INTO binoptestids_b VALUES (10,true,[20,21]);
-- From the following (commented) query, we would expect to get an error like "types 'idset' and 'bool' are not equatable"
-- select d != b from binoptestids_b;
-- From the following (commented) query, we would expect to get an error like "types 'idset' and 'bool' are not equatable"
-- select d = b from binoptestids_b;
-- From the following (commented) query, we would expect to get an error like "operator '<=' incompatible with type 'idset'"
-- select d <= b from binoptestids_b;
-- From the following (commented) query, we would expect to get an error like "operator '>=' incompatible with type 'idset'"
-- select d >= b from binoptestids_b;
-- From the following (commented) query, we would expect to get an error like "operator '<' incompatible with type 'idset'"
-- select d < b from binoptestids_b;
-- From the following (commented) query, we would expect to get an error like "operator '>' incompatible with type 'idset'"
-- select d > b from binoptestids_b;
-- From the following (commented) query, we would expect to get an error like "operator '&' incompatible with type 'idset'"
-- select d & b from binoptestids_b;
-- From the following (commented) query, we would expect to get an error like "operator '|' incompatible with type 'idset'"
-- select d | b from binoptestids_b;
-- From the following (commented) query, we would expect to get an error like "operator '<<' incompatible with type 'idset'"
-- select d << b from binoptestids_b;
-- From the following (commented) query, we would expect to get an error like "operator '>>' incompatible with type 'idset'"
-- select d >> b from binoptestids_b;
-- From the following (commented) query, we would expect to get an error like "operator '+' incompatible with type 'idset'"
-- select d + b from binoptestids_b;
-- From the following (commented) query, we would expect to get an error like "operator '-' incompatible with type 'idset'"
-- select d - b from binoptestids_b;
-- From the following (commented) query, we would expect to get an error like "operator '*' incompatible with type 'idset'"
-- select d * b from binoptestids_b;
-- From the following (commented) query, we would expect to get an error like "operator '/' incompatible with type 'idset'"
-- select d / b from binoptestids_b;
-- From the following (commented) query, we would expect to get an error like "operator '%' incompatible with type 'idset'"
-- select d % b from binoptestids_b;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'idset'"
-- select d || b from binoptestids_b;


-- The following block of queries is for a test named binoptestids_id
-- First we'll create a table.
CREATE TABLE binoptestids_id (_id id,b id,d idset);
-- Insert some data into the created table.
INSERT INTO binoptestids_id VALUES (10,20,[20,21]);
-- From the following (commented) query, we would expect to get an error like "types 'idset' and 'id' are not equatable"
-- select d != b from binoptestids_id;
-- From the following (commented) query, we would expect to get an error like "types 'idset' and 'id' are not equatable"
-- select d = b from binoptestids_id;
-- From the following (commented) query, we would expect to get an error like "operator '<=' incompatible with type 'idset'"
-- select d <= b from binoptestids_id;
-- From the following (commented) query, we would expect to get an error like "operator '>=' incompatible with type 'idset'"
-- select d >= b from binoptestids_id;
-- From the following (commented) query, we would expect to get an error like "operator '<' incompatible with type 'idset'"
-- select d < b from binoptestids_id;
-- From the following (commented) query, we would expect to get an error like "operator '>' incompatible with type 'idset'"
-- select d > b from binoptestids_id;
-- From the following (commented) query, we would expect to get an error like "operator '&' incompatible with type 'idset'"
-- select d & b from binoptestids_id;
-- From the following (commented) query, we would expect to get an error like "operator '|' incompatible with type 'idset'"
-- select d | b from binoptestids_id;
-- From the following (commented) query, we would expect to get an error like "operator '<<' incompatible with type 'idset'"
-- select d << b from binoptestids_id;
-- From the following (commented) query, we would expect to get an error like "operator '>>' incompatible with type 'idset'"
-- select d >> b from binoptestids_id;
-- From the following (commented) query, we would expect to get an error like "operator '+' incompatible with type 'idset'"
-- select d + b from binoptestids_id;
-- From the following (commented) query, we would expect to get an error like "operator '-' incompatible with type 'idset'"
-- select d - b from binoptestids_id;
-- From the following (commented) query, we would expect to get an error like "operator '*' incompatible with type 'idset'"
-- select d * b from binoptestids_id;
-- From the following (commented) query, we would expect to get an error like "operator '/' incompatible with type 'idset'"
-- select d / b from binoptestids_id;
-- From the following (commented) query, we would expect to get an error like "operator '%' incompatible with type 'idset'"
-- select d % b from binoptestids_id;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'idset'"
-- select d || b from binoptestids_id;


-- The following block of queries is for a test named binoptestids_d
-- First we'll create a table.
CREATE TABLE binoptestids_d (_id id,a idset,d decimal(2));
-- Insert some data into the created table.
INSERT INTO binoptestids_d VALUES (1,[20,21],12.34);
-- From the following (commented) query, we would expect to get an error like "types 'idset' and 'decimal(2)' are not equatable"
-- select a != d from binoptestids_d;
-- From the following (commented) query, we would expect to get an error like "types 'idset' and 'decimal(2)' are not equatable"
-- select a = d from binoptestids_d;
-- From the following (commented) query, we would expect to get an error like "operator '<=' incompatible with type 'idset'"
-- select a <= d from binoptestids_d;
-- From the following (commented) query, we would expect to get an error like "operator '>=' incompatible with type 'idset'"
-- select a >= d from binoptestids_d;
-- From the following (commented) query, we would expect to get an error like "operator '<' incompatible with type 'idset'"
-- select a < d from binoptestids_d;
-- From the following (commented) query, we would expect to get an error like "operator '>' incompatible with type 'idset'"
-- select a > d from binoptestids_d;
-- From the following (commented) query, we would expect to get an error like "operator '&' incompatible with type 'idset'"
-- select a & d from binoptestids_d;
-- From the following (commented) query, we would expect to get an error like "operator '|' incompatible with type 'idset'"
-- select a | d from binoptestids_d;
-- From the following (commented) query, we would expect to get an error like "operator '<<' incompatible with type 'idset'"
-- select a << d from binoptestids_d;
-- From the following (commented) query, we would expect to get an error like "operator '>>' incompatible with type 'idset'"
-- select a >> d from binoptestids_d;
-- From the following (commented) query, we would expect to get an error like "operator '+' incompatible with type 'idset'"
-- select a + d from binoptestids_d;
-- From the following (commented) query, we would expect to get an error like "operator '-' incompatible with type 'idset'"
-- select a - d from binoptestids_d;
-- From the following (commented) query, we would expect to get an error like "operator '*' incompatible with type 'idset'"
-- select a * d from binoptestids_d;
-- From the following (commented) query, we would expect to get an error like "operator '/' incompatible with type 'idset'"
-- select a / d from binoptestids_d;
-- From the following (commented) query, we would expect to get an error like "operator '%' incompatible with type 'idset'"
-- select a % d from binoptestids_d;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'idset'"
-- select a || d from binoptestids_d;


-- The following block of queries is for a test named binoptestids_ts
-- First we'll create a table.
CREATE TABLE binoptestids_ts (_id id,a idset,ts timestamp);
-- Insert some data into the created table.
INSERT INTO binoptestids_ts VALUES (1,[20,21],'2012-11-01T22:08:41Z');
-- From the following (commented) query, we would expect to get an error like "types 'idset' and 'timestamp' are not equatable"
-- select a != ts from binoptestids_ts;
-- From the following (commented) query, we would expect to get an error like "types 'idset' and 'timestamp' are not equatable"
-- select a = ts from binoptestids_ts;
-- From the following (commented) query, we would expect to get an error like " operator '<=' incompatible with type 'idset'"
-- select a <= ts from binoptestids_ts;
-- From the following (commented) query, we would expect to get an error like " operator '>=' incompatible with type 'idset'"
-- select a >= ts from binoptestids_ts;
-- From the following (commented) query, we would expect to get an error like " operator '<' incompatible with type 'idset'"
-- select a < ts from binoptestids_ts;
-- From the following (commented) query, we would expect to get an error like " operator '>' incompatible with type 'idset'"
-- select a > ts from binoptestids_ts;
-- From the following (commented) query, we would expect to get an error like "operator '&' incompatible with type 'idset'"
-- select a & ts from binoptestids_ts;
-- From the following (commented) query, we would expect to get an error like "operator '|' incompatible with type 'idset'"
-- select a | ts from binoptestids_ts;
-- From the following (commented) query, we would expect to get an error like "operator '<<' incompatible with type 'idset'"
-- select a << ts from binoptestids_ts;
-- From the following (commented) query, we would expect to get an error like "operator '>>' incompatible with type 'idset'"
-- select a >> ts from binoptestids_ts;
-- From the following (commented) query, we would expect to get an error like "operator '+' incompatible with type 'idset'"
-- select a + ts from binoptestids_ts;
-- From the following (commented) query, we would expect to get an error like "operator '-' incompatible with type 'idset'"
-- select a - ts from binoptestids_ts;
-- From the following (commented) query, we would expect to get an error like "operator '*' incompatible with type 'idset'"
-- select a * ts from binoptestids_ts;
-- From the following (commented) query, we would expect to get an error like "operator '/' incompatible with type 'idset'"
-- select a / ts from binoptestids_ts;
-- From the following (commented) query, we would expect to get an error like "operator '%' incompatible with type 'idset'"
-- select a % ts from binoptestids_ts;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'idset'"
-- select a || ts from binoptestids_ts;


-- The following block of queries is for a test named binoptestids_ids
-- First we'll create a table.
CREATE TABLE binoptestids_ids (_id id,a idset,b idset);
-- Insert some data into the created table.
INSERT INTO binoptestids_ids VALUES (1,[101,103],[101,102]);
select a != b from binoptestids_ids;
select a = b from binoptestids_ids;
-- From the following (commented) query, we would expect to get an error like " operator '<=' incompatible with type 'idset'"
-- select a <= b from binoptestids_ids;
-- From the following (commented) query, we would expect to get an error like " operator '>=' incompatible with type 'idset'"
-- select a >= b from binoptestids_ids;
-- From the following (commented) query, we would expect to get an error like " operator '<' incompatible with type 'idset'"
-- select a < b from binoptestids_ids;
-- From the following (commented) query, we would expect to get an error like " operator '>' incompatible with type 'idset'"
-- select a > b from binoptestids_ids;
-- From the following (commented) query, we would expect to get an error like " operator '&' incompatible with type 'idset'"
-- select a & b from binoptestids_ids;
-- From the following (commented) query, we would expect to get an error like " operator '|' incompatible with type 'idset'"
-- select a | b from binoptestids_ids;
-- From the following (commented) query, we would expect to get an error like " operator '<<' incompatible with type 'idset'"
-- select a << b from binoptestids_ids;
-- From the following (commented) query, we would expect to get an error like " operator '>>' incompatible with type 'idset'"
-- select a >> b from binoptestids_ids;
-- From the following (commented) query, we would expect to get an error like " operator '+' incompatible with type 'idset'"
-- select a + b from binoptestids_ids;
-- From the following (commented) query, we would expect to get an error like " operator '-' incompatible with type 'idset'"
-- select a - b from binoptestids_ids;
-- From the following (commented) query, we would expect to get an error like " operator '*' incompatible with type 'idset'"
-- select a * b from binoptestids_ids;
-- From the following (commented) query, we would expect to get an error like " operator '/' incompatible with type 'idset'"
-- select a / b from binoptestids_ids;
-- From the following (commented) query, we would expect to get an error like " operator '%' incompatible with type 'idset'"
-- select a % b from binoptestids_ids;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'idset'"
-- select a || b from binoptestids_ids;


-- The following block of queries is for a test named binoptestids_s
-- First we'll create a table.
CREATE TABLE binoptestids_s (_id id,a idset,b string);
-- Insert some data into the created table.
INSERT INTO binoptestids_s VALUES (1,[101,102],'101');
-- From the following (commented) query, we would expect to get an error like "types 'idset' and 'string' are not equatable"
-- select a != b from binoptestids_s;
-- From the following (commented) query, we would expect to get an error like "types 'idset' and 'string' are not equatable"
-- select a = b from binoptestids_s;
-- From the following (commented) query, we would expect to get an error like " operator '<=' incompatible with type 'idset'"
-- select a <= b from binoptestids_s;
-- From the following (commented) query, we would expect to get an error like " operator '>=' incompatible with type 'idset'"
-- select a >= b from binoptestids_s;
-- From the following (commented) query, we would expect to get an error like " operator '<' incompatible with type 'idset'"
-- select a < b from binoptestids_s;
-- From the following (commented) query, we would expect to get an error like " operator '>' incompatible with type 'idset'"
-- select a > b from binoptestids_s;
-- From the following (commented) query, we would expect to get an error like " operator '&' incompatible with type 'idset'"
-- select a & b from binoptestids_s;
-- From the following (commented) query, we would expect to get an error like " operator '|' incompatible with type 'idset'"
-- select a | b from binoptestids_s;
-- From the following (commented) query, we would expect to get an error like " operator '<<' incompatible with type 'idset'"
-- select a << b from binoptestids_s;
-- From the following (commented) query, we would expect to get an error like " operator '>>' incompatible with type 'idset'"
-- select a >> b from binoptestids_s;
-- From the following (commented) query, we would expect to get an error like " operator '+' incompatible with type 'idset'"
-- select a + b from binoptestids_s;
-- From the following (commented) query, we would expect to get an error like " operator '-' incompatible with type 'idset'"
-- select a - b from binoptestids_s;
-- From the following (commented) query, we would expect to get an error like " operator '*' incompatible with type 'idset'"
-- select a * b from binoptestids_s;
-- From the following (commented) query, we would expect to get an error like " operator '/' incompatible with type 'idset'"
-- select a / b from binoptestids_s;
-- From the following (commented) query, we would expect to get an error like " operator '%' incompatible with type 'idset'"
-- select a % b from binoptestids_s;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'idset'"
-- select a || b from binoptestids_s;


-- The following block of queries is for a test named binoptestids_ss
-- First we'll create a table.
CREATE TABLE binoptestids_ss (_id id,a idset,b stringset);
-- Insert some data into the created table.
INSERT INTO binoptestids_ss VALUES (1,[102,103],['101','102']);
-- From the following (commented) query, we would expect to get an error like "types 'idset' and 'stringset' are not equatable"
-- select a != b from binoptestids_ss;
-- From the following (commented) query, we would expect to get an error like "types 'idset' and 'stringset' are not equatable"
-- select a = b from binoptestids_ss;
-- From the following (commented) query, we would expect to get an error like " operator '<=' incompatible with type 'idset'"
-- select a <= b from binoptestids_ss;
-- From the following (commented) query, we would expect to get an error like " operator '>=' incompatible with type 'idset'"
-- select a >= b from binoptestids_ss;
-- From the following (commented) query, we would expect to get an error like " operator '<' incompatible with type 'idset'"
-- select a < b from binoptestids_ss;
-- From the following (commented) query, we would expect to get an error like " operator '>' incompatible with type 'idset'"
-- select a > b from binoptestids_ss;
-- From the following (commented) query, we would expect to get an error like " operator '&' incompatible with type 'idset'"
-- select a & b from binoptestids_ss;
-- From the following (commented) query, we would expect to get an error like " operator '|' incompatible with type 'idset'"
-- select a | b from binoptestids_ss;
-- From the following (commented) query, we would expect to get an error like " operator '<<' incompatible with type 'idset'"
-- select a << b from binoptestids_ss;
-- From the following (commented) query, we would expect to get an error like " operator '>>' incompatible with type 'idset'"
-- select a >> b from binoptestids_ss;
-- From the following (commented) query, we would expect to get an error like " operator '+' incompatible with type 'idset'"
-- select a + b from binoptestids_ss;
-- From the following (commented) query, we would expect to get an error like " operator '-' incompatible with type 'idset'"
-- select a - b from binoptestids_ss;
-- From the following (commented) query, we would expect to get an error like " operator '*' incompatible with type 'idset'"
-- select a * b from binoptestids_ss;
-- From the following (commented) query, we would expect to get an error like " operator '/' incompatible with type 'idset'"
-- select a / b from binoptestids_ss;
-- From the following (commented) query, we would expect to get an error like " operator '%' incompatible with type 'idset'"
-- select a % b from binoptestids_ss;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'idset'"
-- select a || b from binoptestids_ss;


-- The following block of queries is for a test named binoptests_i
-- First we'll create a table.
CREATE TABLE binoptests_i (_id id,b int,d string);
-- Insert some data into the created table.
INSERT INTO binoptests_i VALUES (10,20,'foo');
-- From the following (commented) query, we would expect to get an error like "types 'string' and 'int' are not equatable"
-- select d != b from binoptests_i;
-- From the following (commented) query, we would expect to get an error like "types 'string' and 'int' are not equatable"
-- select d = b from binoptests_i;
-- From the following (commented) query, we would expect to get an error like "operator '<=' incompatible with type 'string'"
-- select d <= b from binoptests_i;
-- From the following (commented) query, we would expect to get an error like "operator '>=' incompatible with type 'string'"
-- select d >= b from binoptests_i;
-- From the following (commented) query, we would expect to get an error like "operator '<' incompatible with type 'string'"
-- select d < b from binoptests_i;
-- From the following (commented) query, we would expect to get an error like "operator '>' incompatible with type 'string'"
-- select d > b from binoptests_i;
-- From the following (commented) query, we would expect to get an error like "operator '&' incompatible with type 'string'"
-- select d & b from binoptests_i;
-- From the following (commented) query, we would expect to get an error like "operator '|' incompatible with type 'string'"
-- select d | b from binoptests_i;
-- From the following (commented) query, we would expect to get an error like "operator '<<' incompatible with type 'string'"
-- select d << b from binoptests_i;
-- From the following (commented) query, we would expect to get an error like "operator '>>' incompatible with type 'string'"
-- select d >> b from binoptests_i;
-- From the following (commented) query, we would expect to get an error like "operator '+' incompatible with type 'string'"
-- select d + b from binoptests_i;
-- From the following (commented) query, we would expect to get an error like "operator '-' incompatible with type 'string'"
-- select d - b from binoptests_i;
-- From the following (commented) query, we would expect to get an error like "operator '*' incompatible with type 'string'"
-- select d * b from binoptests_i;
-- From the following (commented) query, we would expect to get an error like "operator '/' incompatible with type 'string'"
-- select d / b from binoptests_i;
-- From the following (commented) query, we would expect to get an error like "operator '%' incompatible with type 'string'"
-- select d % b from binoptests_i;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'int'"
-- select d || b from binoptests_i;


-- The following block of queries is for a test named binoptests_b
-- First we'll create a table.
CREATE TABLE binoptests_b (_id id,b bool,d string);
-- Insert some data into the created table.
INSERT INTO binoptests_b VALUES (10,true,'foo');
-- From the following (commented) query, we would expect to get an error like "types 'string' and 'bool' are not equatable"
-- select d != b from binoptests_b;
-- From the following (commented) query, we would expect to get an error like "types 'string' and 'bool' are not equatable"
-- select d = b from binoptests_b;
-- From the following (commented) query, we would expect to get an error like "operator '<=' incompatible with type 'string'"
-- select d <= b from binoptests_b;
-- From the following (commented) query, we would expect to get an error like "operator '>=' incompatible with type 'string'"
-- select d >= b from binoptests_b;
-- From the following (commented) query, we would expect to get an error like "operator '<' incompatible with type 'string'"
-- select d < b from binoptests_b;
-- From the following (commented) query, we would expect to get an error like "operator '>' incompatible with type 'string'"
-- select d > b from binoptests_b;
-- From the following (commented) query, we would expect to get an error like "operator '&' incompatible with type 'string'"
-- select d & b from binoptests_b;
-- From the following (commented) query, we would expect to get an error like "operator '|' incompatible with type 'string'"
-- select d | b from binoptests_b;
-- From the following (commented) query, we would expect to get an error like "operator '<<' incompatible with type 'string'"
-- select d << b from binoptests_b;
-- From the following (commented) query, we would expect to get an error like "operator '>>' incompatible with type 'string'"
-- select d >> b from binoptests_b;
-- From the following (commented) query, we would expect to get an error like "operator '+' incompatible with type 'string'"
-- select d + b from binoptests_b;
-- From the following (commented) query, we would expect to get an error like "operator '-' incompatible with type 'string'"
-- select d - b from binoptests_b;
-- From the following (commented) query, we would expect to get an error like "operator '*' incompatible with type 'string'"
-- select d * b from binoptests_b;
-- From the following (commented) query, we would expect to get an error like "operator '/' incompatible with type 'string'"
-- select d / b from binoptests_b;
-- From the following (commented) query, we would expect to get an error like "operator '%' incompatible with type 'string'"
-- select d % b from binoptests_b;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'bool'"
-- select d || b from binoptests_b;


-- The following block of queries is for a test named binoptests_id
-- First we'll create a table.
CREATE TABLE binoptests_id (_id id,b id,d string);
-- Insert some data into the created table.
INSERT INTO binoptests_id VALUES (10,20,'foo');
-- From the following (commented) query, we would expect to get an error like "types 'string' and 'id' are not equatable"
-- select d != b from binoptests_id;
-- From the following (commented) query, we would expect to get an error like "types 'string' and 'id' are not equatable"
-- select d = b from binoptests_id;
-- From the following (commented) query, we would expect to get an error like "operator '<=' incompatible with type 'string'"
-- select d <= b from binoptests_id;
-- From the following (commented) query, we would expect to get an error like "operator '>=' incompatible with type 'string'"
-- select d >= b from binoptests_id;
-- From the following (commented) query, we would expect to get an error like "operator '<' incompatible with type 'string'"
-- select d < b from binoptests_id;
-- From the following (commented) query, we would expect to get an error like "operator '>' incompatible with type 'string'"
-- select d > b from binoptests_id;
-- From the following (commented) query, we would expect to get an error like "operator '&' incompatible with type 'string'"
-- select d & b from binoptests_id;
-- From the following (commented) query, we would expect to get an error like "operator '|' incompatible with type 'string'"
-- select d | b from binoptests_id;
-- From the following (commented) query, we would expect to get an error like "operator '<<' incompatible with type 'string'"
-- select d << b from binoptests_id;
-- From the following (commented) query, we would expect to get an error like "operator '>>' incompatible with type 'string'"
-- select d >> b from binoptests_id;
-- From the following (commented) query, we would expect to get an error like "operator '+' incompatible with type 'string'"
-- select d + b from binoptests_id;
-- From the following (commented) query, we would expect to get an error like "operator '-' incompatible with type 'string'"
-- select d - b from binoptests_id;
-- From the following (commented) query, we would expect to get an error like "operator '*' incompatible with type 'string'"
-- select d * b from binoptests_id;
-- From the following (commented) query, we would expect to get an error like "operator '/' incompatible with type 'string'"
-- select d / b from binoptests_id;
-- From the following (commented) query, we would expect to get an error like "operator '%' incompatible with type 'string'"
-- select d % b from binoptests_id;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'id'"
-- select d || b from binoptests_id;


-- The following block of queries is for a test named binoptests_d
-- First we'll create a table.
CREATE TABLE binoptests_d (_id id,a string,d decimal(2));
-- Insert some data into the created table.
INSERT INTO binoptests_d VALUES (1,'foo',12.34);
-- From the following (commented) query, we would expect to get an error like "types 'string' and 'decimal(2)' are not equatable"
-- select a != d from binoptests_d;
-- From the following (commented) query, we would expect to get an error like "types 'string' and 'decimal(2)' are not equatable"
-- select a = d from binoptests_d;
-- From the following (commented) query, we would expect to get an error like "operator '<=' incompatible with type 'string'"
-- select a <= d from binoptests_d;
-- From the following (commented) query, we would expect to get an error like "operator '>=' incompatible with type 'string'"
-- select a >= d from binoptests_d;
-- From the following (commented) query, we would expect to get an error like "operator '<' incompatible with type 'string'"
-- select a < d from binoptests_d;
-- From the following (commented) query, we would expect to get an error like "operator '>' incompatible with type 'string'"
-- select a > d from binoptests_d;
-- From the following (commented) query, we would expect to get an error like "operator '&' incompatible with type 'string'"
-- select a & d from binoptests_d;
-- From the following (commented) query, we would expect to get an error like "operator '|' incompatible with type 'string'"
-- select a | d from binoptests_d;
-- From the following (commented) query, we would expect to get an error like "operator '<<' incompatible with type 'string'"
-- select a << d from binoptests_d;
-- From the following (commented) query, we would expect to get an error like "operator '>>' incompatible with type 'string'"
-- select a >> d from binoptests_d;
-- From the following (commented) query, we would expect to get an error like "operator '+' incompatible with type 'string'"
-- select a + d from binoptests_d;
-- From the following (commented) query, we would expect to get an error like "operator '-' incompatible with type 'string'"
-- select a - d from binoptests_d;
-- From the following (commented) query, we would expect to get an error like "operator '*' incompatible with type 'string'"
-- select a * d from binoptests_d;
-- From the following (commented) query, we would expect to get an error like "operator '/' incompatible with type 'string'"
-- select a / d from binoptests_d;
-- From the following (commented) query, we would expect to get an error like "operator '%' incompatible with type 'string'"
-- select a % d from binoptests_d;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'decimal(2)'"
-- select a || d from binoptests_d;


-- The following block of queries is for a test named binoptests_ts
-- First we'll create a table.
CREATE TABLE binoptests_ts (_id id,a string,ts timestamp);
-- Insert some data into the created table.
INSERT INTO binoptests_ts VALUES (1,'foo','2012-11-01T22:08:41Z');
-- From the following (commented) query, we would expect to get an error like "types 'string' and 'timestamp' are not equatable"
-- select a != ts from binoptests_ts;
-- From the following (commented) query, we would expect to get an error like "types 'string' and 'timestamp' are not equatable"
-- select a = ts from binoptests_ts;
-- From the following (commented) query, we would expect to get an error like " operator '<=' incompatible with type 'string'"
-- select a <= ts from binoptests_ts;
-- From the following (commented) query, we would expect to get an error like " operator '>=' incompatible with type 'string'"
-- select a >= ts from binoptests_ts;
-- From the following (commented) query, we would expect to get an error like " operator '<' incompatible with type 'string'"
-- select a < ts from binoptests_ts;
-- From the following (commented) query, we would expect to get an error like " operator '>' incompatible with type 'string'"
-- select a > ts from binoptests_ts;
-- From the following (commented) query, we would expect to get an error like "operator '&' incompatible with type 'string'"
-- select a & ts from binoptests_ts;
-- From the following (commented) query, we would expect to get an error like "operator '|' incompatible with type 'string'"
-- select a | ts from binoptests_ts;
-- From the following (commented) query, we would expect to get an error like "operator '<<' incompatible with type 'string'"
-- select a << ts from binoptests_ts;
-- From the following (commented) query, we would expect to get an error like "operator '>>' incompatible with type 'string'"
-- select a >> ts from binoptests_ts;
-- From the following (commented) query, we would expect to get an error like "operator '+' incompatible with type 'string'"
-- select a + ts from binoptests_ts;
-- From the following (commented) query, we would expect to get an error like "operator '-' incompatible with type 'string'"
-- select a - ts from binoptests_ts;
-- From the following (commented) query, we would expect to get an error like "operator '*' incompatible with type 'string'"
-- select a * ts from binoptests_ts;
-- From the following (commented) query, we would expect to get an error like "operator '/' incompatible with type 'string'"
-- select a / ts from binoptests_ts;
-- From the following (commented) query, we would expect to get an error like "operator '%' incompatible with type 'string'"
-- select a % ts from binoptests_ts;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'timestamp'"
-- select a || ts from binoptests_ts;


-- The following block of queries is for a test named binoptests_ids
-- First we'll create a table.
CREATE TABLE binoptests_ids (_id id,a string,b idset);
-- Insert some data into the created table.
INSERT INTO binoptests_ids VALUES (1,'foo',[101,102]);
-- From the following (commented) query, we would expect to get an error like "types 'string' and 'idset' are not equatable"
-- select a != b from binoptests_ids;
-- From the following (commented) query, we would expect to get an error like "types 'string' and 'idset' are not equatable"
-- select a = b from binoptests_ids;
-- From the following (commented) query, we would expect to get an error like " operator '<=' incompatible with type 'string'"
-- select a <= b from binoptests_ids;
-- From the following (commented) query, we would expect to get an error like " operator '>=' incompatible with type 'string'"
-- select a >= b from binoptests_ids;
-- From the following (commented) query, we would expect to get an error like " operator '<' incompatible with type 'string'"
-- select a < b from binoptests_ids;
-- From the following (commented) query, we would expect to get an error like " operator '>' incompatible with type 'string'"
-- select a > b from binoptests_ids;
-- From the following (commented) query, we would expect to get an error like " operator '&' incompatible with type 'string'"
-- select a & b from binoptests_ids;
-- From the following (commented) query, we would expect to get an error like " operator '|' incompatible with type 'string'"
-- select a | b from binoptests_ids;
-- From the following (commented) query, we would expect to get an error like " operator '<<' incompatible with type 'string'"
-- select a << b from binoptests_ids;
-- From the following (commented) query, we would expect to get an error like " operator '>>' incompatible with type 'string'"
-- select a >> b from binoptests_ids;
-- From the following (commented) query, we would expect to get an error like " operator '+' incompatible with type 'string'"
-- select a + b from binoptests_ids;
-- From the following (commented) query, we would expect to get an error like " operator '-' incompatible with type 'string'"
-- select a - b from binoptests_ids;
-- From the following (commented) query, we would expect to get an error like " operator '*' incompatible with type 'string'"
-- select a * b from binoptests_ids;
-- From the following (commented) query, we would expect to get an error like " operator '/' incompatible with type 'string'"
-- select a / b from binoptests_ids;
-- From the following (commented) query, we would expect to get an error like " operator '%' incompatible with type 'string'"
-- select a % b from binoptests_ids;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'idset'"
-- select a || b from binoptests_ids;


-- The following block of queries is for a test named binoptests_s
-- First we'll create a table.
CREATE TABLE binoptests_s (_id id,a string,b string);
-- Insert some data into the created table.
INSERT INTO binoptests_s VALUES (1,'foo','101');
select a != b from binoptests_s;
select a = b from binoptests_s;
-- From the following (commented) query, we would expect to get an error like " operator '<=' incompatible with type 'string'"
-- select a <= b from binoptests_s;
-- From the following (commented) query, we would expect to get an error like " operator '>=' incompatible with type 'string'"
-- select a >= b from binoptests_s;
-- From the following (commented) query, we would expect to get an error like " operator '<' incompatible with type 'string'"
-- select a < b from binoptests_s;
-- From the following (commented) query, we would expect to get an error like " operator '>' incompatible with type 'string'"
-- select a > b from binoptests_s;
-- From the following (commented) query, we would expect to get an error like " operator '&' incompatible with type 'string'"
-- select a & b from binoptests_s;
-- From the following (commented) query, we would expect to get an error like " operator '|' incompatible with type 'string'"
-- select a | b from binoptests_s;
-- From the following (commented) query, we would expect to get an error like " operator '<<' incompatible with type 'string'"
-- select a << b from binoptests_s;
-- From the following (commented) query, we would expect to get an error like " operator '>>' incompatible with type 'string'"
-- select a >> b from binoptests_s;
-- From the following (commented) query, we would expect to get an error like " operator '+' incompatible with type 'string'"
-- select a + b from binoptests_s;
-- From the following (commented) query, we would expect to get an error like " operator '-' incompatible with type 'string'"
-- select a - b from binoptests_s;
-- From the following (commented) query, we would expect to get an error like " operator '*' incompatible with type 'string'"
-- select a * b from binoptests_s;
-- From the following (commented) query, we would expect to get an error like " operator '/' incompatible with type 'string'"
-- select a / b from binoptests_s;
-- From the following (commented) query, we would expect to get an error like " operator '%' incompatible with type 'string'"
-- select a % b from binoptests_s;
select a || b from binoptests_s;


-- The following block of queries is for a test named binoptests_ss
-- First we'll create a table.
CREATE TABLE binoptests_ss (_id id,a string,b stringset);
-- Insert some data into the created table.
INSERT INTO binoptests_ss VALUES (1,'foo',['101','102']);
-- From the following (commented) query, we would expect to get an error like "types 'string' and 'stringset' are not equatable"
-- select a != b from binoptests_ss;
-- From the following (commented) query, we would expect to get an error like "types 'string' and 'stringset' are not equatable"
-- select a = b from binoptests_ss;
-- From the following (commented) query, we would expect to get an error like " operator '<=' incompatible with type 'string'"
-- select a <= b from binoptests_ss;
-- From the following (commented) query, we would expect to get an error like " operator '>=' incompatible with type 'string'"
-- select a >= b from binoptests_ss;
-- From the following (commented) query, we would expect to get an error like " operator '<' incompatible with type 'string'"
-- select a < b from binoptests_ss;
-- From the following (commented) query, we would expect to get an error like " operator '>' incompatible with type 'string'"
-- select a > b from binoptests_ss;
-- From the following (commented) query, we would expect to get an error like " operator '&' incompatible with type 'string'"
-- select a & b from binoptests_ss;
-- From the following (commented) query, we would expect to get an error like " operator '|' incompatible with type 'string'"
-- select a | b from binoptests_ss;
-- From the following (commented) query, we would expect to get an error like " operator '<<' incompatible with type 'string'"
-- select a << b from binoptests_ss;
-- From the following (commented) query, we would expect to get an error like " operator '>>' incompatible with type 'string'"
-- select a >> b from binoptests_ss;
-- From the following (commented) query, we would expect to get an error like " operator '+' incompatible with type 'string'"
-- select a + b from binoptests_ss;
-- From the following (commented) query, we would expect to get an error like " operator '-' incompatible with type 'string'"
-- select a - b from binoptests_ss;
-- From the following (commented) query, we would expect to get an error like " operator '*' incompatible with type 'string'"
-- select a * b from binoptests_ss;
-- From the following (commented) query, we would expect to get an error like " operator '/' incompatible with type 'string'"
-- select a / b from binoptests_ss;
-- From the following (commented) query, we would expect to get an error like " operator '%' incompatible with type 'string'"
-- select a % b from binoptests_ss;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'stringset'"
-- select a || b from binoptests_ss;


-- The following block of queries is for a test named binoptestss_i
-- First we'll create a table.
CREATE TABLE binoptestss_i (_id id,b int,d stringset);
-- Insert some data into the created table.
INSERT INTO binoptestss_i VALUES (10,20,['20','21']);
-- From the following (commented) query, we would expect to get an error like "types 'stringset' and 'int' are not equatable"
-- select d != b from binoptestss_i;
-- From the following (commented) query, we would expect to get an error like "types 'stringset' and 'int' are not equatable"
-- select d = b from binoptestss_i;
-- From the following (commented) query, we would expect to get an error like "operator '<=' incompatible with type 'stringset'"
-- select d <= b from binoptestss_i;
-- From the following (commented) query, we would expect to get an error like "operator '>=' incompatible with type 'stringset'"
-- select d >= b from binoptestss_i;
-- From the following (commented) query, we would expect to get an error like "operator '<' incompatible with type 'stringset'"
-- select d < b from binoptestss_i;
-- From the following (commented) query, we would expect to get an error like "operator '>' incompatible with type 'stringset'"
-- select d > b from binoptestss_i;
-- From the following (commented) query, we would expect to get an error like "operator '&' incompatible with type 'stringset'"
-- select d & b from binoptestss_i;
-- From the following (commented) query, we would expect to get an error like "operator '|' incompatible with type 'stringset'"
-- select d | b from binoptestss_i;
-- From the following (commented) query, we would expect to get an error like "operator '<<' incompatible with type 'stringset'"
-- select d << b from binoptestss_i;
-- From the following (commented) query, we would expect to get an error like "operator '>>' incompatible with type 'stringset'"
-- select d >> b from binoptestss_i;
-- From the following (commented) query, we would expect to get an error like "operator '+' incompatible with type 'stringset'"
-- select d + b from binoptestss_i;
-- From the following (commented) query, we would expect to get an error like "operator '-' incompatible with type 'stringset'"
-- select d - b from binoptestss_i;
-- From the following (commented) query, we would expect to get an error like "operator '*' incompatible with type 'stringset'"
-- select d * b from binoptestss_i;
-- From the following (commented) query, we would expect to get an error like "operator '/' incompatible with type 'stringset'"
-- select d / b from binoptestss_i;
-- From the following (commented) query, we would expect to get an error like "operator '%' incompatible with type 'stringset'"
-- select d % b from binoptestss_i;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'stringset'"
-- select d || b from binoptestss_i;
select count(*) from binoptestss_i where b >= 20;
select count(*) from binoptestss_i where 20 > b;


-- The following block of queries is for a test named binoptestss_b
-- First we'll create a table.
CREATE TABLE binoptestss_b (_id id,b bool,d stringset);
-- Insert some data into the created table.
INSERT INTO binoptestss_b VALUES (10,true,['20','21']);
-- From the following (commented) query, we would expect to get an error like "types 'stringset' and 'bool' are not equatable"
-- select d != b from binoptestss_b;
-- From the following (commented) query, we would expect to get an error like "types 'stringset' and 'bool' are not equatable"
-- select d = b from binoptestss_b;
-- From the following (commented) query, we would expect to get an error like "operator '<=' incompatible with type 'stringset'"
-- select d <= b from binoptestss_b;
-- From the following (commented) query, we would expect to get an error like "operator '>=' incompatible with type 'stringset'"
-- select d >= b from binoptestss_b;
-- From the following (commented) query, we would expect to get an error like "operator '<' incompatible with type 'stringset'"
-- select d < b from binoptestss_b;
-- From the following (commented) query, we would expect to get an error like "operator '>' incompatible with type 'stringset'"
-- select d > b from binoptestss_b;
-- From the following (commented) query, we would expect to get an error like "operator '&' incompatible with type 'stringset'"
-- select d & b from binoptestss_b;
-- From the following (commented) query, we would expect to get an error like "operator '|' incompatible with type 'stringset'"
-- select d | b from binoptestss_b;
-- From the following (commented) query, we would expect to get an error like "operator '<<' incompatible with type 'stringset'"
-- select d << b from binoptestss_b;
-- From the following (commented) query, we would expect to get an error like "operator '>>' incompatible with type 'stringset'"
-- select d >> b from binoptestss_b;
-- From the following (commented) query, we would expect to get an error like "operator '+' incompatible with type 'stringset'"
-- select d + b from binoptestss_b;
-- From the following (commented) query, we would expect to get an error like "operator '-' incompatible with type 'stringset'"
-- select d - b from binoptestss_b;
-- From the following (commented) query, we would expect to get an error like "operator '*' incompatible with type 'stringset'"
-- select d * b from binoptestss_b;
-- From the following (commented) query, we would expect to get an error like "operator '/' incompatible with type 'stringset'"
-- select d / b from binoptestss_b;
-- From the following (commented) query, we would expect to get an error like "operator '%' incompatible with type 'stringset'"
-- select d % b from binoptestss_b;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'stringset'"
-- select d || b from binoptestss_b;


-- The following block of queries is for a test named binoptestss_id
-- First we'll create a table.
CREATE TABLE binoptestss_id (_id id,b id,d stringset);
-- Insert some data into the created table.
INSERT INTO binoptestss_id VALUES (10,20,['20','21']);
-- From the following (commented) query, we would expect to get an error like "types 'stringset' and 'id' are not equatable"
-- select d != b from binoptestss_id;
-- From the following (commented) query, we would expect to get an error like "types 'stringset' and 'id' are not equatable"
-- select d = b from binoptestss_id;
-- From the following (commented) query, we would expect to get an error like "operator '<=' incompatible with type 'stringset'"
-- select d <= b from binoptestss_id;
-- From the following (commented) query, we would expect to get an error like "operator '>=' incompatible with type 'stringset'"
-- select d >= b from binoptestss_id;
-- From the following (commented) query, we would expect to get an error like "operator '<' incompatible with type 'stringset'"
-- select d < b from binoptestss_id;
-- From the following (commented) query, we would expect to get an error like "operator '>' incompatible with type 'stringset'"
-- select d > b from binoptestss_id;
-- From the following (commented) query, we would expect to get an error like "operator '&' incompatible with type 'stringset'"
-- select d & b from binoptestss_id;
-- From the following (commented) query, we would expect to get an error like "operator '|' incompatible with type 'stringset'"
-- select d | b from binoptestss_id;
-- From the following (commented) query, we would expect to get an error like "operator '<<' incompatible with type 'stringset'"
-- select d << b from binoptestss_id;
-- From the following (commented) query, we would expect to get an error like "operator '>>' incompatible with type 'stringset'"
-- select d >> b from binoptestss_id;
-- From the following (commented) query, we would expect to get an error like "operator '+' incompatible with type 'stringset'"
-- select d + b from binoptestss_id;
-- From the following (commented) query, we would expect to get an error like "operator '-' incompatible with type 'stringset'"
-- select d - b from binoptestss_id;
-- From the following (commented) query, we would expect to get an error like "operator '*' incompatible with type 'stringset'"
-- select d * b from binoptestss_id;
-- From the following (commented) query, we would expect to get an error like "operator '/' incompatible with type 'stringset'"
-- select d / b from binoptestss_id;
-- From the following (commented) query, we would expect to get an error like "operator '%' incompatible with type 'stringset'"
-- select d % b from binoptestss_id;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'stringset'"
-- select d || b from binoptestss_id;


-- The following block of queries is for a test named binoptestss_d
-- First we'll create a table.
CREATE TABLE binoptestss_d (_id id,a stringset,d decimal(2));
-- Insert some data into the created table.
INSERT INTO binoptestss_d VALUES (1,['20','21'],12.34);
-- From the following (commented) query, we would expect to get an error like "types 'stringset' and 'decimal(2)' are not equatable"
-- select a != d from binoptestss_d;
-- From the following (commented) query, we would expect to get an error like "types 'stringset' and 'decimal(2)' are not equatable"
-- select a = d from binoptestss_d;
-- From the following (commented) query, we would expect to get an error like "operator '<=' incompatible with type 'stringset'"
-- select a <= d from binoptestss_d;
-- From the following (commented) query, we would expect to get an error like "operator '>=' incompatible with type 'stringset'"
-- select a >= d from binoptestss_d;
-- From the following (commented) query, we would expect to get an error like "operator '<' incompatible with type 'stringset'"
-- select a < d from binoptestss_d;
-- From the following (commented) query, we would expect to get an error like "operator '>' incompatible with type 'stringset'"
-- select a > d from binoptestss_d;
-- From the following (commented) query, we would expect to get an error like "operator '&' incompatible with type 'stringset'"
-- select a & d from binoptestss_d;
-- From the following (commented) query, we would expect to get an error like "operator '|' incompatible with type 'stringset'"
-- select a | d from binoptestss_d;
-- From the following (commented) query, we would expect to get an error like "operator '<<' incompatible with type 'stringset'"
-- select a << d from binoptestss_d;
-- From the following (commented) query, we would expect to get an error like "operator '>>' incompatible with type 'stringset'"
-- select a >> d from binoptestss_d;
-- From the following (commented) query, we would expect to get an error like "operator '+' incompatible with type 'stringset'"
-- select a + d from binoptestss_d;
-- From the following (commented) query, we would expect to get an error like "operator '-' incompatible with type 'stringset'"
-- select a - d from binoptestss_d;
-- From the following (commented) query, we would expect to get an error like "operator '*' incompatible with type 'stringset'"
-- select a * d from binoptestss_d;
-- From the following (commented) query, we would expect to get an error like "operator '/' incompatible with type 'stringset'"
-- select a / d from binoptestss_d;
-- From the following (commented) query, we would expect to get an error like "operator '%' incompatible with type 'stringset'"
-- select a % d from binoptestss_d;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'stringset'"
-- select a || d from binoptestss_d;


-- The following block of queries is for a test named binoptestss_ts
-- First we'll create a table.
CREATE TABLE binoptestss_ts (_id id,a stringset,ts timestamp);
-- Insert some data into the created table.
INSERT INTO binoptestss_ts VALUES (1,['20','21'],'2012-11-01T22:08:41Z');
-- From the following (commented) query, we would expect to get an error like "types 'stringset' and 'timestamp' are not equatable"
-- select a != ts from binoptestss_ts;
-- From the following (commented) query, we would expect to get an error like "types 'stringset' and 'timestamp' are not equatable"
-- select a = ts from binoptestss_ts;
-- From the following (commented) query, we would expect to get an error like " operator '<=' incompatible with type 'stringset'"
-- select a <= ts from binoptestss_ts;
-- From the following (commented) query, we would expect to get an error like " operator '>=' incompatible with type 'stringset'"
-- select a >= ts from binoptestss_ts;
-- From the following (commented) query, we would expect to get an error like " operator '<' incompatible with type 'stringset'"
-- select a < ts from binoptestss_ts;
-- From the following (commented) query, we would expect to get an error like " operator '>' incompatible with type 'stringset'"
-- select a > ts from binoptestss_ts;
-- From the following (commented) query, we would expect to get an error like "operator '&' incompatible with type 'stringset'"
-- select a & ts from binoptestss_ts;
-- From the following (commented) query, we would expect to get an error like "operator '|' incompatible with type 'stringset'"
-- select a | ts from binoptestss_ts;
-- From the following (commented) query, we would expect to get an error like "operator '<<' incompatible with type 'stringset'"
-- select a << ts from binoptestss_ts;
-- From the following (commented) query, we would expect to get an error like "operator '>>' incompatible with type 'stringset'"
-- select a >> ts from binoptestss_ts;
-- From the following (commented) query, we would expect to get an error like "operator '+' incompatible with type 'stringset'"
-- select a + ts from binoptestss_ts;
-- From the following (commented) query, we would expect to get an error like "operator '-' incompatible with type 'stringset'"
-- select a - ts from binoptestss_ts;
-- From the following (commented) query, we would expect to get an error like "operator '*' incompatible with type 'stringset'"
-- select a * ts from binoptestss_ts;
-- From the following (commented) query, we would expect to get an error like "operator '/' incompatible with type 'stringset'"
-- select a / ts from binoptestss_ts;
-- From the following (commented) query, we would expect to get an error like "operator '%' incompatible with type 'stringset'"
-- select a % ts from binoptestss_ts;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'stringset'"
-- select a || ts from binoptestss_ts;


-- The following block of queries is for a test named binoptestss_ids
-- First we'll create a table.
CREATE TABLE binoptestss_ids (_id id,a stringset,b idset);
-- Insert some data into the created table.
INSERT INTO binoptestss_ids VALUES (1,['101','103'],[101,102]);
-- From the following (commented) query, we would expect to get an error like "types 'stringset' and 'idset' are not equatable"
-- select a != b from binoptestss_ids;
-- From the following (commented) query, we would expect to get an error like "types 'stringset' and 'idset' are not equatable"
-- select a = b from binoptestss_ids;
-- From the following (commented) query, we would expect to get an error like " operator '<=' incompatible with type 'stringset'"
-- select a <= b from binoptestss_ids;
-- From the following (commented) query, we would expect to get an error like " operator '>=' incompatible with type 'stringset'"
-- select a >= b from binoptestss_ids;
-- From the following (commented) query, we would expect to get an error like " operator '<' incompatible with type 'stringset'"
-- select a < b from binoptestss_ids;
-- From the following (commented) query, we would expect to get an error like " operator '>' incompatible with type 'stringset'"
-- select a > b from binoptestss_ids;
-- From the following (commented) query, we would expect to get an error like " operator '&' incompatible with type 'stringset'"
-- select a & b from binoptestss_ids;
-- From the following (commented) query, we would expect to get an error like " operator '|' incompatible with type 'stringset'"
-- select a | b from binoptestss_ids;
-- From the following (commented) query, we would expect to get an error like " operator '<<' incompatible with type 'stringset'"
-- select a << b from binoptestss_ids;
-- From the following (commented) query, we would expect to get an error like " operator '>>' incompatible with type 'stringset'"
-- select a >> b from binoptestss_ids;
-- From the following (commented) query, we would expect to get an error like " operator '+' incompatible with type 'stringset'"
-- select a + b from binoptestss_ids;
-- From the following (commented) query, we would expect to get an error like " operator '-' incompatible with type 'stringset'"
-- select a - b from binoptestss_ids;
-- From the following (commented) query, we would expect to get an error like " operator '*' incompatible with type 'stringset'"
-- select a * b from binoptestss_ids;
-- From the following (commented) query, we would expect to get an error like " operator '/' incompatible with type 'stringset'"
-- select a / b from binoptestss_ids;
-- From the following (commented) query, we would expect to get an error like " operator '%' incompatible with type 'stringset'"
-- select a % b from binoptestss_ids;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'stringset'"
-- select a || b from binoptestss_ids;


-- The following block of queries is for a test named binoptestss_s
-- First we'll create a table.
CREATE TABLE binoptestss_s (_id id,a stringset,b string);
-- Insert some data into the created table.
INSERT INTO binoptestss_s VALUES (1,['101','102'],'101');
-- From the following (commented) query, we would expect to get an error like "types 'stringset' and 'string' are not equatable"
-- select a != b from binoptestss_s;
-- From the following (commented) query, we would expect to get an error like "types 'stringset' and 'string' are not equatable"
-- select a = b from binoptestss_s;
-- From the following (commented) query, we would expect to get an error like " operator '<=' incompatible with type 'stringset'"
-- select a <= b from binoptestss_s;
-- From the following (commented) query, we would expect to get an error like " operator '>=' incompatible with type 'stringset'"
-- select a >= b from binoptestss_s;
-- From the following (commented) query, we would expect to get an error like " operator '<' incompatible with type 'stringset'"
-- select a < b from binoptestss_s;
-- From the following (commented) query, we would expect to get an error like " operator '>' incompatible with type 'stringset'"
-- select a > b from binoptestss_s;
-- From the following (commented) query, we would expect to get an error like " operator '&' incompatible with type 'stringset'"
-- select a & b from binoptestss_s;
-- From the following (commented) query, we would expect to get an error like " operator '|' incompatible with type 'stringset'"
-- select a | b from binoptestss_s;
-- From the following (commented) query, we would expect to get an error like " operator '<<' incompatible with type 'stringset'"
-- select a << b from binoptestss_s;
-- From the following (commented) query, we would expect to get an error like " operator '>>' incompatible with type 'stringset'"
-- select a >> b from binoptestss_s;
-- From the following (commented) query, we would expect to get an error like " operator '+' incompatible with type 'stringset'"
-- select a + b from binoptestss_s;
-- From the following (commented) query, we would expect to get an error like " operator '-' incompatible with type 'stringset'"
-- select a - b from binoptestss_s;
-- From the following (commented) query, we would expect to get an error like " operator '*' incompatible with type 'stringset'"
-- select a * b from binoptestss_s;
-- From the following (commented) query, we would expect to get an error like " operator '/' incompatible with type 'stringset'"
-- select a / b from binoptestss_s;
-- From the following (commented) query, we would expect to get an error like " operator '%' incompatible with type 'stringset'"
-- select a % b from binoptestss_s;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'stringset'"
-- select a || b from binoptestss_s;


-- The following block of queries is for a test named binoptestss_ss
-- First we'll create a table.
CREATE TABLE binoptestss_ss (_id id,a stringset,b stringset);
-- Insert some data into the created table.
INSERT INTO binoptestss_ss VALUES (1,['102','103'],['101','102']);
select a != b from binoptestss_ss;
select a = b from binoptestss_ss;
-- From the following (commented) query, we would expect to get an error like " operator '<=' incompatible with type 'stringset'"
-- select a <= b from binoptestss_ss;
-- From the following (commented) query, we would expect to get an error like " operator '>=' incompatible with type 'stringset'"
-- select a >= b from binoptestss_ss;
-- From the following (commented) query, we would expect to get an error like " operator '<' incompatible with type 'stringset'"
-- select a < b from binoptestss_ss;
-- From the following (commented) query, we would expect to get an error like " operator '>' incompatible with type 'stringset'"
-- select a > b from binoptestss_ss;
-- From the following (commented) query, we would expect to get an error like " operator '&' incompatible with type 'stringset'"
-- select a & b from binoptestss_ss;
-- From the following (commented) query, we would expect to get an error like " operator '|' incompatible with type 'stringset'"
-- select a | b from binoptestss_ss;
-- From the following (commented) query, we would expect to get an error like " operator '<<' incompatible with type 'stringset'"
-- select a << b from binoptestss_ss;
-- From the following (commented) query, we would expect to get an error like " operator '>>' incompatible with type 'stringset'"
-- select a >> b from binoptestss_ss;
-- From the following (commented) query, we would expect to get an error like " operator '+' incompatible with type 'stringset'"
-- select a + b from binoptestss_ss;
-- From the following (commented) query, we would expect to get an error like " operator '-' incompatible with type 'stringset'"
-- select a - b from binoptestss_ss;
-- From the following (commented) query, we would expect to get an error like " operator '*' incompatible with type 'stringset'"
-- select a * b from binoptestss_ss;
-- From the following (commented) query, we would expect to get an error like " operator '/' incompatible with type 'stringset'"
-- select a / b from binoptestss_ss;
-- From the following (commented) query, we would expect to get an error like " operator '%' incompatible with type 'stringset'"
-- select a % b from binoptestss_ss;
-- From the following (commented) query, we would expect to get an error like "operator '||' incompatible with type 'stringset'"
-- select a || b from binoptestss_ss;


-- The following block of queries is for a test named table-0
select cast(1 as int);
select cast(1 as bool);
select cast(0 as bool);
select cast(1 as decimal(2));
select cast(1 as id);
-- From the following (commented) query, we would expect to get an error like "'int' cannot be cast to 'idset'"
-- select cast(1 as idset);
select cast(1 as string);
-- From the following (commented) query, we would expect to get an error like "'int' cannot be cast to 'stringset'"
-- select cast(1 as stringset);
select cast(1000 as timestamp);


-- The following block of queries is for a test named cast_int
-- First we'll create a table.
CREATE TABLE cast_int (_id id,i1 int min 0 max 1000,b1 bool,d1 decimal(2),id1 id,ids1 idset,s1 string,ss1 stringset,t1 timestamp);
-- Insert some data into the created table.
INSERT INTO cast_int VALUES (1,1000,true,12.34,20,[101,102],'foo',['101','102'],'2012-11-01T22:08:41Z');
select _id, cast(i1 as int) from cast_int;
select _id, cast(i1 as bool) from cast_int;
select _id, cast(i1 as decimal(2)) from cast_int;
select _id, cast(i1 as id) from cast_int;
-- From the following (commented) query, we would expect to get an error like "'int' cannot be cast to 'idset'"
-- select _id, cast(i1 as idset) from cast_int;
select _id, cast(i1 as string) from cast_int;
-- From the following (commented) query, we would expect to get an error like "'int' cannot be cast to 'stringset'"
-- select _id, cast(i1 as stringset) from cast_int;
select _id, cast(i1 as timestamp) from cast_int;


-- The following block of queries is for a test named cast_bool
-- First we'll create a table.
CREATE TABLE cast_bool (_id id,i1 int min 0 max 1000,b1 bool,d1 decimal(2),id1 id,ids1 idset,s1 string,ss1 stringset,t1 timestamp);
-- Insert some data into the created table.
INSERT INTO cast_bool VALUES (1,1000,true,12.34,20,[101,102],'foo',['101','102'],'2012-11-01T22:08:41Z');
select _id, cast(b1 as int) from cast_bool;
select _id, cast(b1 as bool) from cast_bool;
-- From the following (commented) query, we would expect to get an error like "'bool' cannot be cast to 'decimal(2)'"
-- select _id, cast(b1 as decimal(2)) from cast_bool;
-- From the following (commented) query, we would expect to get an error like "'bool' cannot be cast to 'id'"
-- select _id, cast(b1 as id) from cast_bool;
-- From the following (commented) query, we would expect to get an error like "'bool' cannot be cast to 'idset'"
-- select _id, cast(b1 as idset) from cast_bool;
select _id, cast(b1 as string) from cast_bool;
-- From the following (commented) query, we would expect to get an error like "'bool' cannot be cast to 'stringset'"
-- select _id, cast(b1 as stringset) from cast_bool;
-- From the following (commented) query, we would expect to get an error like "'bool' cannot be cast to 'timestamp'"
-- select _id, cast(b1 as timestamp) from cast_bool;


-- The following block of queries is for a test named cast_dec
-- First we'll create a table.
CREATE TABLE cast_dec (_id id,i1 int min 0 max 1000,b1 bool,d1 decimal(2),id1 id,ids1 idset,s1 string,ss1 stringset,t1 timestamp);
-- Insert some data into the created table.
INSERT INTO cast_dec VALUES (1,1000,true,12.34,20,[101,102],'foo',['101','102'],'2012-11-01T22:08:41Z');
-- From the following (commented) query, we would expect to get an error like "'decimal(2)' cannot be cast to 'int'"
-- select _id, cast(d1 as int) from cast_dec;
-- From the following (commented) query, we would expect to get an error like "'decimal(2)' cannot be cast to 'bool'"
-- select _id, cast(d1 as bool) from cast_dec;
select _id, cast(d1 as decimal(2)) from cast_dec;
-- From the following (commented) query, we would expect to get an error like "'decimal(2)' cannot be cast to 'id'"
-- select _id, cast(d1 as id) from cast_dec;
-- From the following (commented) query, we would expect to get an error like "'decimal(2)' cannot be cast to 'idset'"
-- select _id, cast(d1 as idset) from cast_dec;
select _id, cast(d1 as string) from cast_dec;
-- From the following (commented) query, we would expect to get an error like "'decimal(2)' cannot be cast to 'stringset'"
-- select _id, cast(d1 as stringset) from cast_dec;
-- From the following (commented) query, we would expect to get an error like "'decimal(2)' cannot be cast to 'timestamp'"
-- select _id, cast(d1 as timestamp) from cast_dec;


-- The following block of queries is for a test named cast_id
-- First we'll create a table.
CREATE TABLE cast_id (_id id,i1 int min 0 max 1000,b1 bool,d1 decimal(2),id1 id,ids1 idset,s1 string,ss1 stringset,t1 timestamp);
-- Insert some data into the created table.
INSERT INTO cast_id VALUES (1,1000,true,12.34,20,[101,102],'foo',['101','102'],'2012-11-01T22:08:41Z');
select _id, cast(id1 as int) from cast_id;
select _id, cast(id1 as bool) from cast_id;
select _id, cast(id1 as decimal(2)) from cast_id;
select _id, cast(id1 as id) from cast_id;
-- From the following (commented) query, we would expect to get an error like "'id' cannot be cast to 'idset'"
-- select _id, cast(id1 as idset) from cast_id;
select _id, cast(id1 as string) from cast_id;
-- From the following (commented) query, we would expect to get an error like "'id' cannot be cast to 'stringset'"
-- select _id, cast(id1 as stringset) from cast_id;
-- From the following (commented) query, we would expect to get an error like "'id' cannot be cast to 'timestamp'"
-- select _id, cast(id1 as timestamp) from cast_id;


-- The following block of queries is for a test named cast_ids
-- First we'll create a table.
CREATE TABLE cast_ids (_id id,i1 int min 0 max 1000,b1 bool,d1 decimal(2),id1 id,ids1 idset,s1 string,ss1 stringset,t1 timestamp);
-- Insert some data into the created table.
INSERT INTO cast_ids VALUES (1,1000,true,12.34,20,[101,102],'foo',['101','102'],'2012-11-01T22:08:41Z');
-- From the following (commented) query, we would expect to get an error like "'idset' cannot be cast to 'int'"
-- select _id, cast(ids1 as int) from cast_ids;
-- From the following (commented) query, we would expect to get an error like "'idset' cannot be cast to 'bool'"
-- select _id, cast(ids1 as bool) from cast_ids;
-- From the following (commented) query, we would expect to get an error like "'idset' cannot be cast to 'decimal(2)'"
-- select _id, cast(ids1 as decimal(2)) from cast_ids;
-- From the following (commented) query, we would expect to get an error like "'idset' cannot be cast to 'id'"
-- select _id, cast(ids1 as id) from cast_ids;
select _id, cast(ids1 as idset) from cast_ids;
select _id, cast(ids1 as string) from cast_ids;
-- From the following (commented) query, we would expect to get an error like "'idset' cannot be cast to 'stringset'"
-- select _id, cast(ids1 as stringset) from cast_ids;
-- From the following (commented) query, we would expect to get an error like "'idset' cannot be cast to 'timestamp'"
-- select _id, cast(ids1 as timestamp) from cast_ids;


-- The following block of queries is for a test named cast_string
-- First we'll create a table.
CREATE TABLE cast_string (_id id,i1 int min 0 max 1000,b1 bool,d1 decimal(2),id1 id,ids1 idset,s1 string,ss1 stringset,t1 timestamp);
-- Insert some data into the created table.
INSERT INTO cast_string VALUES (1,1000,true,12.34,20,[101,102],'foo',['101','102'],'2012-11-01T22:08:41Z');
-- From the following (commented) query, we would expect to get an error like "'foo' cannot be cast to 'int'"
-- select _id, cast(s1 as int) from cast_string;
select _id, cast('11' as int) from cast_string;
-- From the following (commented) query, we would expect to get an error like "'foo' cannot be cast to 'bool'"
-- select _id, cast(s1 as bool) from cast_string;
select _id, cast('true' as bool) from cast_string;
-- From the following (commented) query, we would expect to get an error like "'foo' cannot be cast to 'decimal(2)'"
-- select _id, cast(s1 as decimal(2)) from cast_string;
select _id, cast('12.34' as decimal(2)) from cast_string;
-- From the following (commented) query, we would expect to get an error like "'foo' cannot be cast to 'id'"
-- select _id, cast(s1 as id) from cast_string;
select _id, cast('11' as id) from cast_string;
-- From the following (commented) query, we would expect to get an error like "'string' cannot be cast to 'idset'"
-- select _id, cast(s1 as idset) from cast_string;
select _id, cast(s1 as string) from cast_string;
-- From the following (commented) query, we would expect to get an error like "'string' cannot be cast to 'stringset'"
-- select _id, cast(s1 as stringset) from cast_string;
-- From the following (commented) query, we would expect to get an error like "'foo' cannot be cast to 'timestamp'"
-- select _id, cast(s1 as timestamp) from cast_string;
select _id, cast('1970-01-01T00:16:40Z' as timestamp) from cast_string;


-- The following block of queries is for a test named cast_ss
-- First we'll create a table.
CREATE TABLE cast_ss (_id id,i1 int min 0 max 1000,b1 bool,d1 decimal(2),id1 id,ids1 idset,s1 string,ss1 stringset,t1 timestamp);
-- Insert some data into the created table.
INSERT INTO cast_ss VALUES (1,1000,true,12.34,20,[101,102],'foo',['101','102'],'2012-11-01T22:08:41Z');
-- From the following (commented) query, we would expect to get an error like "'stringset' cannot be cast to 'int'"
-- select _id, cast(ss1 as int) from cast_ss;
-- From the following (commented) query, we would expect to get an error like "'stringset' cannot be cast to 'bool'"
-- select _id, cast(ss1 as bool) from cast_ss;
-- From the following (commented) query, we would expect to get an error like "'stringset' cannot be cast to 'decimal(2)'"
-- select _id, cast(ss1 as decimal(2)) from cast_ss;
-- From the following (commented) query, we would expect to get an error like "'stringset' cannot be cast to 'id'"
-- select _id, cast(ss1 as id) from cast_ss;
-- From the following (commented) query, we would expect to get an error like "'stringset' cannot be cast to 'idset'"
-- select _id, cast(ss1 as idset) from cast_ss;
select _id, cast(ss1 as string) from cast_ss;
select _id, cast(ss1 as stringset) from cast_ss;
-- From the following (commented) query, we would expect to get an error like "'stringset' cannot be cast to 'timestamp'"
-- select _id, cast(ss1 as timestamp) from cast_ss;


-- The following block of queries is for a test named cast_ts
-- First we'll create a table.
CREATE TABLE cast_ts (_id id,i1 int min 0 max 1000,b1 bool,d1 decimal(2),id1 id,ids1 idset,s1 string,ss1 stringset,t1 timestamp);
-- Insert some data into the created table.
INSERT INTO cast_ts VALUES (1,1000,true,12.34,20,[101,102],'foo',['101','102'],'2012-11-01T22:08:41Z');
select _id, cast(t1 as int) from cast_ts;
-- From the following (commented) query, we would expect to get an error like "'timestamp' cannot be cast to 'bool'"
-- select _id, cast(t1 as bool) from cast_ts;
-- From the following (commented) query, we would expect to get an error like "'timestamp' cannot be cast to 'decimal(2)'"
-- select _id, cast(t1 as decimal(2)) from cast_ts;
-- From the following (commented) query, we would expect to get an error like "'timestamp' cannot be cast to 'id'"
-- select _id, cast(t1 as id) from cast_ts;
-- From the following (commented) query, we would expect to get an error like "'timestamp' cannot be cast to 'idset'"
-- select _id, cast(t1 as idset) from cast_ts;
select _id, cast(t1 as string) from cast_ts;
-- From the following (commented) query, we would expect to get an error like "'timestamp' cannot be cast to 'stringset'"
-- select _id, cast(t1 as stringset) from cast_ts;
select _id, cast(t1 as timestamp) from cast_ts;


-- The following block of queries is for a test named like_all_types
-- First we'll create a table.
CREATE TABLE like_all_types (_id id,i1 int min 0 max 1000,b1 bool,d1 decimal(2),id1 id,ids1 idset,s1 string,ss1 stringset,t1 timestamp);
-- Insert some data into the created table.
INSERT INTO like_all_types VALUES (1,1000,true,12.34,20,[101,102],'foo',['101','102'],'2012-11-01T22:08:41Z');
-- From the following (commented) query, we would expect to get an error like "operator 'LIKE' incompatible with type 'id'"
-- select _id like '%f_' from like_all_types;
-- From the following (commented) query, we would expect to get an error like "operator 'LIKE' incompatible with type 'int'"
-- select i1 like '%f_' from like_all_types;
-- From the following (commented) query, we would expect to get an error like "operator 'LIKE' incompatible with type 'bool'"
-- select b1 like '%f_' from like_all_types;
-- From the following (commented) query, we would expect to get an error like "operator 'LIKE' incompatible with type 'decimal(2)'"
-- select d1 like '%f_' from like_all_types;
-- From the following (commented) query, we would expect to get an error like "operator 'LIKE' incompatible with type 'id'"
-- select id1 like '%f_' from like_all_types;
-- From the following (commented) query, we would expect to get an error like "operator 'LIKE' incompatible with type 'idset'"
-- select ids1 like '%f_' from like_all_types;
select s1 like '%f_' from like_all_types;
-- From the following (commented) query, we would expect to get an error like "operator 'LIKE' incompatible with type 'stringset'"
-- select ss1 like '%f_' from like_all_types;
-- From the following (commented) query, we would expect to get an error like "operator 'LIKE' incompatible with type 'timestamp'"
-- select t1 like '%f_' from like_all_types;


-- The following block of queries is for a test named not_like_all_types
-- First we'll create a table.
CREATE TABLE not_like_all_types (_id id,i1 int min 0 max 1000,b1 bool,d1 decimal(2),id1 id,ids1 idset,s1 string,ss1 stringset,t1 timestamp);
-- Insert some data into the created table.
INSERT INTO not_like_all_types VALUES (1,1000,true,12.34,20,[101,102],'foo',['101','102'],'2012-11-01T22:08:41Z');
-- From the following (commented) query, we would expect to get an error like "operator 'NOTLIKE' incompatible with type 'id'"
-- select _id not like '%f_' from not_like_all_types;
-- From the following (commented) query, we would expect to get an error like "operator 'NOTLIKE' incompatible with type 'int'"
-- select i1 not like '%f_' from not_like_all_types;
-- From the following (commented) query, we would expect to get an error like "operator 'NOTLIKE' incompatible with type 'bool'"
-- select b1 not like '%f_' from not_like_all_types;
-- From the following (commented) query, we would expect to get an error like "operator 'NOTLIKE' incompatible with type 'decimal(2)'"
-- select d1 not like '%f_' from not_like_all_types;
-- From the following (commented) query, we would expect to get an error like "operator 'NOTLIKE' incompatible with type 'id'"
-- select id1 not like '%f_' from not_like_all_types;
-- From the following (commented) query, we would expect to get an error like "operator 'NOTLIKE' incompatible with type 'idset'"
-- select ids1 not like '%f_' from not_like_all_types;
select s1 not like '%f_' from not_like_all_types;
-- From the following (commented) query, we would expect to get an error like "operator 'NOTLIKE' incompatible with type 'stringset'"
-- select ss1 not like '%f_' from not_like_all_types;
-- From the following (commented) query, we would expect to get an error like "operator 'NOTLIKE' incompatible with type 'timestamp'"
-- select t1 not like '%f_' from not_like_all_types;


-- The following block of queries is for a test named null_all_types
-- First we'll create a table.
CREATE TABLE null_all_types (_id id,i int min 0 max 1000,i1 int min 0 max 1000,b1 bool,d1 decimal(2),id1 id,ids1 idset,s1 string,ss1 stringset,t1 timestamp);
-- Insert some data into the created table.
INSERT INTO null_all_types VALUES (1,1,null,null,null,null,null,null,null,null);
select _id is null from null_all_types;
select i is null from null_all_types;
select i1 is null from null_all_types;
select b1 is null from null_all_types;
select d1 is null from null_all_types;
select id1 is null from null_all_types;
select ids1 is null from null_all_types;
select s1 is null from null_all_types;
select ss1 is null from null_all_types;
select t1 is null from null_all_types;


-- The following block of queries is for a test named not_null_all_types
-- First we'll create a table.
CREATE TABLE not_null_all_types (_id id,i int min 0 max 1000,i1 int min 0 max 1000,b1 bool,d1 decimal(2),id1 id,ids1 idset,s1 string,ss1 stringset,t1 timestamp);
-- Insert some data into the created table.
INSERT INTO not_null_all_types VALUES (1,1,null,null,null,null,null,null,null,null);
select _id is not null from not_null_all_types;
select i1 is not null from not_null_all_types;
select b1 is not null from not_null_all_types;
select d1 is not null from not_null_all_types;
select id1 is not null from not_null_all_types;
select ids1 is not null from not_null_all_types;
select s1 is not null from not_null_all_types;
select ss1 is not null from not_null_all_types;
select t1 is not null from not_null_all_types;


-- The following block of queries is for a test named null_filter_all_types
-- First we'll create a table.
CREATE TABLE null_filter_all_types (_id id,i int min 0 max 1000,i1 int min 0 max 1000,b1 bool,d1 decimal(2),id1 id,ids1 idset,s1 string,ss1 stringset,t1 timestamp);
-- Insert some data into the created table.
INSERT INTO null_filter_all_types VALUES (1,1,null,null,null,null,null,null,null,null),(2,1,10,true,10.00,20,[101],'foo',['GET','POST'],'2012-11-01T22:08:41Z');
select _id from null_filter_all_types where _id is null;
select _id from null_filter_all_types where _id is not null;
select _id from null_filter_all_types where i1 is null;
select _id from null_filter_all_types where i1 is not null;
select _id from null_filter_all_types where b1 is null;
select _id from null_filter_all_types where b1 is not null;
select _id from null_filter_all_types where d1 is null;
select _id from null_filter_all_types where d1 is not null;
select _id from null_filter_all_types where id1 is null;
select _id from null_filter_all_types where id1 is not null;
select _id from null_filter_all_types where ids1 is null;
select _id from null_filter_all_types where ids1 is not null;
select _id from null_filter_all_types where s1 is null;
select _id from null_filter_all_types where s1 is not null;
select _id from null_filter_all_types where ss1 is null;
select _id from null_filter_all_types where ss1 is not null;
select _id from null_filter_all_types where t1 is null;
select _id from null_filter_all_types where t1 is not null;


-- The following block of queries is for a test named between_all_types
-- First we'll create a table.
CREATE TABLE between_all_types (_id id,i1 int min 0 max 1000,b1 bool,d1 decimal(2),id1 id,ids1 idset,s1 string,ss1 stringset,t1 timestamp);
-- Insert some data into the created table.
INSERT INTO between_all_types VALUES (1,1000,true,12.34,20,[101,102],'foo',['101','102'],'2012-11-01T22:08:41Z');
select _id between 1 and 10 from between_all_types;
select i1 between 1 and 10 from between_all_types;
select d1 between 10 and 15 from between_all_types;
-- From the following (commented) query, we would expect to get an error like "type 'bool' cannot be used as a range subscript"
-- select b1 between true and false from between_all_types;
select d1 between 1.23 and 4.56 from between_all_types;
select id1 between 3 and 7 from between_all_types;
-- From the following (commented) query, we would expect to get an error like "type 'array(int)' cannot be used as a range subscript"
-- select ids1 between [100, 102] and [456, 789] from between_all_types;
-- From the following (commented) query, we would expect to get an error like "type 'string' cannot be used as a range subscript"
-- select s1 between 'foo' and 'bar' from between_all_types;
-- From the following (commented) query, we would expect to get an error like "type 'array(string)' cannot be used as a range subscript"
-- select ss1 between ['a', 'b'] and ['c', 'd'] from between_all_types;
select t1 between '2010-11-01T22:08:41+00:00' and '2013-11-01T22:08:41+00:00' from between_all_types;
select id1 between 1 and 100 and i1 = 1000 from between_all_types;
select i1 from between_all_types where i1 between 1 and 10000;
select i1 from between_all_types where i1 between 50 and 100;
select i1 from between_all_types where i1 between 1 and 10000 and id1 = 20;


-- The following block of queries is for a test named not_between_all_types
-- First we'll create a table.
CREATE TABLE not_between_all_types (_id id,i1 int min 0 max 1000,b1 bool,d1 decimal(2),id1 id,ids1 idset,s1 string,ss1 stringset,t1 timestamp);
-- Insert some data into the created table.
INSERT INTO not_between_all_types VALUES (1,1000,true,12.34,20,[101,102],'foo',['101','102'],'2012-11-01T22:08:41Z');
select _id not between 1 and 10 from not_between_all_types;
select i1 not between 1 and 10 from not_between_all_types;
select d1 not between 10 and 15 from between_all_types;
-- From the following (commented) query, we would expect to get an error like "type 'bool' cannot be used as a range subscript"
-- select b1 not between true and false from not_between_all_types;
select d1 not between 1.23 and 4.56 from not_between_all_types;
select id1 between 3 and 7 from not_between_all_types;
-- From the following (commented) query, we would expect to get an error like "type 'array(int)' cannot be used as a range subscript"
-- select ids1 not between [100, 102] and [456, 789] from not_between_all_types;
-- From the following (commented) query, we would expect to get an error like "type 'string' cannot be used as a range subscript"
-- select s1 not between 'foo' and 'bar' from not_between_all_types;
-- From the following (commented) query, we would expect to get an error like "type 'array(string)' cannot be used as a range subscript"
-- select ss1 not between ['a', 'b'] and ['c', 'd'] from not_between_all_types;
select t1 not between '2010-11-01T22:08:41+00:00' and '2013-11-01T22:08:41+00:00' from not_between_all_types;


-- The following block of queries is for a test named in-tests
-- First we'll create a table.
CREATE TABLE in_all_types (_id id,i1 int min 0 max 1000,b1 bool,d1 decimal(2),id1 id,ids1 idset,s1 string,ss1 stringset,t1 timestamp);
-- Insert some data into the created table.
INSERT INTO in_all_types VALUES (1,1000,true,12.34,20,[101,102],'foo',['101','102'],'2012-11-01T22:08:41Z');
select _id in (1, 10) from in_all_types;
select i1 in (1, 1000) from in_all_types;
select b1 in (true, false) from in_all_types;
select d1 in (1.23, 4.56) from in_all_types;
select id1 in (3, 7) from in_all_types;
select ids1 in ([101, 102], [456, 789]) from in_all_types;
select s1 in ('foo', 'bar') from in_all_types;
select ss1 in (['a', 'b'], ['101', '102']) from in_all_types;
select t1 in ('2010-11-01T22:08:41+00:00', '2013-11-01T22:08:41+00:00', '2012-11-01T22:08:41+00:00') from in_all_types;
select t1._id in (select t2._id from in_all_types as t2) from in_all_types as t1;
select t1._id in (select t2.id1 from in_all_types as t2) from in_all_types as t1;


-- The following block of queries is for a test named not_in_all_types
-- First we'll create a table.
CREATE TABLE not_in_all_types (_id id,i1 int min 0 max 1000,b1 bool,d1 decimal(2),id1 id,ids1 idset,s1 string,ss1 stringset,t1 timestamp);
-- Insert some data into the created table.
INSERT INTO not_in_all_types VALUES (1,1000,true,12.34,20,[101,102],'foo',['101','102'],'2012-11-01T22:08:41Z');
select _id not in (1, 10) from not_in_all_types;
select i1 not in (1, 1000) from not_in_all_types;
select b1 not in (true, false) from not_in_all_types;
select d1 not in (1.23, 4.56) from not_in_all_types;
select id1 not in (3, 7) from not_in_all_types;
select ids1 not in ([101, 102], [456, 789]) from not_in_all_types;
select s1 not in ('foo', 'bar') from not_in_all_types;
select ss1 not in (['a', 'b'], ['101', '102']) from not_in_all_types;
select t1 not in ('2010-11-01T22:08:41+00:00', '2013-11-01T22:08:41+00:00', '2012-11-01T22:08:41+00:00') from not_in_all_types;
select t1._id not in (select t2._id from in_all_types as t2) from in_all_types as t1;


-- The following block of queries is for a test named count_test
-- First we'll create a table.
CREATE TABLE count_test (_id id,i1 int min 0 max 1000,d1 decimal(2),i2 int min 0 max 1000);
-- Insert some data into the created table.
INSERT INTO count_test VALUES (1,10,10.00,100),(2,10,10.00,200),(3,11,11.00,null),(4,12,12.00,null),(5,12,12.00,null),(6,13,13.00,null);
-- From the following (commented) query, we would expect to get an error like "count of formal parameters (1) does not match count of actual parameters (2)"
-- SELECT COUNT(i1, d1) AS count_rows FROM count_test;
-- From the following (commented) query, we would expect to get an error like "column reference expected"
-- SELECT COUNT(1) AS count_rows FROM count_test;
SELECT COUNT(*) AS count_rows FROM count_test;
SELECT COUNT(_id) AS count_rows FROM count_test;
SELECT COUNT(i1) as a, COUNT(i2) as b FROM count_test;
SELECT COUNT(*) + 10 - 11 * 2 AS count_rows FROM count_test;
SELECT COUNT(*) AS count_rows FROM count_test WHERE i1 = 10;
SELECT COUNT(*) AS count_rows FROM count_test WHERE i1 != 10;
SELECT COUNT(*) AS count_rows FROM count_test WHERE i1 < 12;
SELECT COUNT(*) AS count_rows FROM count_test WHERE i1 > 12;
SELECT COUNT(*) AS count_rows FROM count_test WHERE i1 = 10 AND i2 = 100;
SELECT COUNT(*) AS count_rows FROM count_test WHERE i1 = 10 OR i1 = 200 OR i1 = 12;


-- The following block of queries is for a test named count_d_test
-- First we'll create a table.
CREATE TABLE count_d_test (_id id,i1 int min 0 max 1000,i2 int min 0 max 1000);
-- Insert some data into the created table.
INSERT INTO count_d_test VALUES (1,10,100),(2,10,200),(3,11,null),(4,12,null),(5,12,null),(6,13,null);
SELECT COUNT(distinct i1) AS count_rows FROM count_d_test;
SELECT COUNT(distinct i1) AS count_rows FROM count_d_test where i1 > 11;
SELECT COUNT(distinct i1) AS count_rows, sum(i1) as sum_rows FROM count_d_test where i1 > 11;
SELECT COUNT(distinct _id) AS count_rows FROM count_d_test;


-- The following block of queries is for a test named sum_test
-- First we'll create a table.
CREATE TABLE sum_test (_id id,i1 int min 0 max 1000,d1 decimal(2),i2 int min 0 max 1000,s1 string);
-- Insert some data into the created table.
INSERT INTO sum_test VALUES (1,10,10.00,100,'foo'),(2,10,10.00,200,'foo'),(3,11,11.00,null,'foo'),(4,12,12.00,null,'foo'),(5,12,12.00,null,'foo'),(6,13,13.00,null,'foo');
-- From the following (commented) query, we would expect to get an error like "column reference expected"
-- SELECT sum(*) AS sum_rows FROM sum_test;
-- From the following (commented) query, we would expect to get an error like "_id column cannot be used in aggregate function 'sum'"
-- SELECT sum(_id) AS sum_rows FROM sum_test;
SELECT sum(1) AS sum_rows FROM sum_test;
-- From the following (commented) query, we would expect to get an error like "count of formal parameters (1) does not match count of actual parameters (2)"
-- SELECT sum(i1, d1) AS sum_rows FROM sum_test;
SELECT sum(i1) AS sum_rows FROM sum_test;
SELECT sum(d1) AS sum_rows FROM sum_test;
SELECT sum(d1 + 5) AS sum_rows FROM sum_test;


-- The following block of queries is for a test named avg_test
-- First we'll create a table.
CREATE TABLE avg_test (_id id,i1 int min 0 max 1000,d1 decimal(2),s1 string,id1 id);
-- Insert some data into the created table.
INSERT INTO avg_test VALUES (1,10,10.00,'foo',10),(2,10,10.00,'foo',11),(3,11,11.00,'foo',12),(4,12,12.00,'foo',13),(5,12,12.00,'foo',14),(6,13,13.00,'foo',15);
-- From the following (commented) query, we would expect to get an error like "column reference expected"
-- SELECT avg(*) AS avg_rows FROM avg_test;
-- From the following (commented) query, we would expect to get an error like "_id column cannot be used in aggregate function 'avg'"
-- SELECT avg(_id) AS avg_rows FROM avg_test;
-- From the following (commented) query, we would expect to get an error like "count of formal parameters (1) does not match count of actual parameters (2)"
-- SELECT avg(i1, d1) AS avg_rows FROM avg_test;
-- From the following (commented) query, we would expect to get an error like "integer or decimal expression expected"
-- SELECT avg(s1) AS avg_rows FROM avg_test;
SELECT avg(id1) AS avg_rows FROM avg_test;
SELECT avg(i1) AS avg_rows FROM avg_test;
SELECT avg(d1) AS avg_rows FROM avg_test;
SELECT avg(d1) AS avg_rows FROM avg_test WHERE d1 > 10;
SELECT avg(len(s1)) AS avg_rows FROM avg_test;
SELECT avg(i1) AS avg_rows FROM avg_test WHERE i1 > 100;
SELECT avg(d1) AS avg_rows FROM avg_test WHERE d1 > 100.0;


-- The following block of queries is for a test named percentile_test
-- First we'll create a table.
CREATE TABLE percentile_test (_id id,i1 int min 0 max 1000,d1 decimal(2),s1 string);
-- Insert some data into the created table.
INSERT INTO percentile_test VALUES (1,10,10.00,'foo'),(2,10,10.00,'foo'),(3,11,11.00,'foo'),(4,12,12.00,'foo'),(5,12,12.00,'foo'),(6,13,13.00,'foo');
-- From the following (commented) query, we would expect to get an error like "column reference expected"
-- SELECT percentile(*) AS avg_rows FROM percentile_test;
-- From the following (commented) query, we would expect to get an error like "column reference expected"
-- SELECT percentile(10, i1) AS avg_rows FROM percentile_test;
-- From the following (commented) query, we would expect to get an error like "_id column cannot be used in aggregate function 'percentile'"
-- SELECT percentile(_id, 50) AS avg_rows FROM percentile_test;
-- From the following (commented) query, we would expect to get an error like "literal expression expected"
-- SELECT percentile(i1, d1) AS avg_rows FROM percentile_test;
-- From the following (commented) query, we would expect to get an error like "integer, decimal or timestamp expression expected"
-- SELECT percentile(s1, 50) AS avg_rows FROM percentile_test;
-- From the following (commented) query, we would expect to get an error like "percentile call cannot be pushed down to PQL is not supported"
-- SELECT percentile(i1, 50) AS avg_rows FROM percentile_test WHERE s1 != 'a';
SELECT percentile(i1, 50) AS p_rows FROM percentile_test;
SELECT percentile(d1, 50) AS p_rows FROM percentile_test;
SELECT percentile(i1, 50) AS p_rows FROM percentile_test WHERE i1 < 13;
SELECT percentile(d1, 50) AS p_rows FROM percentile_test WHERE d1 < 13;


-- The following block of queries is for a test named minmax_test
-- First we'll create a table.
CREATE TABLE minmax_test (_id id,i1 int min 0 max 1000,d1 decimal(2),s1 string,ts1 timestamp);
-- Insert some data into the created table.
INSERT INTO minmax_test VALUES (1,10,10.00,'afoo','2013-07-15T01:18:46Z'),(2,10,10.00,'bfoo','2014-07-15T01:18:46Z'),(3,11,11.00,'cfoo','2015-07-15T01:18:46Z'),(4,12,12.00,'dfoo','2016-07-15T01:18:46Z'),(5,12,12.00,'efoo','2017-07-15T01:18:46Z'),(6,13,13.00,'ffoo','2018-07-15T01:18:46Z');
-- From the following (commented) query, we would expect to get an error like "column reference expected"
-- SELECT min(*) AS p_rows FROM minmax_test;
-- From the following (commented) query, we would expect to get an error like "column reference expected"
-- SELECT max(*) AS p_rows FROM minmax_test;
-- From the following (commented) query, we would expect to get an error like "count of formal parameters (1) does not match count of actual parameters (2)"
-- SELECT min(i1, d1) AS p_rows FROM minmax_test;
-- From the following (commented) query, we would expect to get an error like "count of formal parameters (1) does not match count of actual parameters (2)"
-- SELECT max(i1, d1) AS p_rows FROM minmax_test;
SELECT min(1) AS p_rows FROM minmax_test;
SELECT max(1) AS p_rows FROM minmax_test;
-- From the following (commented) query, we would expect to get an error like "_id column cannot be used in aggregate function"
-- SELECT min(_id) AS p_rows FROM minmax_test;
-- From the following (commented) query, we would expect to get an error like "_id column cannot be used in aggregate function"
-- SELECT max(_id) AS p_rows FROM minmax_test;
SELECT min(s1) AS p_rows FROM minmax_test;
SELECT max(s1) AS p_rows FROM minmax_test;
SELECT min(len(s1)) AS p_rows FROM minmax_test;
SELECT max(len(s1)) AS p_rows FROM minmax_test;
SELECT min(i1) AS p_rows FROM minmax_test;
SELECT max(i1) AS p_rows FROM minmax_test;
SELECT min(d1) AS p_rows FROM minmax_test;
SELECT max(d1) AS p_rows FROM minmax_test;
SELECT min(d1) AS p_rows FROM minmax_test WHERE d1 > 10;
SELECT max(d1) AS p_rows FROM minmax_test WHERE d1 < 13;
select min(ts1) as min_val, max(ts1) as max_val from minmax_test;


-- The following block of queries is for a test named corr_test
-- First we'll create a table.
CREATE TABLE corr_test (_id id,i1 int min 0 max 1000,d1 decimal(2),s1 string,id1 id);
-- Insert some data into the created table.
INSERT INTO corr_test VALUES (1,10,10.00,'foo',10),(2,10,10.00,'foo2',11),(3,11,11.00,'foo34',12),(4,12,12.00,'foo45',13),(5,12,12.00,'foo63',14),(6,13,13.00,'foo22222',15);
-- From the following (commented) query, we would expect to get an error like "expected right paren, found ','"
-- SELECT corr(*, i1) AS corr1 FROM corr_test;
SELECT corr(i1, d1) AS corr1 FROM corr_test;
-- From the following (commented) query, we would expect to get an error like "_id column cannot be used in aggregate function 'corr'"
-- SELECT corr(_id, i1) AS corr1 FROM corr_test;
-- From the following (commented) query, we would expect to get an error like "count of formal parameters (2) does not match count of actual parameters (1)"
-- SELECT corr(i1) AS corr1 FROM corr_test;
-- From the following (commented) query, we would expect to get an error like "integer, decimal or timestamp expression expected"
-- SELECT corr(s1, i1) AS avg_rows FROM corr_test;
SELECT corr(len(s1), i1) AS corr1 FROM corr_test;


-- The following block of queries is for a test named var_test
-- First we'll create a table.
CREATE TABLE var_test (_id id,i1 int min 0 max 1000,d1 decimal(2),s1 string,id1 id);
-- Insert some data into the created table.
INSERT INTO var_test VALUES (1,10,10.00,'foo',10),(2,10,10.00,'foo',11),(3,11,11.00,'foo',12),(4,12,12.00,'foo',13),(5,12,12.00,'foo',14),(6,13,13.00,'foo',15);
-- From the following (commented) query, we would expect to get an error like "column reference expected"
-- SELECT var(*) AS var1 FROM var_test;
-- From the following (commented) query, we would expect to get an error like "_id column cannot be used in aggregate function 'var'"
-- SELECT var(_id) AS var1 FROM var_test;
-- From the following (commented) query, we would expect to get an error like "count of formal parameters (1) does not match count of actual parameters (2)"
-- SELECT var(i1, d1) AS var1 FROM var_test;
-- From the following (commented) query, we would expect to get an error like "integer, decimal or timestamp expression expected"
-- SELECT var(s1) AS var1 FROM var_test;
SELECT var(id1) AS var1 FROM var_test;
SELECT var(i1) AS var1 FROM var_test;
SELECT var(d1) AS var1 FROM var_test;
SELECT var(len(s1)) AS var1 FROM var_test;


-- The following block of queries is for a test named boolAggregateTests
-- First we'll create a table.
CREATE TABLE boolAggregateTests (_id id,i1 int min 0 max 1000,b1 bool);
-- Insert some data into the created table.
INSERT INTO boolAggregateTests VALUES (1,10,false),(2,10,false),(3,11,false),(4,12,true),(5,12,true),(6,13,true);
select count(b1) as c, sum(b1) as s, avg(b1) as a, min(b1) as mi, max(b1) as ma from boolAggregateTests where _id >= 4;
select count(b1) as c, sum(b1) as s, avg(b1) as a, min(b1) as mi, max(b1) as ma from boolAggregateTests where _id < 4;


-- The following block of queries is for a test named groupby_test
-- First we'll create a table.
CREATE TABLE groupby_test (_id id,i1 int min 0 max 1000,d1 decimal(2),s1 string,i2 int min 0 max 1000,is1 idset,id1 id);
-- Insert some data into the created table.
INSERT INTO groupby_test VALUES (6,13,13.00,'thirteen',null,[1,2,3],6),(1,10,10.00,'ten',100,[1,2],1),(5,12,12.00,'twelve',null,[1,3],1),(2,10,10.00,'ten',200,[1,2],2),(4,12,12.00,'twelve',null,[2,3],4),(3,11,11.00,'eleven',null,[1,3],3);
-- From the following (commented) query, we would expect to get an error like "column reference, alias reference or column position expected"
-- SELECT COUNT(*), i1 FROM groupby_test group by i1 order by count(*) asc;
-- From the following (commented) query, we would expect to get an error like "column reference, alias reference or column position expected"
-- SELECT COUNT(_id), i1 FROM groupby_test group by i1 order by count(*) asc;
SELECT COUNT(*), i1 FROM groupby_test group by i1 order by 2 asc;
SELECT COUNT(_id), i1 FROM groupby_test group by i1 order by 2 asc;
SELECT COUNT(*), i1 as c FROM groupby_test group by i1 order by c asc;
SELECT COUNT(_id), i1 as c FROM groupby_test group by i1 order by c asc;
SELECT COUNT(*), i1 as c FROM groupby_test group by i1 order by i1 asc;
SELECT COUNT(_id), i1 as c FROM groupby_test group by i1 order by i1 asc;
SELECT COUNT(*), i1 FROM groupby_test group by i1;
SELECT COUNT(_id), i1 FROM groupby_test group by i1;
SELECT COUNT(distinct i2) AS count_rows, i1 FROM groupby_test group by i1;
SELECT sum(i2) AS sum_rows, i1 FROM groupby_test group by i1;
SELECT COUNT(*) FROM groupby_test group by i1;
select count(distinct i2) AS count_rows, sum(i2) as sum_rows, i1 from groupby_test group by i1;
select avg(i1) as avg_rows, i1 from groupby_test group by i1;
select avg(d1) as avg_rows, i1 from groupby_test group by i1;
-- From the following (commented) query, we would expect to get an error like "aggregate 'PERCENTILE()' not allowed in GROUP BY"
-- select percentile(i1, 0) as p_rows, i1 from groupby_test group by i1;
-- From the following (commented) query, we would expect to get an error like "aggregate 'MIN()' not allowed in GROUP BY"
-- select min(i1) as p_rows, i1 from groupby_test group by i1;
-- From the following (commented) query, we would expect to get an error like "aggregate 'MAX()' not allowed in GROUP BY"
-- select max(i1) as p_rows, i1 from groupby_test group by i1;
SELECT COUNT(*), is1 FROM groupby_test group by is1;
SELECT COUNT(*), id1 FROM groupby_test group by id1;
SELECT COUNT(*), i1 FROM groupby_test group by i1 order by i1;
SELECT COUNT(*), s1 FROM groupby_test group by s1 order by s1;
SELECT COUNT(DISTINCT _id), s1 FROM groupby_test group by s1;


-- The following block of queries is for a test named groupby_set_test
-- First we'll create a table.
CREATE TABLE groupby_set_test (_id id,ids1 idset,ss1 stringset);
-- Insert some data into the created table.
INSERT INTO groupby_set_test VALUES (1,[1,2],['a','b']),(2,[3,4],['d','e']),(3,[1,4],['a','d']),(4,[3,2],['c','b']),(5,[3,2],['c','b']);
-- From the following (commented) query, we would expect to get an error like "unknown query hint 'flatter'"
-- select distinct ids1 from groupby_set_test with (flatter(foo));
-- From the following (commented) query, we would expect to get an error like "column 'foo' not found"
-- select distinct ids1 from groupby_set_test with (flatten(foo));
-- From the following (commented) query, we would expect to get an error like "query hint 'flatten' expected 1 parameter(s) (column name), got 2 parameters"
-- select distinct ids1 from groupby_set_test with (flatten(foo, bar));
select distinct ids1 from groupby_set_test;
select distinct ids1 from groupby_set_test with (flatten(ids1));
select distinct ids1, ss1 from groupby_set_test;
select distinct ids1, ss1 from groupby_set_test with (flatten(ids1));
select count(*), ids1 from groupby_set_test group by ids1;
select count(*), ids1 from groupby_set_test with (flatten(ids1)) group by ids1;
select distinct ss1 from groupby_set_test;
select distinct ss1 from groupby_set_test with (flatten(ss1));
select count(*), ss1 from groupby_set_test group by ss1;
select count(*), ss1 from groupby_set_test with (flatten(ss1)) group by ss1;
select count(distinct _id), ss1 from groupby_set_test group by ss1;


-- The following block of queries is for a test named createTable
-- From the following (commented) query, we would expect to get an error like "invalid value '0' for key partitions (should be a number between 1-10000)"
-- create table foo (_id id, i1 int) keypartitions 0;
-- From the following (commented) query, we would expect to get an error like "invalid value '10001' for key partitions (should be a number between 1-10000)"
-- create table foo (_id id, i1 int) keypartitions 10001;
-- From the following (commented) query, we would expect to get an error like "string literal expected"
-- create table foo (_id id, i1 int) comment 34;
-- From the following (commented) query, we would expect to get an error like "expected literal, found bad"
-- create table foo (_id id, i1 int) comment bad;
-- From the following (commented) query, we would expect to get an error like "int field min cannot be greater than max"
-- create table bar (_id id, i1 int min 20 max 19);
-- From the following (commented) query, we would expect to get an error like "_id column must be specified with type ID or STRING"
-- create table bar (_id int, i1 int);
-- From the following (commented) query, we would expect to get an error like "_id column must be specified with no constraints"
-- create table bar (_id id min 0 max 20, i1 int);
-- From the following (commented) query, we would expect to get an error like "'sd' is not a valid time unit"
-- create table bar (_id id, ts timestamp TIMEUNIT 'sd');
-- From the following (commented) query, we would expect to get an error like "'sd' is not a valid time quantum"
-- create table bar (_id id, isq1 idsetq TIMEQUANTUM 'sd');
-- From the following (commented) query, we would expect to get an error like "cannot create timequantum field without a time quantum"
-- create table bar (_id id, isq1 idsetq);
-- From the following (commented) query, we would expect to get an error like "'7' is not a valid time duration"
-- create table bar (_id id, isq1 idsetq TIMEQUANTUM 'YMD' TTL '7');
create table bar (_id id, i1 int) comment 'this should work';
-- From the following (commented) query, we would expect to get an error like "error creating table 'fb_bar'"
-- create table fb_bar (_id id, i1 int) comment 'this should not work';


-- The following block of queries is for a test named alterTable
-- First we'll create a table.
CREATE TABLE alter_table_test (_id id,a_int int);
-- From the following (commented) query, we would expect to get an error like "table 'alter_table_test_foo' not found"
-- alter table alter_table_test_foo add column a_int int;
-- From the following (commented) query, we would expect to get an error like "duplicate column 'a_int'"
-- alter table alter_table_test add column a_int int;
-- From the following (commented) query, we would expect to get an error like "column 'b_int' not found"
-- alter table alter_table_test drop column b_int;
select * from alter_table_test;
-- From the following (commented) query, we would expect to get an error like "error altering table 'fb_views' (system tables cannot be altered)"
-- alter table fb_views drop column updated_at;


-- The following block of queries is for a test named jointestusers
-- First we'll create a table.
CREATE TABLE users (_id id,name string,age int);
-- Insert some data into the created table.
INSERT INTO users VALUES (0,'a',21),(1,'b',18),(2,'c',28),(3,'d',34),(4,'e',36);


-- The following block of queries is for a test named jointestorders
-- First we'll create a table.
CREATE TABLE orders (_id id,userid int,price decimal(2));
-- Insert some data into the created table.
INSERT INTO orders VALUES (0,1,9.99),(1,0,3.99),(2,2,14.99),(3,3,5.99),(4,1,12.99),(5,2,1.99);


-- The following block of queries is for a test named jointestquantity
-- First we'll create a table.
CREATE TABLE quantity (_id id,userid int,quantity int);
-- Insert some data into the created table.
INSERT INTO quantity VALUES (0,1,1),(1,0,2),(2,2,2),(3,3,1),(4,1,3),(5,2,5);


-- The following block of queries is for a test named joinTests
select u._id, sum(orders.price) from orders o inner join users u on o.userid = u._id group by u._id;
select sum(price) from orders o inner join users u on o.userid = u._id where u.age > 20;
select sum(price) from orders o inner join users u on o.userid = u._id where u.age > 20 and o.price < 10.00;
SELECT COUNT(DISTINCT u.name) FROM orders o JOIN users u ON o.userid = u._id WHERE o.price > 9;
SELECT COUNT(u.name) FROM orders o JOIN users u ON o.userid = u._id WHERE o.price > 9;
select DISTINCT u._id from users u inner join orders o on o.userid = u._id join quantity q on o.userid = q.userid;
select DISTINCT u._id from users u inner join orders o on o.userid = u._id left join quantity q on o.userid = q.userid;
select u._id , o.userid from users u left join orders o on o.userid = u._id;
select distinct u._id, o.userid from users u left join orders o on o.userid = u._id left join quantity q on o.userid = q.userid;
select distinct u.* from users u join orders o on o.userid = u._id;
-- From the following (commented) query, we would expect to get an error like "types 'string' and 'int' are not equatable"
-- select u._id, o.userid from users u join orders o on u.name = o.userid;
-- From the following (commented) query, we would expect to get an error like "FULL join types are not supported"
-- select u._id , o.userid from users u full join orders o on o.userid = u._id;
-- From the following (commented) query, we would expect to get an error like "RIGHT join types are not supported"
-- select u._id , o.userid from users u right join orders o on o.userid = u._id;
-- From the following (commented) query, we would expect to get an error like "RIGHT join types are not supported"
-- select * from users u inner join orders o on o.userid = u._id right join quantity q on o.userid = q.userid;
select u._id, u.name, u.age, u2._id as u2_id, u2.name as u2name, u2.age as u2age from users u, (select * from users where _id=2) u2 where u._id=u2._id;


-- The following block of queries is for a test named bulk-insert-ndjson
-- First we'll create a table.
CREATE TABLE bulk-insert-ndjson (_id id,id_col id,string_col string,int_col int,decimal_col decimal(2),bool_col bool,time_col timestamp,stringset_col stringset,idset_col idset);
BULK INSERT INTO 
				    bulk-insert-ndjson (_id, id_col, string_col, int_col, decimal_col, bool_col, time_col, stringset_col, idset_col)
					map ('$.id' ID, '$.id_col' ID, '$.string_col' STRING, '$.int_col' INT, '$.decimal_col' DECIMAL(2), '$.bool_col' BOOL, '$.time_col' TIMESTAMP, '$.stringset_col' STRINGSET, '$.idset_col' IDSET)
					transform(@0, @1, @2, @3, @4, @5, @6, @7, @8)
					FROM x'{"id": 0, "id_col": 10, "string_col": "str1", "int_col": -123, "decimal_col": 1.12, "bool_col": false, "time_col": "2013-07-15T01:18:46Z","stringset_col": ["stringset1"], "idset_col": [101]}
					       {"id": 1, "id_col": 20, "string_col": "str2", "int_col":  321, "decimal_col": 31.2, "bool_col":  true, "time_col": "2014-07-15T01:18:46Z","stringset_col": ["stringset2"], "idset_col": [202]}
					       {"id": 2, "id_col": 30, "string_col": "str3", "int_col":  786, "decimal_col": 62.1, "bool_col": false, "time_col": "2015-07-15T01:18:46Z","stringset_col": ["stringset2", "stringset3"], "idset_col": [303, 404]}
					       {"id": 3, "id_col": 40, "string_col": "str4", "int_col":  986, "decimal_col": 72.11, "bool_col": false, "time_col": "2016-07-15T01:18:46Z","stringset_col": ["stringset4"], "idset_col": [505]}'
					with
						BATCHSIZE 10000
						format 'NDJSON'
						input 'STREAM';
select * from bulk-insert-ndjson;
BULK INSERT INTO
				bulk-insert-ndjson (_id, stringset_col, idset_col)
				map ('$.id' id, '$.stringset_col' STRINGSET, '$.idset_col' IDSET)
				transform(@0, @1, @2)
				FROM x'{"id": 0, "stringset_col": [], "idset_col": []}'
				with
					format 'NDJSON'
					input 'STREAM';
select _id, stringset_col, idset_col from bulk-insert-ndjson where _id = 0;
BULK INSERT INTO
				bulk-insert-ndjson (_id, stringset_col, idset_col)
				map ('$.id' ID, '$.stringset_col' STRINGSET, '$.idset_col' IDSET)
				transform(@0, @1, @2)
				FROM x'{"id": 0, "stringset_col": null, "idset_col": null}'
				with
					format 'NDJSON'
					input 'STREAM';
select _id, stringset_col, idset_col from bulk-insert-ndjson where _id = 0;
BULK INSERT INTO
				bulk-insert-ndjson (_id, stringset_col, idset_col)
				map ('$.id' ID, '$.stringset_col' STRINGSET, '$.idset_col' IDSET)
				transform(@0, @1, @2)
				FROM x'{"id": 4, "stringset_col": [], "idset_col": []}'
				with
					BATCHSIZE 10000
					format 'NDJSON'
					input 'STREAM';
select _id, stringset_col, idset_col from bulk-insert-ndjson where _id = 4;
BULK INSERT INTO
				bulk-insert-ndjson (_id, stringset_col, idset_col)
				map ('$.id' ID, '$.stringset_col' STRINGSET, '$.idset_col' IDSET)
				transform(@0, @1, @2)
				FROM x'{"id": 5, "stringset_col": null, "idset_col": null}'
				with
					BATCHSIZE 10000
					format 'NDJSON'
					input 'STREAM';
select _id, stringset_col, idset_col from bulk-insert-ndjson where _id = 5;
BULK INSERT INTO
				bulk-insert-ndjson (_id, stringset_col, idset_col)
				map ('$.id' ID, '$.stringset_col' STRINGSET, '$.idset_col' IDSET)
				transform(@0, @1, @2)
				FROM x'{"id": 6, "stringset_col": null, "idset_col": null}'
				with
					BATCHSIZE 10000
					format 'NDJSON'
					input 'STREAM'
					NULL_AS_EMPTY_SET;
select _id, stringset_col, idset_col from bulk-insert-ndjson where _id = 6;


-- The following block of queries is for a test named copyTable
-- First we'll create a table.
CREATE TABLE copytest (_id id,id_col id,string_col string,int_col int,decimal_col decimal(2),bool_col bool,time_col timestamp,stringset_col stringset,idset_col idset);
-- Insert some data into the created table.
INSERT INTO copytest VALUES (1,10,'foo',10,10.00,false,'2012-11-01T22:08:41Z',['foo','bar'],[1,2]),(2,11,'foo1',11,11.00,true,'2012-11-01T22:08:41Z',['foo1','bar1'],[11,21]),(3,12,'foo2',12,12.00,false,'2012-11-01T22:08:41Z',['foo2','bar2'],[12,22]),(4,13,'foo3',13,13.00,true,'2012-11-01T22:08:41Z',['foo3','bar3'],[13,23]);


-- The following block of queries is for a test named copyTests
-- From the following (commented) query, we would expect to get an error like "table or view 'foo' not found"
-- copy foo to bar;
-- From the following (commented) query, we would expect to get an error like "already exists"
-- copy copytest to copytest;
copy copytest to copytesttwo;


-- The following block of queries is for a test named copyTableCache
-- First we'll create a table.
CREATE TABLE copytestcache (_id id,id_col id CACHETYPE LRU SIZE 1024,string_col string CACHETYPE RANKED SIZE 1024,int_col int,decimal_col decimal(2),bool_col bool,time_col timestamp,stringset_col stringset CACHETYPE RANKED SIZE 1024,idset_col idset CACHETYPE LRU SIZE 1024);
-- Insert some data into the created table.
INSERT INTO copytestcache VALUES (1,10,'foo',10,10.00,false,'2012-11-01T22:08:41Z',['foo','bar'],[1,2]),(2,11,'foo1',11,11.00,true,'2012-11-01T22:08:41Z',['foo1','bar1'],[11,21]),(3,12,'foo2',12,12.00,false,'2012-11-01T22:08:41Z',['foo2','bar2'],[12,22]),(4,13,'foo3',13,13.00,true,'2012-11-01T22:08:41Z',['foo3','bar3'],[13,23]);


-- The following block of queries is for a test named copyTestsCache
-- From the following (commented) query, we would expect to get an error like "already exists"
-- copy copytestcache to copytestcache;
copy copytestcache to copytestcachetwo;


-- The following block of queries is for a test named single-bool-field
-- First we'll create a table.
CREATE TABLE singleboolfield (_id id,a_bool bool);
insert into singleboolfield (_id, a_bool) values
						(1, true),
						(2, true),
						(3, false),
						(4, false),
						(5, null),
						(6, null);
select * from singleboolfield;
insert into singleboolfield (_id, a_bool) values
						(1, false),
						(2, null),
						(3, true),
						(4, null),
						(5, false),
						(6, true);
select * from singleboolfield;


-- The following block of queries is for a test named time_quantum_insert
-- First we'll create a table.
CREATE TABLE time_quantum_insert (_id id,i1 int min 0 max 1000,ss1 stringsetq timequantum 'YMD',ids1 idsetq timequantum 'YMD');
insert into time_quantum_insert (_id, i1, ss1, ids1) values (1, 1, ['1'], [1]);
-- From the following (commented) query, we would expect to get an error like "an expression of type 'tuple(array(string))' cannot be assigned to type 'stringsetq'"
-- insert into time_quantum_insert (_id, i1, ss1, ids1) values (1, 1, {['1']}, {[1]});
-- From the following (commented) query, we would expect to get an error like "an expression of type 'tuple(array(int))' cannot be assigned to type 'idsetq'"
-- insert into time_quantum_insert (_id, i1, ss1, ids1) values (1, 1, ['1'], {[1]});
-- From the following (commented) query, we would expect to get an error like "unable to convert 'notatimestamp' to type 'timestamp'"
-- insert into time_quantum_insert (_id, i1, ss1, ids1) values (1, 1, {'notatimestamp', ['1']}, [1]);
-- From the following (commented) query, we would expect to get an error like "unable to convert 'notatimestamp' to type 'timestamp'"
-- insert into time_quantum_insert (_id, i1, ss1, ids1) values (1, 1, ['1'], {'notatimestamp', [1]});
-- From the following (commented) query, we would expect to get an error like "an expression of type 'tuple(string, array(int))' cannot be assigned to type 'stringsetq'"
-- insert into time_quantum_insert (_id, i1, ss1, ids1) values (1, 1, {'2022-01-01T00:00:00Z', [1]}, {[1]});
-- From the following (commented) query, we would expect to get an error like "an expression of type 'tuple(string, array(string), array(string))' cannot be assigned to type 'stringsetq'"
-- insert into time_quantum_insert (_id, i1, ss1, ids1) values (1, 1, {'2022-01-01T00:00:00Z', ['1'], ['2']}, {[1]});
-- From the following (commented) query, we would expect to get an error like "an expression of type 'tuple(string, array(string))' cannot be assigned to type 'idsetq'"
-- insert into time_quantum_insert (_id, i1, ss1, ids1) values (1, 1, ['1'], {'2022-01-01T00:00:00Z', ['1']});
-- From the following (commented) query, we would expect to get an error like "an expression of type 'string' cannot be assigned to type 'stringsetq'"
-- insert into time_quantum_insert (_id, i1, ss1, ids1) values (1, 1, '1', {[1]});
-- From the following (commented) query, we would expect to get an error like "an expression of type 'int' cannot be assigned to type 'idsetq'"
-- insert into time_quantum_insert (_id, i1, ss1, ids1) values (1, 1, ['1'], 1);
-- From the following (commented) query, we would expect to get an error like "tuple literal must contain at least one member"
-- insert into time_quantum_insert (_id, i1, ss1, ids1) values (1, 1, {}, {});
insert into time_quantum_insert (_id, i1, ss1, ids1) values (1, 1, {1676649734, ['1']}, {1676649734, [1]});
insert into time_quantum_insert(_id, i1, ss1, ids1) values (1, 3, ['test1'], [1]);
insert into time_quantum_insert(_id, i1, ss1, ids1) values (1, 3, {1676649734, ['test2']}, {1676649734, [2]});
insert into time_quantum_insert(_id, i1, ss1, ids1) values (1, 3, {'2022-01-01T00:00:00Z', ['test3']}, {'2022-01-01T00:00:00Z', [3]});
insert into time_quantum_insert(_id, i1, ss1, ids1) values (1, 3, {'2022-01-02T00:00:00Z', ['test4']}, {'2022-01-01T00:00:00Z', [4]});
insert into time_quantum_insert(_id, i1, ss1, ids1) values (1, 3, {'2022-01-03T00:00:00Z', ['test5']}, {'2022-01-01T00:00:00Z', [5]});
-- From the following (commented) query, we would expect to get an error like "'rangeq': count of formal parameters (3) does not match count of actual parameters (2)"
-- select a._id, a.ss1 from time_quantum_insert a where rangeq(a.ss1, '2022-01-02T00:00:00Z');
-- From the following (commented) query, we would expect to get an error like "calling ranqeq() 'from' and 'to' parameters cannot both be null"
-- select a._id, a.ss1 from time_quantum_insert a where rangeq(a.ss1, null, null);
-- From the following (commented) query, we would expect to get an error like "time quantum expression expected"
-- select a._id, a.ss1 from time_quantum_insert a where rangeq(a.i1, null, null);
-- From the following (commented) query, we would expect to get an error like "calling ranqeq() usage invalid"
-- select a._id, a.ss1, rangeq(a.ss1, '2022-01-02T00:00:00Z', null) from time_quantum_insert a;
select a._id, a.ss1 from time_quantum_insert a where rangeq(a.ss1, '2022-01-02T00:00:00Z', null);
select a._id, a.ids1 from time_quantum_insert a where rangeq(a.ids1, '2022-01-02T00:00:00Z', null);


-- The following block of queries is for a test named timeQuantumQueryTest
-- First we'll create a table.
CREATE TABLE timeQuantumQueryTest (_id id,i1 int min 0 max 1000,b1 bool,d1 decimal(2),id1 id,ids1 idset,s1 string,ss1 stringset,t1 timestamp);
-- Insert some data into the created table.
INSERT INTO timeQuantumQueryTest VALUES (1,1000,true,12.34,20,[101,102],'foo',['101','102'],'2012-11-01T22:08:41Z');
-- From the following (commented) query, we would expect to get an error like "operator 'NOTLIKE' incompatible with type 'id'"
-- select _id not like '%f_' from timeQuantumQueryTest;


-- The following block of queries is for a test named timeQuantumBulkInsertTest
create table tqtest (
					_id id,
					intcol int min 0 max 10000, 
					tqcol stringsetq timequantum 'YMD',
					tqicol idsetq timequantum 'YMD'
				) comment 'table with time quantum columns';
-- From the following (commented) query, we would expect to get an error like "unable to map from datasource using the type 'stringsetq'"
-- bulk insert into tqtest (_id, intcol, tqcol, tqicol)
-- 				map (
-- 					0 id, 1 int, 2 stringsetq, 3 idsetq)
-- 				transform (
-- 					@0, @1, @2, @3)
-- 				from
-- 					x'1,1,1,1'
-- 				with
-- 					FORMAT 'CSV'
-- 					INPUT 'STREAM';
-- From the following (commented) query, we would expect to get an error like "unable to map from datasource using the type 'idsetq'"
-- bulk insert into tqtest (_id, intcol, tqcol, tqicol)
-- 				map (
-- 					0 id, 1 int, 2 stringset, 3 idsetq)
-- 				transform (
-- 					@0, @1, @2, @3)
-- 				from
-- 					x'1,1,1,1'
-- 				with
-- 					FORMAT 'CSV'
-- 					INPUT 'STREAM';
bulk insert into tqtest (_id, intcol, tqcol, tqicol)
				map (
					0 id, 1 int, 2 stringset, 3 idset)
				transform (
					@0, @1, @2, @3)
				from
					x'1,1,1,1'
				with
					FORMAT 'CSV'
					INPUT 'STREAM';
select * from tqtest;
delete from tqtest;
bulk insert into tqtest (_id, intcol, tqcol, tqicol)
				map (
					'$.id' id, '$.intcol' int, '$.tqcol' stringset, '$.tqicol' idset)
				transform (
					@0, @1, @2, @3)
				from
					x'{"id": "1", "intcol": 1, "tqcol": "1", "tqicol": 1}'
				with
					FORMAT 'NDJSON'
					INPUT 'STREAM';
select * from tqtest;
delete from tqtest;
bulk insert into tqtest (_id, intcol, tqcol, tqicol)
				map (
					'$.id' id, '$.intcol' int, '$.tqcol' stringset, '$.tqicol' idset)
				transform (
					@0, @1, @2, @3)
				from
					x'{"id": "1", "intcol": 1, "tqcol": ["1"], "tqicol": [1]}'
				with
					FORMAT 'NDJSON'
					INPUT 'STREAM';
select * from tqtest;
delete from tqtest;
bulk insert into tqtest (_id, intcol, tqcol, tqicol)
				map (
					'$.id' id, '$.intcol' int, '$.timestamp' timestamp, '$.tqcol' stringset, '$.tqicol' idset)
				transform (
					@0, @1, tuple(@2, @3), tuple(@2, @4))
				from
					x'{"id": "1", "intcol": 1, "timestamp": 1676649734, "tqcol": ["1"], "tqicol": [1]}'
				with
					FORMAT 'NDJSON'
					INPUT 'STREAM';
select * from tqtest;
delete from tqtest;
bulk insert into tqtest (_id, intcol, tqcol, tqicol)
				map (
					'$.id' id, '$.intcol' int, '$.timestamp' timestamp, '$.tqcol' stringset, '$.tqicol' idset)
				transform (
					@0, @1, tuple(@2, @3), tuple(@2, @4))
				from
					x'{"id": "1", "intcol": 1, "timestamp": "2022-01-01T00:00:00Z", "tqcol": ["1"], "tqicol": [1]}'
				with
					FORMAT 'NDJSON'
					INPUT 'STREAM';
select * from tqtest;
-- From the following (commented) query, we would expect to get an error like "an expression of type 'tuple(timestamp, stringset, int)' cannot be assigned to type 'stringsetq'"
-- bulk insert into tqtest (_id, intcol, tqcol, tqicol)
-- 				map (
-- 					'$.id' id, '$.intcol' int, '$.timestamp' timestamp, '$.tqcol' stringset, '$.tqicol' idset)
-- 				transform (
-- 					@0, @1, tuple(@2, @3, @1), tuple(@2, @4))
-- 				from
-- 					x'{"id": "1", "intcol": 1, "timestamp": "2022-01-01T00:00:00Z", "tqcol": ["1"], "tqicol": [1]}'
-- 				with
-- 					FORMAT 'NDJSON'
-- 					INPUT 'STREAM';


-- The following block of queries is for a test named pragmaTests
-- From the following (commented) query, we would expect to get an error like "pragma not found"
-- pragma foo;
pragma flush_buffers;


-- The following block of queries is for a test named vectorFunctionsTests
select cosine_distance([1.23, 2.35, 4.56], [4.56, 1.23, 2.35]) as cos, euclidian_distance([1.23, 2.35, 4.56], [4.56, 1.23, 2.35]) as euc;


-- The following block of queries is for a test named createPipelineTests
create table pltarget (_id id, i1 int);
create pipeline test_pipeline
				with
				  schedule '*/3 * * * *' -- every 3 minutes
				  highwater rowid int    -- keep track of where we got up to
				as 
					insert into pltarget (
						_id, i1) 
					select
						1, @highwater;
select _id, name, schedule, highwater, statement, state, highwater_value, owner, updated_by from fb_pipelines;
alter pipeline test_pipeline with state start;
alter pipeline test_pipeline with state stop;
drop pipeline test_pipeline;


-- The following block of queries is for a test named sql1testsgrouper
-- First we'll create a table.
CREATE TABLE grouper (_id id,color string,score int min -1000 max 1000,age int min 0 max 100,height int min 0 max 1000,timestamp timestamp);
-- Insert some data into the created table.
INSERT INTO grouper VALUES (1,'blue',-10,27,20,'2011-04-02T12:32:00Z'),(2,'blue',-8,16,30,'2011-01-02T12:32:00Z'),(3,'red',6,19,40,'2012-01-02T12:32:00Z'),(4,'green',0,27,50,'2013-09-02T12:32:00Z'),(5,'blue',-2,16,60,'2014-01-02T12:32:00Z'),(6,'blue',100,34,70,'2010-05-02T12:32:00Z'),(7,'blue',0,27,80,'2016-08-02T12:32:00Z'),(8,null,-13,16,90,'2020-01-02T12:32:00Z'),(9,'red',80,16,100,'2000-03-02T12:32:00Z'),(10,'red',-2,31,110,'2018-01-02T12:32:00Z');


-- The following block of queries is for a test named sql1testsjoiner
-- First we'll create a table.
CREATE TABLE joiner (_id id,grouperid int min 0 max 1000,jointype int min -1000 max 1000);
-- Insert some data into the created table.
INSERT INTO joiner VALUES (1,1,1),(2,2,1),(3,5,1),(4,6,1),(5,7,1),(6,3,2),(7,8,2),(8,9,2),(9,1,3),(10,2,3);


-- The following block of queries is for a test named sql1testsdelete
-- First we'll create a table.
CREATE TABLE delete_me (_id id,unused int);
-- Insert some data into the created table.
INSERT INTO delete_me VALUES (1,1);


-- The following block of queries is for a test named sql1testsqueries
select age from grouper;
select * from grouper where _id=2;
select * from grouper;
select count(*) from grouper g INNER JOIN joiner j ON g._id = j.grouperid;
select distinct _id from grouper g INNER JOIN joiner j ON g._id = j.grouperid;
select _id from grouper g INNER JOIN joiner j ON g._id = j.grouperid where g.color = 'red';
select _id from grouper g INNER JOIN joiner j ON g._id = j.grouperid where g.color = 'red' and j.jointype = 2;
select distinct score from grouper order by score asc;
select distinct score from grouper order by score desc;
select distinct score from grouper;
select distinct height from grouper;
select age as yrs, count(*) as cnt from grouper group by age;
select age, height from grouper where timestamp > '2017-09-02T12:32:00Z' and height > 40 group by age, height;
select age, height from grouper where timestamp > '2017-09-02T12:32:00Z' or height > 90;
select age, height from grouper where timestamp > '2017-09-02T12:32:00Z' and timestamp < '2019-09-02T12:32:00Z';
select age, height from grouper where (timestamp > '2017-09-02T12:32:00Z' and timestamp < '2019-09-02T12:32:00Z');
-- From the following (commented) query, we would expect to get an error like "expected expression, found"
-- select age, height from grouper where ();
select distinct age from grouper where timestamp > '2019-09-02T12:32:00Z';
show tables;
show columns from grouper;
select _id from grouper g INNER JOIN joiner j ON g._id = j.grouperid where g.color = 'red' and j.jointype = 2 and g.age = 16;
select _id from grouper g INNER JOIN joiner j ON g._id = j.grouperid where j.jointype = 2 and g.color = 'red' and g.age = 16;
select _id from grouper g INNER JOIN joiner j ON g._id = j.grouperid where g.color = 'red' and g.age = 16 and j.jointype = 2;
-- From the following (commented) query, we would expect to get an error like "table or view 'index_not_found' not found"
-- select * from index_not_found;
-- From the following (commented) query, we would expect to get an error like "column 'field_not_found' not found"
-- select field_not_found from grouper;
-- From the following (commented) query, we would expect to get an error like "table or view 'index_not_found' not found"
-- select * from grouper, index_not_found;
-- From the following (commented) query, we would expect to get an error like "column 'field_not_found' not found"
-- select _id, age, field_not_found from grouper;
-- From the following (commented) query, we would expect to get an error like "column 'field_not_found' not found"
-- select age, color, count(*) from grouper group by field_not_found, age, color;
-- From the following (commented) query, we would expect to get an error like "column 'field_not_found' not found"
-- select count(*) from grouper inner join joiner on grouper._id = joiner.field_not_found;


-- The following block of queries is for a test named selectStreamingTests_bsi
create table streamingtest_bsi (_id id, ival int, dval decimal(2));
insert into streamingtest_bsi values (1, 1, .1),(2,4,.2),(1048575,4,.5),(1048577,3,.3),(1048576,4,.5);
select * from streamingtest_bsi with(stream(nope));
select _id from streamingtest_bsi with(stream(nope)) limit 1;
select _id from streamingtest_bsi with(stream(nope)) where _id=2;


-- The following block of queries is for a test named selectStreamingTests_string
create table streamingtest_string (_id string, text string);
insert into streamingtest_string values ('key-1', 'first'),('key-2','last');
select * from streamingtest_string with(stream(nope));


-- The following block of queries is for a test named selectStreamingTests_set
create table streamingtest_set (_id id, sets idset);
insert into streamingtest_set values (1, [1]),(2,[2]);
select * from streamingtest_set with(stream(nope));


-- The following block of queries is for a test named selectStreamingTests_stringset
create table streamingtest_stringset (_id id, sets stringset);
insert into streamingtest_stringset values (1, ['a']),(2,['x']);
select * from streamingtest_stringset with(stream(nope));


-- The following block of queries is for a test named selectStreamingTests_bool
create table streamingtest_bool (_id id, a bool,b bool);
insert into streamingtest_bool values (1, true,false),(2,true,true);
select * from streamingtest_bool with(stream(nope));


-- The following block of queries is for a test named selectStreamingTests_quantum
create table streamingtest_quantum (_id id, stringsetcolq stringsetq timequantum 'YMD', idsetcolq idsetq timequantum 'YMD');
insert into streamingtest_quantum values (1, {'2018-08-31T00:00:00Z', ['A']}, {1676649734, [1]}), (2, {'2018-09-15T00:00:00Z', ['B']}, {1676648734, [2]});
select * from streamingtest_quantum with(stream(nope));


-- The following block of queries is for a test named selectStreamingTests_insertselect
create table streamingtest_a (_id id, text string);
create table streamingtest_b (_id id, text varchar(3));
insert into streamingtest_a values (1, 'a');
insert into streamingtest_b select * from streamingtest_a;
select * from streamingtest_b;


