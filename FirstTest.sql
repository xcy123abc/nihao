/*
	ʵ�������  ˼���� ע���� �����Լ����Դ��� ִ�н�� ���£�
*/

/* ������ݿ� ���� ɾ�����ݿ�SCDB */
USE master;
IF EXISTS(SELECT * FROM master.dbo.sysdatabases WHERE name = 'SCDB') 
	drop database SCDB;

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
select * from student;     /* ��ѯstudent�� ==============��һ����ѯ*/
/*
	������д���ľ���Ҫ�������ܽ�һ�������������������Ϣ������ȱʧ������������д������������SQL��䡣
	�𣺵�����ļ�¼ ÿһ�ж���ֵʱ ����ʹ������ʹ�õķ��� Ҳ����ʡ�����Ե�����
	    ������ļ�¼ ֻ��ĳ����ʱ ����ʹ��д�������ķ��� ����Ҫ��ֵ��Ӧ��
		���û��������Ϣ  ʹ��ʡ�������ķ���ʱ �����λ����Ҫ�ճ�һ��λ��
							ʹ�ò�ʡ�Եķ���ʱ �������������д���ɡ�
*/


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

select * from course;     /*��ѯcourse�� =====================�ڶ��β�ѯ*/

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

select * from SC;		/* ��ѯSC�� ==========================�����β�ѯ*/

/* 3.  �޸����ݱ�Ľṹ */
/* 3.1 �޸�Course���Cname�ĳ���Ϊ40 ������Ϊ��*/
ALTER TABLE Course ALTER COLUMN Cname char(40) NULL;
/* 3.2 Student������TEL������Ϊ15λ */
ALTER TABLE Student ADD Tel char(15);
/* 3.3 ɾ����Student����TEL */
ALTER TABLE Student DROP COLUMN Tel;

/* 4   ��������*/
/* 4.1 ��0301001ѧ��ѧ����������Ϊ������ */
UPDATE Student SET Sname='������' WHERE Sno='0301001';
/* 4.2 ��������������������һ�� */
UPDATE Student SET Sage=Sage+1  WHERE Ssex='��';

/* 6   ɾ������          ����û��ִ�д���  ԭ���Ǻ������Ŀ��Ҫ�õ��������*/
/* 6.1 ɾ��0301001ѧ��ѧ��ѡ�޵Ŀγ���Ϣ*/
/*DELETE FROM SC WHERE SNO='0301001';
/* 6.2 ɾ������ѧ����ѡ�μ�¼*/
DELETE FROM SC*/;

/* 7   SELECT��Ӧ��*/
/* 7.1 �鿴����ѧ������Ϣ ====================================���Ĵβ�ѯ*/
SELECT * FROM Student;

/* 7.2 �鿴����ѧ����ѧ�š�����===============================����β�ѯ*/
SELECT Sno,Sname FROM Student;

/* 7.3 �鿴����ѧ����ѧ�š�����������������������ʾ���=======�����β�ѯ*/
SELECT Sno As ѧ��,Sname AS ���� FROM Student;

/* 7.4 �б����ı��ѯ������б���==============================���ߴβ�ѯ*/
SELECT Sname NAME,'Year of Birth: ' BIRTH,
       2017-Sage  BIRTHDAY,LOWER(Sdept)  DEPARTMENT
FROM Student;

/*
	��һ�룺�ò�ѯ��'Year of Birth: ' BIRTH��2017-Sage�Ĺ�����ʲô��
	��
*/

/* 7.5 ��������������䣬������кβ�ͬ=======================�ڰ˺͵ھ�*/
SELECT Sno FROM SC;
SELECT DISTINCT Sno FROM SC;
/*
	�� ��һ��ļ�¼��ѧ�����ظ� �ڶ���û���ظ�
		 ��Ϊ�ؼ��� distinct ��ȥ�ص����� 
*/

/*
	˼���⣺
*/
/* 1.  ��SQL��䴴����ʦ��Teacher��TNO char(6),TName char(10),Tage int,Tsex char(2)��
		TNOΪ������Tage���䷶ΧΪ20��65��*/
USE SCDB;
create table teacher(
	Tno char(6) PRIMARY KEY,
	Tname char(10),
	Tage int check (Tage>20 and Tage<65),
	Tsex char(2)
	);
/* ���Դ��룺
	INSERT INTO teacher VALUES('ASD','ZHANGSAN',70,'��');
	����INSERT ����� CHECK Լ��"CK__teacher__Tage__1CF15040"��ͻ��
	�ó�ͻ���������ݿ�"SCDB"����"dbo.teacher", column 'Tage'��
	�ڱ��Լ���п��Բ鿴��Լ����Լ���������ʽ��
	����ɹ���
*/

/* 2.  ��Teacher������һԪ�飺TNO-000101,TName-��Ц��,Tage--30,Tsex���У�*/
INSERT INTO teacher Values('000101','��Ц��',30,'��');
/*	���Դ��룺
		select * from teacher;
	ִ�н����
		(1 ����Ӱ��)
		�ɿ�������ļ�¼
*/

/* 3.  ��Teacher������Ц��������Ϊ31*/
UPDATE teacher SET Tage=31 where Tname='��Ц��';
/*	���Դ��룺
		select * from teacher;
	ִ�н����
		(1 ����Ӱ��)
		�ɿ���Tage���31
*/

/* 4.  ɾ��TNOΪ000101��ְ����Ϣ*/
delete teacher where Tno=000101;
/*	���Դ��룺
		select * from teacher;
	ִ�н����
		�ɿ�����¼��ɾ�� ��������
*/

/* 5.  ��ÿ�ſγ̵�ѧϰ�����������ţ�ѧϰ����================��ʮ�β�ѯ*/
SELECT 
	Cno as ���, count(Sno) as ѧϰ����
from
	SC 
group by
	Cno;
		/*
		���Խ����
		1--9
		2--3
		3--5
		5--1
		6--1
		7--3
	*/

/* 6.  ��ѯÿλѧ����ѧ�š������Լ�ƽ���ɼ������ɼ��������������======��ʮһ*/
SELECT 
	t.ѧ��, s.Sname as ����,t.ƽ���ɼ�
FROM
	(select 
		a.Sno as ѧ��, avg(ISNULL(score,0)) as ƽ���ɼ�
	from
		SC a
	GROUP BY
		a.Sno)t,student s
where
	t.ѧ�� = s.Sno
ORDER BY
	t.ƽ���ɼ�
	DESC;

	/*
		���Խ����
		�ɼ�����˳��
			88 88 83 73 65 61 58 55 0
	*/

/* 7.  ��ѯ���䲻��20~23�꣨������20���23�֮꣩���ѧ����������ϵ������䣻��ʹ��not Between��*/
select
	Sname,Sdept,Sage
from
	student
where
	Sage not Between 20 and 23;

/*
	���Դ��룺��Ϊԭ���������������ѧ������û�з��ϲ�ѯ������  ���Ըĳ�һ�����ϲ�ѯ������ѧ�� ���ڲ���
		select * from student;
		update student set Sage=25 where Sname='�ŷ�';
	ִ�н����
		��ѯ���ŷ�
	��ԭ�����ݣ�
		update student set Sage=22 where Sname='�ŷ�';
				
*/