.open northwind.db
select CategoryName,Num,Numavg,Nummin,Nummax,Numsum
from (select distinct CategoryName,count(Category.CategoryName) as Num,round(avg(product.UnitPrice),2) as Numavg,min(product.UnitPrice) as Nummin,max(product.UnitPrice) as Nummax,sum(UnitsOnOrder) as Numsum
      from'Category','product'
      where(Category.Id = product.CategoryId)
      group by Category.CategoryName)
where (Num > 10);

