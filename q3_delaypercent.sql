.open northwind.db
select CompanyName,round((Num1*1.0)/(Num2*1.0)*100,2)
from ((select Shipper.CompanyName,count(O.Id) as Num1
       from 'Order' as O,'Shipper'
       where (O.ShippedDate > O.RequiredDate) and (O.ShipVia = Shipper.Id)
       group by Shipper.CompanyName)
       natural join 
       (select Shipper.CompanyName,count(O.Id) as Num2
       from 'Order' as O,'Shipper'
       where (O.ShipVia = Shipper.Id)
       group by Shipper.CompanyName))
