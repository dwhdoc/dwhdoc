.open northwind.db

select ifnull(CompanyName,'MISSING_NAME'), AllId, expened 
from (select *,ntile(4) over(order by expened) as nt
      from((select O.CustomerId as AllId,round(sum(OrderDetail.UnitPrice*OrderDetail.Quantity),2) as expened
            from 'Order' as 'O','OrderDetail'
            where O.Id = OrderDetail.OrderId
            group by O.CustomerId
            order by expened)
            natural left outer join
            (select Customer.CompanyName,Customer.Id as AllId,round(sum(OrderDetail.UnitPrice*OrderDetail.Quantity),2) as expened
            from 'Customer','Order' as 'O','OrderDetail'
            where Customer.Id = O.CustomerId and O.Id = OrderDetail.OrderId
            group by Customer.Id
            order by expened)))
where (nt = 1)


