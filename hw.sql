USE classicmodels;
select * from customers;
SELECT * FROM Employees;
SELECT * FROM offices;
SELECT * FROM orderDetails;
SELECT * FROM orders;
select * from payments;
select * from productlines;
SELECT * FROM Products;

#1 Single entity
#1.1
select * from offices order by country, state, city;
#1.2
select count(employeenumber) from employees;
#1.3
select sum(amount) as total_payments from payments;
#1.4
select * from productlines where productline like '%Cars%';
#1.5
select sum(amount) as total_payments from payments where paymentdate=('2004-10-28 00:00:00');
#1.6
select * from payments where amount>100000;
#1.7
select * from products order by productline;
#1.8
select count(productcode), productline from products group by productline;
#1.9
select min(amount) as min_payment from payments;
#1.10
select * from payments where amount>(SELECT AVG(amount)*2 FROM Payments);
#1.11
select AVG((MSRP-buyPrice)/buyPrice)*100 FROM Products;
#1.12
select count(distinct productname) from products;
#1.13
select customername, city from customers where salesRepEmployeenumber is Null;
#1.14
select concat(firstname,' ',lastname),jobtitle from employees where jobtitle like '%VP%' or jobtitle like '%manager%';
#1.15
select ordernumber,sum(pricEeach*quantityOrdered) as value from orderdetails 
group by ordernumber
having value >5000;

#2 One to many relationship
#1
select customername,salesRepEmployeenumber from customers 
inner join employees on customers.salesRepEmployeenumber=employees.employeenumber;
#2
select sum(amount) from payments  a
join customers  b on a.customernumber=b.customernumber
where customername='Atelier graphique';
#3
select sum(amount),paymentdate from payments group by paymentdate;
#4
select * from Products 
where productCode 
not in (select Products.productCode from Products 
join OrderDetails 
on Products.productCode = OrderDetails.productCode);
#5
select a.customername, sum(b.amount) from customers a
join payments b on a.customernumber=b.customernumber
group by a.customername;
#6
select count(b.ordernumber) from customers a
join orders b on a.customernumber=b.customernumber
where customername='Herkku Gifts';
#7
select concat(b.firstname,' ',b.lastname) from offices a
join employees b on a.officecode=b.officecode
where city='Boston';
#8
select customername,sum(amount)  from customers a
join payments b on a.customernumber=b.customernumber
group by customername
having sum(amount)>100000
order by sum(amount) desc;
#9
select sum(priceEach*quantityordered) value from orderdetails a
join orders b on a.ordernumber=b.ordernumber
where status='on hold';
#10
select customername, count(ordernumber) from orders a
join customers b on a.customernumber=b.customernumber
where status='on hold'
group by customername;

#3 Many to many relationship
#1
select Products.productName, Orders.orderDate from Products 
join OrderDetails 
on OrderDetails.productCode = Products.productCode 
join Orders 
on OrderDetails.orderNumber = Orders.orderNumber 
order by Orders.orderDate;
#2
select Orders.orderDate from Products 
join OrderDetails 
on OrderDetails.productCode = Products.productCode 
join Orders 
on OrderDetails.orderNumber = Orders.orderNumber 
where productname='1940 Ford Pickup Truck'
order by Orders.orderDate desc;
#3
select customername,sum(priceEach*quantityordered) value from customers a
join orders b on a.customernumber=b.customernumber
join orderdetails c on b.ordernumber=c.ordernumber
group by customername 
having value >25000;
#4
select count(distinct(ordernumber)),from orderdetails a
join products b on a.productcode=b.procudtcode

#5
























