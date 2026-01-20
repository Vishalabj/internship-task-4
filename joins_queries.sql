use chinook;
SHOW DATABASES;
show tables;
select * from customer;
select * from invoice;
select * from invoiceline;
#--- inner join QNO : 2 ------#
select FirstName,LastName,InvoiceDate
from customer,invoice
where customer.CustomerId=invoice.InvoiceId;
#-------validating output for match count ----------------
SELECT COUNT(*) AS total_orders
FROM Invoice;
select count(*) as joined_orders
from customer,invoice
where customer.CustomerId=invoice.InvoiceId;

###### QNO : 3 ############

select FirstName,LastName
from customer left join invoice
on customer.CustomerId=invoice.InvoiceId
where InvoiceId is null; 

##### QNO : 4 ###########

SELECT
    t.TrackId,
    t.Name AS track_name,
    SUM(il.Quantity * il.UnitPrice) AS total_revenue
FROM invoiceline il
INNER JOIN track t
    ON il.TrackId = t.TrackId
GROUP BY t.TrackId, t.Name
ORDER BY total_revenue DESC;

SELECT
    t.Name,
    SUM(il.Quantity * il.UnitPrice) AS revenue
FROM invoiceline il
JOIN track t ON il.TrackId = t.TrackId
GROUP BY t.Name
ORDER BY revenue DESC
LIMIT 5;

########### QNO : 5 ###############

SELECT
    g.GenreId,
    g.Name AS genre_name,
    SUM(il.Quantity * il.UnitPrice) AS total_revenue
FROM invoiceline il
INNER JOIN track t
    ON il.TrackId = t.TrackId
INNER JOIN genre g
    ON t.GenreId = g.GenreId
GROUP BY g.GenreId, g.Name
ORDER BY total_revenue DESC;

#### QNO : 6 #########
SELECT
    i.BillingCountry,
    SUM(il.Quantity * il.UnitPrice) AS total_sales
FROM invoice i
JOIN invoiceline il
    ON i.InvoiceId = il.InvoiceId
WHERE i.InvoiceDate BETWEEN '2013-01-01' AND '2013-12-31'
GROUP BY i.BillingCountry
ORDER BY total_sales DESC;

SELECT
    c.CustomerId,
    c.FirstName,
    c.LastName
FROM customer c
LEFT JOIN invoice i
    ON c.CustomerId = i.CustomerId
WHERE i.InvoiceId IS NULL;








