/*
	实验的内容  思考题 注意题 代码以及测试代码 执行结果 如下：
*/

/* 如果数据库 存在 删除数据库SCDB */
USE master;
IF EXISTS(SELECT * FROM master.dbo.sysdatabases WHERE name = 'SCDB') 
	drop database SCDB;

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
select * from student;     /* 查询student表 ==============第一个查询*/
/*
	这两种写法的具体要求你能总结一下吗？如果不输入年龄信息（年龄缺失），用这两种写法各怎样构造SQL语句。
	答：当插入的记录 每一列都有值时 可以使用上面使用的方法 也就是省略属性的名字
	    当插入的记录 只有某几列时 可以使用写出列名的方法 列名要与值对应。
		如果没有年龄信息  使用省略列名的方法时 年龄的位置需要空出一个位置
							使用不省略的方法时 年龄的属性名不写即可。
*/


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

select * from course;     /*查询course表 =====================第二次查询*/

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

select * from SC;		/* 查询SC表 ==========================第三次查询*/

/* 3.  修改数据表的结构 */
/* 3.1 修改Course表的Cname的长度为40 且允许为空*/
ALTER TABLE Course ALTER COLUMN Cname char(40) NULL;
/* 3.2 Student增加列TEL，长度为15位 */
ALTER TABLE Student ADD Tel char(15);
/* 3.3 删除表Student的列TEL */
ALTER TABLE Student DROP COLUMN Tel;

/* 4   更新数据*/
/* 4.1 将0301001学号学生的姓名改为张星星 */
UPDATE Student SET Sname='张星星' WHERE Sno='0301001';
/* 4.2 将所有男生的年龄增加一岁 */
UPDATE Student SET Sage=Sage+1  WHERE Ssex='男';

/* 6   删除数据          这里没有执行代码  原因是后面的题目需要用到表的数据*/
/* 6.1 删除0301001学号学生选修的课程信息*/
/*DELETE FROM SC WHERE SNO='0301001';
/* 6.2 删除所有学生的选课记录*/
DELETE FROM SC*/;

/* 7   SELECT的应用*/
/* 7.1 查看所有学生的信息 ====================================第四次查询*/
SELECT * FROM Student;

/* 7.2 查看所有学生的学号、姓名===============================第五次查询*/
SELECT Sno,Sname FROM Student;

/* 7.3 查看所有学生的学号、姓名，并且用中文列名显示结果=======第六次查询*/
SELECT Sno As 学号,Sname AS 姓名 FROM Student;

/* 7.4 列别名改变查询结果的列标题==============================第七次查询*/
SELECT Sname NAME,'Year of Birth: ' BIRTH,
       2017-Sage  BIRTHDAY,LOWER(Sdept)  DEPARTMENT
FROM Student;

/*
	想一想：该查询中'Year of Birth: ' BIRTH和2017-Sage的功能是什么？
	答：
*/

/* 7.5 运行以下两组语句，看结果有何不同=======================第八和第九*/
SELECT Sno FROM SC;
SELECT DISTINCT Sno FROM SC;
/*
	答： 第一句的记录的学号有重复 第二句没有重复
		 因为关键字 distinct 有去重的作用 
*/

/*
	思考题：
*/
/* 1.  用SQL语句创建教师表Teacher（TNO char(6),TName char(10),Tage int,Tsex char(2)）
		TNO为主键，Tage年龄范围为20至65；*/
USE SCDB;
create table teacher(
	Tno char(6) PRIMARY KEY,
	Tname char(10),
	Tage int check (Tage>20 and Tage<65),
	Tsex char(2)
	);
/* 测试代码：
	INSERT INTO teacher VALUES('ASD','ZHANGSAN',70,'男');
	报错：INSERT 语句与 CHECK 约束"CK__teacher__Tage__1CF15040"冲突。
	该冲突发生于数据库"SCDB"，表"dbo.teacher", column 'Tage'。
	在表的约束中可以查看改约束的约束条件表达式。
	建表成功。
*/

/* 2.  在Teacher表增加一元组：TNO-000101,TName-张笑天,Tage--30,Tsex—男；*/
INSERT INTO teacher Values('000101','张笑天',30,'男');
/*	测试代码：
		select * from teacher;
	执行结果：
		(1 行受影响)
		可看到插入的记录
*/

/* 3.  将Teacher表中张笑天的年龄改为31*/
UPDATE teacher SET Tage=31 where Tname='张笑天';
/*	测试代码：
		select * from teacher;
	执行结果：
		(1 行受影响)
		可看到Tage变成31
*/

/* 4.  删除TNO为000101号职工信息*/
delete teacher where Tno=000101;
/*	测试代码：
		select * from teacher;
	执行结果：
		可看到记录被删除 表无数据
*/

/* 5.  求每门课程的学习人数，输出编号，学习人数================第十次查询*/
SELECT 
	Cno as 编号, count(Sno) as 学习人数
from
	SC 
group by
	Cno;
		/*
		测试结果：
		1--9
		2--3
		3--5
		5--1
		6--1
		7--3
	*/

/* 6.  查询每位学生的学号、姓名以及平均成绩，按成绩降序排列输出；======第十一*/
SELECT 
	t.学号, s.Sname as 姓名,t.平均成绩
FROM
	(select 
		a.Sno as 学号, avg(ISNULL(score,0)) as 平均成绩
	from
		SC a
	GROUP BY
		a.Sno)t,student s
where
	t.学号 = s.Sno
ORDER BY
	t.平均成绩
	DESC;

	/*
		测试结果：
		成绩排名顺序：
			88 88 83 73 65 61 58 55 0
	*/

/* 7.  查询年龄不在20~23岁（不包括20岁和23岁）之间的学生的姓名、系别和年龄；（使用not Between）*/
select
	Sname,Sdept,Sage
from
	student
where
	Sage not Between 20 and 23;

/*
	测试代码：因为原来表格的数据里面的学生年龄没有符合查询的条件  所以改出一个符合查询条件的学生 用于测试
		select * from student;
		update student set Sage=25 where Sname='张飞';
	执行结果：
		查询出张飞
	还原表数据：
		update student set Sage=22 where Sname='张飞';
				
*/