.open northwind.db
select distinct RegionDescription, FirstName, LastName, BirthDate
from 'Employee', 'EmployeeTerritory', 'Territory', 'Region'
where (Employee.Id = EmployeeTerritory.EmployeeId and EmployeeTerritory.TerritoryId = Territory.Id and Territory.RegionId = Region.Id and exists (select * from (select distinct RegionDescription as 'Re', max(BirthDate) as 'Bi' from 'Employee', 'EmployeeTerritory','Territory','Region' where Employee.Id = EmployeeTerritory.EmployeeId and EmployeeTerritory.TerritoryId = Territory.Id and Territory.RegionId = Region.Id group by RegionDescription) as 'EmI' where RegionDescription = EmI.Re and BirthDate = EmI.Bi))
order by Region.Id
