--create tables and insert data
--test is called that because it's a table i've been using for tests
create table test(_id id, name string, cnum int, onum int);
insert into test values
(1, 'tanaka', 104, 1004)
(2, 'takeda', 101, 1003)
(3, 'jones', 102, 1008)
(4, 'jones', 102, 1002)
(5, 'smith', 100, 1006)
(6, 'takeda', 101, 1001)
(7, 'tanaka', 104, 1005)
(8, 'smith', 100, 1007)
(9, 'wei', 103, 1009)
(10, 'wei', 103, 1010);

create table customers(_id id, name string, cnum int, address string);
insert into customers values
(1, 'smith', 100, 'glastonbury')
(2, 'takeda', 101, 'tokyo')
(3, 'jones', 102, 'new york')
(4, 'wei', 103, 'yiling')
(5, 'tanaka', 104, 'tonari')
(6, 'lan', 105, 'gusu');

--find the address of the customer who made order number 1010
select c.address from customers as c where c.name in (select t.name from test as t where t.onum = 1010);

--find the name and customer number of any customers who have not made orders
select c.name, c.cnum from customers as c where c.cnum not in (select t.cnum from test as t);

--find how many orders have been placed by each customer whose address begins with 'g'
--this doesn't actually work because we don't support < or > on strings
select count(t.name) from test as t where t.name in (select c.name from customers as c where c.address > 'g' and c.address < 'h');

--this one doesn't work because we don't support BETWEEN for strings
select count(t.name) from test as t where t.name in (select c.name from customers as c where c.address between 'g' and 'h');

--find how many orders have been placed by each customer in glastonbury
select count(t.name) from test as t where t.name in (select c.name from customers as c where c.address = 'glastonbury');

--find all orders that were placed by customers in gusu or yiling
select t.onum from test as t where t.cnum in (select c.cnum from customers as c where c.address = 'gusu' or c.address = 'yiling');

--find customer name and number of customers who have placed orders, sorted alphabetically by name
select c.name, c.cnum from customers as c where c.cnum in (select t.cnum from test as t) order by name;

--show each customer who has placed orders with how many orders they have placed
select name, count(name) from test group by name;

--show how many orders were from yiling
select count(t.cnum) from test as t where t.cnum in (select c.cnum from customers as c where c.address = 'yiling');

--show each address with the number of orders that went to it
select customers.address, count(test.name) from customers join test on customers.name = test.name group by customers.address;

--show each order with the address it went to, ordered by order number
select test.onum, customers.address from customers join test on customers.name = test.name order by onum;