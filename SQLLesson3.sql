Create Table Rooms
(RoomId int not null,
RmName varchar(50),
TavernId int not null,
Sale int,
GuestId int not null,
OccupyDate Date,
Rate int
);

Insert Into Rooms Values
(321, 'Diamond', 103, '1500', 1214, '5/21/2022', 300),
(322, 'Topaz', 102, '1300', 1212, '3/05/2022', 120),
(333, 'Ruby', 101, '1800', 1213, '6/08/2022', 500);

Select *
From Guest
Where Birthday < '1/01/2000';

Select *
From Rooms
Where Rate > 100;

Select Distinct Name
From Guest;

Select Name
From Guest
Order By Name DESC;

Select Top 10 *
From Rooms
Where Sale >= 0;

Select 'Taverns' AS TavernId, Name
From Taverns
Union
Select 'Supply', TavernId, Name
From Supply;

Select Name, Level AS 'NewGroup'
From Guest;
