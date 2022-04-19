--alter session set "_oracle_script"=true;
--create user togather identified by team1;
--grant connect, resource, unlimited tablespace to togather;
--conn togather/team1;

DROP TABLE MESSAGE;
DROP sequence MESSAGE_SEQ;
DROP TABLE QAREPLY; 
DROP sequence QAREPLY_SEQ;
DROP TABLE QA;
DROP sequence QA_SEQ;
drop table GBREPLY;
drop trigger TRI1;
drop table GROUPTAB_BOARD;
drop table GATHERING_JOIN; 
drop table WISHTAB;
drop sequence WISH_SEQ;
drop table R_LIKE_TAB;
drop table BLOCK;
drop sequence MEMBER_SEQ;
drop sequence BLOCK_SEQ;
drop table MEM_IN_GROUP;
drop table GATHERING;
drop table REPLY;
drop sequence B_NUM_SEQ;
drop sequence RSEQ_SEQ;
drop sequence MNUM_SEQ;
drop table GROUPTAB;
drop sequence GROUPTAB_SEQ;
drop table BOARD;

drop sequence GATHERING_SEQ;
drop table CATEGORY;
drop sequence CATENUM_SEQ;
drop sequence GA_JOIN_SEQ;
drop table FAQ;
drop sequence FAQ_SEQ;
drop table VERSION;
drop table NOTIFICATION;
drop sequence NSEQ_SEQ;

drop sequence GB_NUM_SEQ;
drop sequence GBRSEQ_SEQ;
drop table MEMBER;
purge recyclebin;

create table MEMBER(
   MNUM NUMBER constraint MEMBER_PK primary key, 
   MADDR NVARCHAR2(40) NOT NULL, 
   PFR_LOC NVARCHAR2(40) NOT NULL,
   MNAME NVARCHAR2(20) NOT NULL,
   GENDER NVARCHAR2(10) NOT NULL,
   BIRTH NVARCHAR2(20) NOT NULL,
   PWD NVARCHAR2(100) NOT NULL,
   EMAIL NVARCHAR2(40) UNIQUE,
   PHONE NVARCHAR2(20) NOT NULL UNIQUE,
   CATEGORY_FIRST NVARCHAR2(20),
   CATEGORY_SECOND NVARCHAR2(20),
   CATEGORY_THIRD NVARCHAR2(20),
   ATHUR NUMBER default 2 check(ATHUR in(0, 1, 2)) 
); 
create sequence MEMBER_SEQ increment by 1 start with 1 nocache;

insert into MEMBER values(MEMBER_SEQ.nextval, '서울시 금천구', '가산동', '조현기', '남자', '970411', 'gusrl', 'email1@email.com','01050575914', '사교','','',default);
insert into MEMBER values(MEMBER_SEQ.nextval, '서울시 관악구', '신림동', '김미영', '여자', '950216', 'aldud','email2@email.com', '01076218854','스포츠','','',default);
insert into MEMBER values(MEMBER_SEQ.nextval, '경기도 광명시', '철산동', '박성우', '남자', '931018', 'tjddn','email3@email.com', '01094388412','스포츠','','',default);
insert into MEMBER values(MEMBER_SEQ.nextval, '서울시 금천구', '독산동', '김준', '남자', '900314', 'wns', 'email4@email.com','01042285691','IT','','',default);
insert into MEMBER values(MEMBER_SEQ.nextval, '서울시 금천구', '가산동', '이지민', '여자', '990527', 'wlals', 'email5@email.com', '01030589422', 'IT','','',default);

create table BLOCK(
   BSEQ number constraint BSEQ_PK primary key,
   BLOCKING number,
   BLOCKED number
);
create sequence BLOCK_SEQ increment by 1 start with 1 nocache;

insert into BLOCK values(BLOCK_SEQ.nextval, 1, 2);
insert into BLOCK values(BLOCK_SEQ.nextval, 1, 3);
insert into BLOCK values(BLOCK_SEQ.nextval, 2, 4);

create table GROUPTAB(
	GSEQ number constraint GROUPTAB_PK primary key,
	GLOC nvarchar2(30),
	GNAME nvarchar2(40),
	GINTRO nvarchar2(2000),
	INTEREST nvarchar2(40),
	LIMIT number,
	RDATE date,
	MNUM number REFERENCES MEMBER (MNUM) on delete cascade,
	FNAME nvarchar2(50)
);
create sequence GROUPTAB_SEQ increment by 1 start with 1 nocache;

insert into GROUPTAB values(GROUPTAB_SEQ.nextval, '서울시 금천구', '코딩해요~', '같이 코딩하면서 즐겨요!', 'IT', 50, SYSDATE, 1, 'KakaoTalk_20220210_205323055.png');
insert into GROUPTAB values(GROUPTAB_SEQ.nextval, '서울시 관악구', '행축 (행복축구 하실 분)', '축구하면서 친목쌓고 노실 분들 오세요~', '스포츠', 30, SYSDATE, 2, 'appicon-1@1x.png');
insert into GROUPTAB values(GROUPTAB_SEQ.nextval, '경기도 광명시', '맛집탐방', '동네 숨은 맛집 같이 찾으실 분들 ㄱㄱ', '사교', 50, SYSDATE, 3, '1.png');
insert into GROUPTAB values(GROUPTAB_SEQ.nextval, '경기도 광명시', '맛집탐방', '동네 숨은 맛집 같이 찾으실 분들 ㄱㄱ', '롤', 50, SYSDATE, 3, '1.png');
insert into GROUPTAB values(GROUPTAB_SEQ.nextval, '경기도 광명시', '맛집탐방', '동네 숨은 맛집 같이 찾으실 분들 ㄱㄱ', '반려동물', 50, SYSDATE, 3, '1.png');


create table MEM_IN_GROUP(
    GSEQ number REFERENCES GROUPTAB(GSEQ) on delete cascade,
    MNUM number,
    GRADE number default 0 check(GRADE in(0, 1, 2))
);

insert into MEM_IN_GROUP values(1, 1, 2);
insert into MEM_IN_GROUP values(1, 2, 0);
insert into MEM_IN_GROUP values(1, 3, 1);

create or replace trigger TRI1
	after
		insert on GROUPTAB 
		for each row
	begin 
		insert into MEM_IN_GROUP(gseq,mnum) values(:NEW.GSEQ,:NEW.MNUM);
	end;
/

create table BOARD(
   BNUM number constraint BNUM_PK primary key, 
   BCATEGORY nvarchar2(20) NOT NULL, 
   BTITLE nvarchar2(20) NOT NULL,
   MNUM number REFERENCES MEMBER (MNUM),
   MNAME nvarchar2(20) NOT NULL,
   BCONTENT nvarchar2(500) NOT NULL,
   BFILE nvarchar2(20),
   BLIKE number,
   BVIEW number NOT NULL,
   RDATE date
); 
create sequence B_NUM_SEQ increment by 1 start with 1 nocache;

insert into BOARD values(B_NUM_SEQ.nextval, 'IT1', 'it하실분!', '1', '조현기', '구해요', 'it파일', 3, 10, SYSDATE);
insert into BOARD values(B_NUM_SEQ.nextval, '게임', '롤하실분!!', '2', '김미영', '구해요2', 'it파일2', 3, 10, SYSDATE);
insert into BOARD values(B_NUM_SEQ.nextval, 'IT2', 'it하실분!!!', '3', '박성우', '구해요2', 'it파일2', 3, 10, SYSDATE);
insert into BOARD values(B_NUM_SEQ.nextval, 'IT3', 'it하실분!!!!', '4', '김준', '구해요4', 'it파일42', 3, 12, SYSDATE);




create table REPLY(
   RSEQ number constraint REPLY_PK primary key,
   BNUM number NOT NULL REFERENCES BOARD (BNUM) on delete cascade,
   MNAME nvarchar2(40) NOT NULL,
   MNUM number NOT NULL,
   CONTENT nvarchar2(100), 
   R_LIKE number NOT NULL,
   RDATE date
); 
create sequence RSEQ_SEQ increment by 1 start with 1 nocache;
create sequence MNUM_SEQ increment by 1 start with 1 nocache;

insert into REPLY values(RSEQ_SEQ.nextval, 1, '조현기3', 1, '저도 하고 싶33어요', 2, SYSDATE);
insert into REPLY values(RSEQ_SEQ.nextval, 2, '김미영3', 2, '자리 있나3요??', 3, SYSDATE);
insert into REPLY values(RSEQ_SEQ.nextval, 3, '박성우3', 3, '재밌어 보3여요', 1, SYSDATE);
insert into REPLY values(RSEQ_SEQ.nextval, 4, '김준3', 4, '몇명 있3나요??', 0, SYSDATE);
insert into REPLY values(RSEQ_SEQ.nextval, 2, '조현기3', 1, '저도 하고 싶33어요', 2, SYSDATE);
insert into REPLY values(RSEQ_SEQ.nextval, 3, '김미영3', 2, '자리 있나3요??', 3, SYSDATE);
insert into REPLY values(RSEQ_SEQ.nextval, 4, '박성우3', 3, '재밌어 보3여요', 1, SYSDATE);
insert into REPLY values(RSEQ_SEQ.nextval, 1, '김준3', 4, '몇명 있3나요??', 0, SYSDATE);

create table GATHERING(
   GA_SEQ number constraint GATHERING_PK primary key,
   GA_NAME nvarchar2(40),
   GA_DATE nvarchar2(20),
   TIME nvarchar2(40),
   GA_PLACE nvarchar2(40),
   PRICE nvarchar2(20),
   GA_LIMIT number,
   GSEQ number REFERENCES GROUPTAB (GSEQ) on delete cascade,
   MNUM number REFERENCES MEMBER (MNUM) on delete cascade
     );

create sequence GATHERING_SEQ increment by 1 start with 1 nocache;

create table R_LIKE_TAB(
	PHONE nvarchar2(40),
	RSEQ number,
	FLAG number default 1 check(FLAG in(0, 1))
);

create table WISHTAB(
	WSEQ number constraint WISHTAB_PK primary key,
	MNUM number,
	GSEQ number,
	FLAG number default 1 check(flag in(0,1))
);
create sequence WISH_SEQ increment by 1 start with 1 nocache;


create table CATEGORY(
	CATENUM number constraint CATEGORY_PK primary key,
	INT_OUT nvarchar2(20),
	INT_IN nvarchar2(20),
	FIRST_OPTION nvarchar2(20),
	SECOND_OPTION nvarchar2(20)
);
create sequence CATENUM_SEQ increment by 1 start with 1 nocache;


create table GATHERING_JOIN(
	GA_JOIN_NUM number constraint GA_JOIN_PK primary key,
	MNUM number REFERENCES MEMBER (MNUM) on delete cascade
);
create sequence GA_JOIN_SEQ increment by 1 start with 1 nocache;

create table FAQ(
	FSEQ number constraint FAQ_PK primary key,
	FTITLE nvarchar2(20),
	FCONTENT nvarchar2(500)
);
create sequence FAQ_SEQ increment by 1 start with 1 nocache;

create table VERSION(
	VERSION number constraint VERSION_PK primary key,
	RDATE DATE
);

create table NOTIFICATION(
	NSEQ number constraint NOTIFICATION_PK primary key,
	 MNUM number REFERENCES MEMBER (MNUM),
	MNAME nvarchar2(20),
	NTITLE nvarchar2(100),
	NCONTENT nvarchar2(2000),
	NVIEW number,
	RDATE DATE
);
create sequence NSEQ_SEQ increment by 1 start with 1 nocache;

create table GROUPTAB_BOARD(
   GBNUM number constraint GBNUM_PK primary key, 
   GBTITLE nvarchar2(20) NOT NULL,
   MNUM number REFERENCES MEMBER (MNUM),
   MNAME nvarchar2(20) NOT NULL,
   GBCONTENT nvarchar2(500) NOT NULL,
   GBFILE nvarchar2(20),
   GBLIKE number,
   GBVIEW number NOT NULL,
   RDATE date,
   GSEQ number REFERENCES GROUPTAB (GSEQ) on delete cascade
); 
create sequence GB_NUM_SEQ increment by 1 start with 1 nocache;

insert into GROUPTAB_BOARD values(GB_NUM_SEQ.nextval, 'it하실분!', '1', '조현기', '구해요', 'it파일', 3, 10, SYSDATE,2);
insert into GROUPTAB_BOARD values(GB_NUM_SEQ.nextval, '롤하실분!!', '2', '김미영', '구해요2', 'it파일2', 3, 10, SYSDATE,3);
insert into GROUPTAB_BOARD values(GB_NUM_SEQ.nextval, 'it하실분!!!', '3', '박성우', '구해요2', 'it파일2', 3, 10, SYSDATE,1);
insert into GROUPTAB_BOARD values(GB_NUM_SEQ.nextval, 'it하실분!!!!', '4', '김준', '구해요4', 'it파일42', 3, 12, SYSDATE,1);

create table GBREPLY(
   GBRSEQ number constraint GBREPLY_PK primary key,
   GBNUM number NOT NULL REFERENCES GROUPTAB_BOARD (GBNUM) on delete cascade,
   MNAME nvarchar2(40) NOT NULL,
   MNUM number NOT NULL,
   GBRCONTENT nvarchar2(100), 
   GBR_LIKE number NOT NULL,
   RDATE date
); 
create sequence GBRSEQ_SEQ increment by 1 start with 1 nocache;

insert into GBREPLY values(GBRSEQ_SEQ.nextval, 1, '조현기', 1, '저도 하고 싶어요', 2, SYSDATE);
insert into GBREPLY values(GBRSEQ_SEQ.nextval, 2, '김미영', 2, '자리 있나요??', 3, SYSDATE);
insert into GBREPLY values(GBRSEQ_SEQ.nextval, 3, '박성우', 3, '재밌어 보여요', 1, SYSDATE);
insert into GBREPLY values(GBRSEQ_SEQ.nextval, 4, '김준', 4, '몇명 있나요??', 0, SYSDATE);
insert into GBREPLY values(GBRSEQ_SEQ.nextval, 2, '조현기', 1, '저도 하고 싶어요', 2, SYSDATE);
insert into GBREPLY values(GBRSEQ_SEQ.nextval, 3, '김미영', 2, '자리 있나요??', 3, SYSDATE);
insert into GBREPLY values(GBRSEQ_SEQ.nextval, 4, '박성우', 3, '재밌어 보여요', 1, SYSDATE);
insert into GBREPLY values(GBRSEQ_SEQ.nextval, 1, '김준', 4, '몇명 있나요??', 0, SYSDATE);


create table QA(
	QSEQ NUMBER constraint QA_PK primary key,
	QTITLE NVARCHAR2(30) NOT NULL,
	QCONTENT NVARCHAR2(500) NOT NULL,
	MNAME NVARCHAR2(30) NOT NULL,
	MNUM NUMBER,
	QCOUNT NUMBER,
	QPWD NVARCHAR2(30),
	QDATE DATE	
);

create sequence QA_SEQ increment by 1 start with 1 nocache;

create table QAREPLY(
	QARSEQ NUMBER constraint QREPLY_PK primary key,
	QSEQ number NOT NULL REFERENCES QA(QSEQ) on delete cascade,
	MNAME NVARCHAR2(30) NOT NULL,
	MNUM NUMBER,
	QARCONTENT NVARCHAR2(500) NOT NULL,
	QARDATE DATE	
);
create sequence QAREPLY_SEQ increment by 1 start with 1 nocache;



INSERT INTO QA VALUES(QA_SEQ.NEXTVAL,'테스트1','테스트1내용','조현기',1,0,'',SYSDATE);
INSERT INTO QA VALUES(QA_SEQ.NEXTVAL,'테스트2','테스트2내용','김미영',2,0,'',SYSDATE);
INSERT INTO QA VALUES(QA_SEQ.NEXTVAL,'테스트3','테스트3내용','박성우',3,0,'',SYSDATE);
INSERT INTO QA VALUES(QA_SEQ.NEXTVAL,'테스트4','테스트4내용','김준',4,0,'',SYSDATE);
INSERT INTO QA VALUES(QA_SEQ.NEXTVAL,'테스트5','테스트5내용','이지민',5,0,'',SYSDATE);


create table MESSAGE(
	MESEQ NUMBER constraint MESSAGE_PK primary key,
	TO_MNAME NVARCHAR2(20),
	TO_MNUM NUMBER,
	FROM_MNUM NUMBER,
	FROM_MNAME NVARCHAR2(20),
	METITLE NVARCHAR2(20),
	MECONTENT NVARCHAR2(500) NOT NULL,
	VIEWCHECK NUMBER default 0 check(VIEWCHECK in(0, 1)),
	MEDATE DATE	
);

create sequence MESSAGE_SEQ increment by 1 start with 1 nocache;

insert into message values(MESSAGE_SEQ.nextval,'김지수2',7,6,'김지수','28','28',0,SYSDATE);
insert into message values(MESSAGE_SEQ.nextval,'김지수2',7,6,'김지수','29','29',0,SYSDATE);
insert into message values(MESSAGE_SEQ.nextval,'김지수2',7,6,'김지수','30','30',0,SYSDATE);
insert into message values(MESSAGE_SEQ.nextval,'김지수2',7,6,'김지수','메세지','메세지내용',0,SYSDATE);
insert into message values(MESSAGE_SEQ.nextval,'김지수',6,7,'김지수2','메세지답변','메세지답변내용',0,SYSDATE);

commit;

--select sequence_name from user_sequences;
--select * from MEMBER order by MNUM desc;
--select * from BLOCK order by BSEQ desc;
--select * from GROUPTAB order by GSEQ desc;
--select * from MEM_IN_GROUP order by GSEQ desc;
--select * from REPLY;
--select * from BOARD;

