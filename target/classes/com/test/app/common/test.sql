select * from member;
select * from board;
select * from reply;

create table member(
	mid varchar(20) primary key ,
	password varchar(50) not null,
	name varchar(50) not null,
	phone varchar(50) not null,
	Hope_Area varchar(50) not null,
	sex varchar(50) not null,
	report int default 0
	
);

create table board(
	bpk int primary key ,
	bArea varchar(80) not null,
	bcategory varchar(80) not null,
	bPhoto varchar(80) not null,
	event varchar(50) not null,
	condition varchar(50) not null,
	title varchar(60) not null,
	mid varchar(50) not null,
	content varchar(200) not null,
	period date, 
	bdate date default sysdate,
	views int default 0,
	badrr varchar(50) not null,
	status varchar(30) default '모집중',
	
	foreign key (mid) references member(mid) on delete cascade
	);
		
	
	create table reply(
   rpk int primary key,
    bpk int not null,
    mid varchar(20) not null,
    msg varchar(30) not null,
    rdate timestamp default sysdate,
    foreign key (bpk) references board(bpk) on delete cascade,
    foreign key (mid) references member(mid) on delete cascade
);

 drop table board;
drop table reply;

select * from board where event='축구';

