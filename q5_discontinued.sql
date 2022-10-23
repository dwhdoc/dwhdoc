.open northwind.db

select distinct Product.ProductName,Customer.CompanyName, Customer.ContactName

from 'Customer','Order' as 'O','OrderDetail','Product',(select min(O.OrderDate) as Nummin
from 'Order' as 'O','OrderDetail','Product'
where(O.Id = OrderDetail.OrderId and OrderDetail.ProductId = Product.Id and Product.Discontinued = 1)
group by Product.ProductName)

where (Customer.Id = O.CustomerId and O.Id = OrderDetail.OrderId and OrderDetail.ProductId = Product.Id and Product.Discontinued = 1 and O.OrderDate <= Nummin)
group by Product.ProductName
order by Product.ProductName asc;

