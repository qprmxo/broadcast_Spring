create table member(
	m_num number(5) not null primary key,
	id varchar2(10) unique,
	pwd varchar2(10),
	name varchar2(20)
)

create table message(
	msg_num number(5) not null primary key,
	id varchar2(10) not null references member(id),
	sid varchar2(10) not null references member(id),
	content varchar2(10),
	deletecheck number(5),
	regdate date
)