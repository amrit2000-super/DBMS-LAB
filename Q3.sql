-- Consider the relation BOAT,SAILOR,RESERVES.The relation BOAT identifies the features of a boat such as unique identifier,color and a name.The list of sailors with 
-- attributes such as SaiorID,name,age etc.,are stored in the relation SAILOR.The sailors are allowed to reserve any no of boats on any day of the week and the records are 
-- to be updated in the RESERVES table.

-- Create the tables,insert suitable tuples

create table boat(
  bid number(5) primary key,
  bcolor varchar(20),
  bname varchar(20));

create table sailor(
  sid number(5) primary key,
  sname varchar(20),
  sage varchar(20));
  
  -- Obtain details of boats reserved by '#SailorName'
  select boat.bid,boat.bcolor,boat.bname
from boat,reserves,sailor
where sailor.sid=reserves.sid
and reserves.bid=boat.bid
and sname='S1';

--
