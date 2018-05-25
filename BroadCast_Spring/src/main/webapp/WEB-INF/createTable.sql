create table member(
	m_num number(5) not null primary key,
	id varchar2(10) unique,
	pwd varchar2(10),
	name varchar2(20)
)

create table message(
	msg_num number(5) not null primary key,
	rid varchar2(10) not null references member(id),
	sid varchar2(10) not null references member(id),
	content clob;
	r_delete number(5),
	s_delete number(5),
	readCheck number(3),
	regdate date
)

create table profile(
	profile_num number not null primary key,
	id varchar2(10) not null references member(id),
	title varchar2(20),
	org_filename varchar2(20),
	save_filename varchar2(20)
)
