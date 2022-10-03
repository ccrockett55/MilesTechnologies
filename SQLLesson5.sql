Select users.*, roles.name
From Users
Inner Join Roles rs
On users.roleid = rs.roleid;

select cl.name, count(distinct glc.guestId) as [guestCount]
from Class cl 
inner join Class c on cl.id = c.classTypeId 
inner join GuestLinkClass glc on c.id = glc.classId
group by cl.name;

Select Guest.*, Class.Name, Level.Name
From Guest
Inner Join Class cl
On Guest.GuestId = cl.GuestId
Inner Join Level lv
On Guest.GuestId = lv.GuestId
Order By Guest.Name ASC;
Go
create function LevelGrouping(@level int)
returns varchar(15) as begin
	return case when @level <= 5 then 'Beginner' when @level <= 10 then 'Intermediate' else 'Expert' end;

select g.name, ct.name as [class], c.level, dbo.LevelGrouping(c.level) as [rank]
from Guest g inner join GuestLinkClass glc on (g.id = glc.guestId) inner join Class c on (glc.classId = c.id) inner join ClassType ct on (ct.id = c.classTypeId)
inner join (select g2.id, max(c2.level) as maxLvl from Class c2 inner join GuestLinkClass glc2 on c2.id = glc2.classId inner join Guest g2 on glc2.guestId = g2.id group by g2.id)
	gml on g.id = gml.id and gml.maxLvl = c.level;

Go
create function ReportUnusedRooms(@day date)
returns table as return
	select r.id as [roomNumber], rs.dateStayedIn, rs.dateCheckedOut, t.name, rs.rate
		from Room r inner join Tavern t on r.tavernId = t.id inner join RoomStay rs on r.id = rs.roomId
		where not (DATEDIFF(day, @day, rs.dateStayedIn) <= 0 and DATEDIFF(day, rs.dateCheckedOut, @day) <= 0);

Go
create function RoomsPrice(@pricemin price, @pricemax price)
returns table as return
	select r.id as [roomNumber], rs.rate, t.name
		from Rooms r inner join Taverns t on r.tavernId = t.id inner join RoomStay rs on r.id = rs.roomId
		where @pricemin <= rs.rate and rs.rate <= @pricemax;

Go
select * from dbo.RoomsPrice(100.00, 200.00);
select * from dbo.RoomsPrice(250.00, 450.00);
insert into TavernUser(name, roleId) values ('Gold', 106);
insert into Taverns(name, locationId, userId, numFloors) values ('Gold 2', 1, SCOPE_IDENTITY(), 1);
insert into Rooms(tavernId) values (SCOPE_IDENTITY());
insert into RoomStay(serviceSaleId, guestId, roomId, dateStayedIn, dateCheckedOut, rate) values (1, 1, SCOPE_IDENTITY(), '9-01-2022', '9-01-2022',
	(select top 1 rate from dbo.RoomsPrice(0, 10) order by rate asc) - 0.01);