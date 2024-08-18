create database qlybanhang;
use qlybanhang;
create table customer(
cID int primary key,
cName varchar(50),
cAge int
);

create table Orders(
oID int primary key,
cID int,
oDate date,
oTotalPrice double,
foreign key (cID) references customer(cID)
);

create table product(
pID int primary key,
pName varchar(50),
pPrice double
);

create table orderDetail(
oID int,
pID int,
odQTV int,
primary key(oID,pID),
foreign key (oID) references Orders(oID),
foreign key (pID) references product(pID)
); 

insert into customer
values (1,"Minh Quan", 10),
        (2,"Ngoc Oanh", 20),
        (3,"Hong Ha",50);
        
insert into Orders
values (1,"2006-03-21",null,1),
        (2,"2006-03-23",null,2),
        (3,"2006-03-16",null,1);
        
insert into product
values (1,"May Giat",3),
        (2,"Tu lanh",5),
        (3,"Dieu Hoa",7),
        (4,"Quat",1),
        (5,"Bep Dien",2);
        
insert into orderDetail
values(1,1,3),
      (1,3,7),
      (1,4,2),
      (2,1,1),
      (3,1,8),
      (2,5,4),
      (2,3,3);
      
select Orders.oID, Orders.oDate, Orders.oTotalPrice
from Orders;

select * 
from customer
join Orders on customer.cID = Orders.cID;

select * 
from product
join orderDetail on product.pID = orderDetail.pID
join Orders on orderDetail.oID = Orders.oID;

select *
from customer
left join Orders on customer.cID = Orders.cID;

select
o.oID, o.oDate, sum(od.odQTV * p.pPrice) as totalPrice
from Orders o
join orderDetail od on o.oID = od.oID
join product p on od.pID = p.pID
group by
o.oID,
o.oDate;




        