.open northwind.db
.tables
select distinct O.Id,ShipCountry,'NorthAmerica'
from 'Order' as 'O'
where ShipCountry = 'USA' and Id >15444
union 
select distinct O.Id,ShipCountry,'NorthAmerica'
from 'Order' as 'O'
where ShipCountry = 'Mexico' and Id >15444
union 
select distinct O.Id,ShipCountry,'NorthAmerica'
from 'Order' as 'O'
where ShipCountry = 'Canada' and Id >15444
union  
select distinct O.Id,ShipCountry,'OtherPlace'
from 'Order' as 'O'
where (ShipCountry <> 'USA' and ShipCountry <> 'Mexico' and ShipCountry <> 'Canada' and Id >15444) 
order by O.Id asc
limit 0,20;
