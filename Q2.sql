//The supplier relation holds the information about suppliers.THe attributes SID,SName,SADDR describes the supplier.
create table supplier(
  sid number(5) primary key,
  sname varchar(20),
  saddr varchar(20));
  
//The part relation holds the attributes such as PID,PNAME and PCOLOR.
create table part(
  pid number(5) primary key,
  pname varchar(20),
  pcolor varchar(20));

//The shipment relation holds information about shipments that include SID and PID attributes identifying the supplier of the shipment and the parts shipped.
//THe shipment relation also holds information on the number of parts shipped.

create table shipment(
  sid number(5) references supplier(sid) on delete cascade on update cascade,
  pid number(5) references part(pid) on delete cascade on update cascade,
  primary key(sid,pid));
  
//Obtain the details of parts supplied by supplier #SNAME
select part.pid,part.pname,part.pcolor
from part,shipment,supplier
where supplier.sid=shipment.sid
and part.pid=shipment.pid
and supplier.sname='S1';

//Obtain the names of suppliers who supply #PNAME
select supplier.sname
from part,shipment,supplier
where supplier.sid=shipment.sid
and part.pid=shipment.pid
and part.pname='P1';

//Delete the parts which are in #PCOLOR
delete 
from part
where pcolor='Black';
//#List the suppliers who supplies exactly two parts
select supplier.sname
from supplier,shipment
where shipment.sid=supplier.sid
group by(supplier.sname)
having count(shipment.pid)=2;
  
  
  
  
