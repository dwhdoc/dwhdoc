.open northwind.db
select GoalId,GoalDate,Enddate,round(julianday(GoalDate)-julianday(Enddate),2)
from(select GoalId,GoalDate,Lag(GoalDate,1,(select OrderDate from 'Order' where CustomerId = 'BLONP' order by OrderDate))over(order by GoalDate ASC) as Enddate
from (select O.Id as GoalId , O.OrderDate as GoalDate
      from 'Order' as 'O'
      where (O.CustomerId = 'BLONP')
      order by GoalDate asc
      limit 10))



