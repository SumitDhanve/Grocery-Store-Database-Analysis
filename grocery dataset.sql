CREATE DATABASE IF NOT EXISTS Grocery_store;
USE Grocery_store;

CREATE TABLE IF NOT EXISTS supplier (
    sup_id TINYINT PRIMARY KEY,
    sup_name VARCHAR(255),
    address TEXT
);

CREATE TABLE IF NOT EXISTS categories (
    cat_id TINYINT PRIMARY KEY,
    cat_name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS employees (
    emp_id TINYINT PRIMARY KEY,
    emp_name VARCHAR(255),
    hire_date VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS customers (
    cust_id SMALLINT PRIMARY KEY,
    cust_name VARCHAR(255),
    address TEXT
);

CREATE TABLE IF NOT EXISTS products (
    prod_id TINYINT PRIMARY KEY,
    prod_name VARCHAR(255),
    sup_id TINYINT,
    cat_id TINYINT,
    price DECIMAL(10,2),
    FOREIGN KEY (sup_id) REFERENCES supplier(sup_id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (cat_id) REFERENCES categories(cat_id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS orders (
    ord_id SMALLINT PRIMARY KEY,
    cust_id SMALLINT,
    emp_id TINYINT,
    order_date VARCHAR(255),
    FOREIGN KEY (cust_id) REFERENCES customers(cust_id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id) ON UPDATE CASCADE ON DELETE CASCADE
);
drop table orders;


CREATE TABLE IF NOT EXISTS orderdetails (
    ord_detID SMALLINT AUTO_INCREMENT PRIMARY KEY,
    ord_id SMALLINT,
    prod_id TINYINT,
    quantity TINYINT,
    each_price DECIMAL(10,2),
    total_price DECIMAL(10,2),
    FOREIGN KEY (ord_id) REFERENCES orders(ord_id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (prod_id) REFERENCES products(prod_id) ON UPDATE CASCADE ON DELETE CASCADE
);

select * from suppliers;
select * from categories;
select * from store_employees;
select * from customers;
select * from products;
select * from orders;
select * from orderdetails;

select p.name, c.cat_name, s.suppliername, p.price
from products as p
join categories as c on p.categoryid=c.cat_id
join suppliers as s on p.supplierid=s.supplierid;

-- find most expensive and chepest product
select prod;

--
select c.cat_name, count(p.Name) as product_count
from products as p 
join categories as c on p.CategoryID = c.cat_id
group by c.cat_name;

select cat_name, avg(TotalPrice) as avg_price
from products
inner join categories
using (cat_id)
inner join orderdetails
using (ProductID)
group by cat_name;

select * from store_employees;
select * from customers;
select * from orders;

select o.OrderID, c.cust_name, e.emp_name, o.OrderDate
from orders as o
join customers as c on c.cust_id = o.OrderDate
join employees as e on e.emp_id = o.EmployeeID;


-- find customers who ordered more than 3 times
select c.cust_name,count(OrderID) as order_count
from orders as o
join customers as c on c.cust_id = o.OrderID
group by c.cust_name
having order_count > 3;

-- order details 


select od.OrderDetailID, p.Name, od.Quantity,od.TotalPrice
from orderdetails as od
join products as p on od.ProductID=p.ProductId;

-- 5 most ordered product
select od.OrderDetailID, p.Name, od.Quantity,od.TotalPrice
from orderdetails as od
join products as p on od.ProductID=p.ProductID
order by od.Quantity desc limit 5;

-- total sales per order
select * from orderdetails;
select OrderID, sum(TotalPrice) as total_price
from orderdetails
group by OrderID ;

-- categories of products by price range
select * from products;
select Name,Price,(
		case
        when price < 90 then 'low'
        when price between 90 and 150 then 'medium'
        else 'high'
        end) as price_cat
from products;



