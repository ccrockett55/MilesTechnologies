Create Table Guest
(Acct# int not null,
Name varchar(50),
Birthday Date not null,
AcctCreated Date,
Status varchar(50),
Notes varchar(max),
RoleId int
);

Insert Into Guest Values
(1211, 'Bob', '5/24/1983', '8/11/2022', 'Happy', 'Has 3 kids', 1),
(1212, 'Sarah', '4/20/2000', '1/1/2022', 'Sad', 'Works for a pharmaceutical company', 3),
(1213, 'Lee', '9/13/1982', '3/8/2022', 'Happy', 'Owns a tech company', 1),
(1214, 'Peter', '12/25/1973', '6/06/2022', 'Happy', 'Walked on water', 2),
(1215, 'Victoria', '10/15/1997', '3/8/2022', 'Sad', 'Lost her job 3 days ago', 2);

Create Table Roles
(RoleId int not null,
Name varchar(50),
Level varchar(50)
);

Insert Into Roles Values
(1, 'President', 'Admin'),
(2, 'Vice President', 'Admin'),
(3, 'Secretary', 'Non-Admin');

Select Guest.*, Roles.Name
From Guest
Left Join Roles On Guest.RoleId=Roles.RoleId;

SELECT SupplyRecvd.Name, SupplyRecvd.DateRecvd, Sales.*
Into dbo.SupplySales
From SupplyRecvd, Sales
Where SupplyRecvd.TavernId=Sales.TavernId;

Alter Table Taverns
Add Constraint PK_Taverns Primary Key (TavernId);

Alter Table Taverns
Add Constraint FK_UserId
Foreign Key (UserId) References Users(UserId);

Alter Table Users
Add Constraint PK_Users Primary Key (UserId);

Alter Table Users
Add Constraint FK_TavernId
Foreign Key (TavernId) References Taverns(TavernId);

