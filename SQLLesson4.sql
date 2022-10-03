Select FirstName, LastName, level
From Users
Where level = 'Admin';

Select Users.FirstName, Users.LastName, Users.level, Taverns.TavernName
From Users
Inner Join Taverns
Where Users.level = 'Admin';

Select Guest.Name, cl.Name, us.Level
From Guest
Inner Join Class As cl
On cl.GuestId = Guest.GuestId
Inner Join Users us
On us.ClassId = cl.ClassId
Order By Guest.Name ASC;

Select Top 10 Sales.*, Services.SvcName
From Sales
Inner Join Services
On Sales.SalesId = Services.SalesId;

Select Name
From Guest
Where Guest.ClassId >= 2;

Select Name
From Guest
Where Guest.ClassId >= 2 AND Guest.LevelId > 5;

Select Name, MAX(Guest.ClassId)
From Guest
Group By Name;

Select *
From Guest
Where StayDate Between '9-01-2022' AND '9-30-2022';
