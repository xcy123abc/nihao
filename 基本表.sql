/* 2.1 创建数据库   */
CREATE DATABASE SCDB;

/* 2.2 建student表  */
Use SCDB;	/* 选中数据库*/

CREATE TABLE student		/* 建表*/
	(Sno char(10)  PRIMARY KEY,
	Sname char(10)  NOT NULL,
	Ssex  CHAR(2)  NOT NULL check (Ssex in('男','女')),
	Sage  tinyint,
	Policital_status char(10) check(Policital_status in('党员', '团员', '群众')) not null,
	Sdept VARCHAR(40)
);

/* 2.3 建立course表 */
CREATE TABLE course (
	Cno char(10)  PRIMARY KEY,
	Cname char(10)  NOT NULL,
	Cpno  CHAR(10) ,
	Ccredit int,
	foreign key (Cpno) references course(Cno)
);

/* 2.4 建立SC表 */
CREATE TABLE SC (
	Sno char(10),
	Cno char(10),
	score tinyint,
	primary key(sno,cno),
	foreign key (Sno) references student(Sno),
	foreign key (Cno) references course(Cno)
);

/* 2.5.1 插入数据 */
INSERT INTO student VALUES('0301001','张颖','女',21, '党员','计算机');
select * from student;     /* 查询student表 */

INSERT INTO student VALUES('0301002','张露','女',22, '团员','计算机');
INSERT INTO student VALUES('0301003','张飞','男', 21, '党员','计算机');
INSERT INTO student VALUES('0301004','李逵','男',20, '团员','计算机');
INSERT INTO student VALUES('0303005','赵云','男',20, '团员','农学系');
INSERT INTO student VALUES('0302001','李盈','女',21, '团员','信息系');
INSERT INTO student VALUES('0302002','董静','女',21, '团员','信息系');
INSERT INTO student VALUES('0302003','陈伟','男',20, '群众','信息系');
INSERT INTO student VALUES('0303004','陈非','男',21, '群众','农学系');
/* course表的数据插入*/ 
INSERT INTO course VALUES('2','数学',null,2);
INSERT INTO course VALUES('6','数据处理',null,2);
INSERT INTO course VALUES('7','PASCAL语言','6',4);
INSERT INTO course VALUES('4','操作系统' ,'6',3);
INSERT INTO course VALUES('5','数据结构','7',4);
INSERT INTO course VALUES('1','数据库','5',4);
INSERT INTO course VALUES('3','信息系统','1',4);

select * from course;     /*查询course表 */

/* 插入SC表数据*/
INSERT INTO sc VALUES('0301001','1',85);
INSERT INTO sc VALUES('0301001','2',80);
INSERT INTO sc VALUES('0301001','3',95);
INSERT INTO sc VALUES('0301001','4',65);
INSERT INTO sc VALUES('0301001','5',55);
INSERT INTO sc VALUES('0301001','6',45);
INSERT INTO sc VALUES('0301001','7',88);
INSERT INTO sc VALUES('0301002','2',87);
INSERT INTO sc VALUES('0301002','1',80);
INSERT INTO sc VALUES('0301002','3',98);
INSERT INTO sc VALUES('0301003','7',88);
INSERT INTO sc VALUES('0301003','1',88);
INSERT INTO sc VALUES('0301004','1',58);
INSERT INTO sc VALUES('0303005','2',63);
INSERT INTO sc VALUES('0303005','1',60);
INSERT INTO sc VALUES('0302001','7',76);
INSERT INTO sc VALUES('0302001','1',90);
INSERT INTO sc VALUES('0302002','1',75);
INSERT INTO sc VALUES('0302002','3',55);
INSERT INTO sc VALUES('0302003','1',87);
INSERT INTO sc VALUES('0302003','4',80);
INSERT INTO sc VALUES('0302003','3',null);
INSERT INTO sc VALUES('0303004','1',null);
INSERT INTO sc VALUES('0303004','3',null);

select * from SC;		/* 查询SC表 */