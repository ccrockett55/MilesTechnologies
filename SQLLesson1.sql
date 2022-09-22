Create table Taverns
(TavernId int not null Primary Key,
TavernName varchar(50) not null,
Location varchar(50)
);

Insert Into Taverns Values
(101, 'Amethyst', 'Texas'),
(102, 'Blue Topaz', 'Florida'),
(103, 'Diamond', 'Georgia'),
(104, 'Ruby', 'Texas'),
(105, 'Sapphire', 'New Mexico');

 Create table Supply
 (SupplyId int not null Primary Key,
 TavernId int not null,
 Name varchar(50),
 UnitOz int,
 Updated Date not null,
 Qty int
 );

Insert Into Supply Values
(211, 101, 'Pepsi', 15, '9/13/2022', 3),
(212, 102, 'Sprite', 20, '9/10/2022', 4),
(213, 103, 'Dr Pepper', 5, '9/13/2022', 1),
(214, 104, 'Coke', 10, '9/8/2022', 2),
(215, 105, '7 Up', 4, '9/11/2022', 2);

Create Table SupplyRecvd
(SupplyId int not null,
TavernId int not null,
Name varchar(50) not null,
Cost int not null,
CasesRecvd int not null,
DateRecvd Date not null
);

Insert Into SupplyRecvd Values
(211, 101, 'Pepsi', 25.22, 4, '9/08/2022'),
(212, 102, 'Sprite', 36.42, 8, '9/10/2022'),
(213, 103, 'Dr Pepper', 25.25, 6, '9/16/2022'),
(214, 104, 'Coke', 14.99, 5, '9/10/2022'),
(215, 105, '7 Up', 16.99, 4, '9/12/2022');

Create Table Services
(SvcId int not null,
Name varchar(100),
SvcStatusId varchar(50)
);

Insert Into Services Values
(21, 'Archery', 'A'),
(22, 'Sky Diving', 'IA'),
(23, 'Rock Climbing', 'A'),
(24, 'Painting', 'A'),
(25, 'Canoeing', 'A');

Create Table ServiceStatus
(SvcStatusId varchar(50),
Name varchar(50)
);

Insert Into ServiceStatus Values
('A', 'Active'),
('IA', 'Inactive');

 Create Table Sales
 (SvcId int not null,
  GuestName varchar(50),
 Price int,
 PurchaseDt Date,
 PurchaseAmt int,
 TavernId int not null
 );

 Insert Into Sales Values
 (21, 'Bob', 24.99, '9/13/2022', 2, 102),
 (22, 'Sarah', 15.99, '9/10/2022', 1, 104),
 (23, 'Lee', 31.99, '9/11/2022', 5, 101),
 (24, 'Peter', 16.99, '9/09/2022', 7, 101),
 (25, 'Victoria', 102.99, '9/16/2022', 3, 103);


