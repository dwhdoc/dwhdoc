.open northwind.db
.tables
select distinct O.Id,ShipCountry,'NorthAmerica'
from 'Order' as 'O'
where ShipCountry = 'USA'
union 
select distinct O.Id,ShipCountry,'NorthAmerica'
from 'Order' as 'O'
where ShipCountry = 'Mexico'
union 
select distinct O.Id,ShipCountry,'NorthAmerica'
from 'Order' as 'O'
where ShipCountry = 'Canada' 
union  
select distinct O.Id,ShipCountry,'OtherPlace'
from 'Order' as 'O'
where (ShipCountry <> 'USA' and ShipCountry <> 'Mexico' and ShipCountry <> 'Canada' ) 
order by O.Id asc
limit 0,20;
