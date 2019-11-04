/* 2.1 �������ݿ�   */
CREATE DATABASE SCDB;

/* 2.2 ��student��  */
Use SCDB;	/* ѡ�����ݿ�*/

CREATE TABLE student		/* ����*/
	(Sno char(10)  PRIMARY KEY,
	Sname char(10)  NOT NULL,
	Ssex  CHAR(2)  NOT NULL check (Ssex in('��','Ů')),
	Sage  tinyint,
	Policital_status char(10) check(Policital_status in('��Ա', '��Ա', 'Ⱥ��')) not null,
	Sdept VARCHAR(40)
);

/* 2.3 ����course�� */
CREATE TABLE course (
	Cno char(10)  PRIMARY KEY,
	Cname char(10)  NOT NULL,
	Cpno  CHAR(10) ,
	Ccredit int,
	foreign key (Cpno) references course(Cno)
);

/* 2.4 ����SC�� */
CREATE TABLE SC (
	Sno char(10),
	Cno char(10),
	score tinyint,
	primary key(sno,cno),
	foreign key (Sno) references student(Sno),
	foreign key (Cno) references course(Cno)
);

/* 2.5.1 �������� */
INSERT INTO student VALUES('0301001','��ӱ','Ů',21, '��Ա','�����');
select * from student;     /* ��ѯstudent�� */

INSERT INTO student VALUES('0301002','��¶','Ů',22, '��Ա','�����');
INSERT INTO student VALUES('0301003','�ŷ�','��', 21, '��Ա','�����');
INSERT INTO student VALUES('0301004','����','��',20, '��Ա','�����');
INSERT INTO student VALUES('0303005','����','��',20, '��Ա','ũѧϵ');
INSERT INTO student VALUES('0302001','��ӯ','Ů',21, '��Ա','��Ϣϵ');
INSERT INTO student VALUES('0302002','����','Ů',21, '��Ա','��Ϣϵ');
INSERT INTO student VALUES('0302003','��ΰ','��',20, 'Ⱥ��','��Ϣϵ');
INSERT INTO student VALUES('0303004','�·�','��',21, 'Ⱥ��','ũѧϵ');
/* course������ݲ���*/ 
INSERT INTO course VALUES('2','��ѧ',null,2);
INSERT INTO course VALUES('6','���ݴ���',null,2);
INSERT INTO course VALUES('7','PASCAL����','6',4);
INSERT INTO course VALUES('4','����ϵͳ' ,'6',3);
INSERT INTO course VALUES('5','���ݽṹ','7',4);
INSERT INTO course VALUES('1','���ݿ�','5',4);
INSERT INTO course VALUES('3','��Ϣϵͳ','1',4);

select * from course;     /*��ѯcourse�� */

/* ����SC������*/
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

select * from SC;		/* ��ѯSC�� */