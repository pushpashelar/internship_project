create table batch(bno int,byear int,PRIMARY KEY(bno));

create table student(prno int,rno int,bno int,fname varchar(20),lname varchar(20),mname varchar(20),mbno varchar(50),Email varchar(50),PRIMARY KEY(prno,rno),UNIQUE (prno),FOREIGN KEY (bno) REFERENCES batch(bno));

create table subject(subcode int,subname varchar(20),PRIMARY KEY(subcode));

create table semister(semid int,seminfo varchar(20),PRIMARY KEY(semid));

create table sem_sub(semid int,subcode int,PRIMARY KEY(semId,subcode),FOREIGN KEY (semId) REFERENCES semister(semid),FOREIGN KEY (subcode) REFERENCES subject(subcode));


create table sem_year_stud_regi(semid int,cur_year int,prno int,subcode int,CA_mark int,ETE_mark int,PRIMARY KEY(semid,prno,subcode),FOREIGN KEY (semid) REFERENCES semister(semid),FOREIGN KEY (prno) REFERENCES student(prno),FOREIGN KEY (subcode) REFERENCES subject(subcode));

insert into batch(bno,byear)values(17,2017);
insert into batch(bno,byear)values(18,2018);
insert into batch(bno,byear)values(19,2019);




insert into subject(subcode,subname)values(101,'ip');
insert into subject(subcode,subname)values(102,'co');
insert into subject(subcode,subname)values(103,'mf');
insert into subject(subcode,subname)values(104,'cmgt');
insert into subject(subcode,subname)values(105,'dbms');
insert into subject(subcode,subname)values(201,'nm');
insert into subject(subcode,subname)values(202,'da');
insert into subject(subcode,subname)values(203,'llp');
insert into subject(subcode,subname)values(204,'os');
insert into subject(subcode,subname)values(205,'sop');
insert into subject(subcode,subname)values(301,'ds');
insert into subject(subcode,subname)values(302,'tcs');
insert into subject(subcode,subname)values(303,'cn');
insert into subject(subcode,subname)values(304,'sys');
insert into subject(subcode,subname)values(305,'adt');
insert into subject(subcode,subname)values(401,'cg');
insert into subject(subcode,subname)values(402,'sim');
insert into subject(subcode,subname)values(403,'or');
insert into subject(subcode,subname)values(404,'se');
insert into subject(subcode,subname)values(405,'ism');

insert into semister(semid,seminfo) values(1,'sub');
insert into semister(semid,seminfo) values(2,'sub');
insert into semister(semid,seminfo) values(3,'sub');
insert into semister(semid,seminfo) values(4,'sub');
insert into semister(semid,seminfo) values(5,'sub');
insert into semister(semid,seminfo) values(6,'sub');

insert into sem_sub(semid,subcode)values(1,101);
insert into sem_sub(semid,subcode)values(1,102);
insert into sem_sub(semid,subcode)values(1,103);
insert into sem_sub(semid,subcode)values(1,104);
insert into sem_sub(semid,subcode)values(1,105);
insert into sem_sub(semid,subcode)values(2,201);
insert into sem_sub(semid,subcode)values(2,202);
insert into sem_sub(semid,subcode)values(2,203);
insert into sem_sub(semid,subcode)values(2,204);
insert into sem_sub(semid,subcode)values(2,205);
insert into sem_sub(semid,subcode)values(3,301);
insert into sem_sub(semid,subcode)values(3,302);
insert into sem_sub(semid,subcode)values(3,303);
insert into sem_sub(semid,subcode)values(3,304);
insert into sem_sub(semid,subcode)values(3,305);
insert into sem_sub(semid,subcode)values(4,401);
insert into sem_sub(semid,subcode)values(4,402);
insert into sem_sub(semid,subcode)values(4,403);
insert into sem_sub(semid,subcode)values(4,404);
insert into sem_sub(semid,subcode)values(4,405);

insert into student(prno,rno,bno,fname,lname,mname,mbno,email)values(111,17101,17,'komal','agrval','a',90113540,'abc@gmail.com');
insert into student(prno,rno,bno,fname,lname,mname,mbno,email)values(112,17102,17,'sonam','shinde','b',90234567,'abas@gmail.com');
insert into student(prno,rno,bno,fname,lname,mname,mbno,email)values(113,17103,17,'pushpa','shelar','vitthal',98509217,'fdgdf@gmail.com');
insert into student(prno,rno,bno,fname,lname,mname,mbno,email)values(114,17104,17,'nikita','jadhav','c',95606768,'gfjh@gmail.com');
insert into student(prno,rno,bno,fname,lname,mname,mbno,email)values(115,17105,17,'sagar','chopde','d',70898654,'ettrth@gmail.com');
insert into student(prno,rno,bno,fname,lname,mname,mbno,email)values(116,17106,17,'kunal','gholve','f',94567678,'awwth@gmail.com');
insert into student(prno,rno,bno,fname,lname,mname,mbno,email)values(117,17107,17,'bhau','parekar','g',78765447,'jhhjh@gmail.com');
insert into student(prno,rno,bno,fname,lname,mname,mbno,email)values(121,18101,18,'mansi','deshmukh','h',80865667,'jfdhdh@gmail.com');
insert into student(prno,rno,bno,fname,lname,mname,mbno,email)values(122,18102,18,'monali','shinde','i',83455657,'gfdhdh@gmail.com');


insert into sem_year_stud_regi(semid,cur_year,prno,subcode,ca_mark,ete_mark)values(1,2017,111,101,24,20);
insert into sem_year_stud_regi(semid,cur_year,prno,subcode,ca_mark,ete_mark)values(1,2017,111,102,26,30);
insert into sem_year_stud_regi(semid,cur_year,prno,subcode,ca_mark,ete_mark)values(1,2017,111,103,23,20);
insert into sem_year_stud_regi(semid,cur_year,prno,subcode,ca_mark,ete_mark)values(1,2017,111,104,10,23);
insert into sem_year_stud_regi(semid,cur_year,prno,subcode,ca_mark,ete_mark)values(1,2017,111,105,10,10);
insert into sem_year_stud_regi(semid,cur_year,prno,subcode,ca_mark,ete_mark)values(1,2017,111,201,19,29);
insert into sem_year_stud_regi(semid,cur_year,prno,subcode,ca_mark,ete_mark)values(2,2018,111,201,19,29);

insert into sem_year_stud_regi(semid,cur_year,prno,subcode,ca_mark,ete_mark)values(2,2018,111,202,25,29);
insert into sem_year_stud_regi(semid,cur_year,prno,subcode,ca_mark,ete_mark)values(2,2018,111,203,26,24);
insert into sem_year_stud_regi(semid,cur_year,prno,subcode,ca_mark,ete_mark)values(2,2018,111,204,28,24);
insert into sem_year_stud_regi(semid,cur_year,prno,subcode,ca_mark,ete_mark)values(2,2018,111,205,27,30);
insert into sem_year_stud_regi(semid,cur_year,prno,subcode,ca_mark,ete_mark)values(2,2018,111,104,23,20);
insert into sem_year_stud_regi(semid,cur_year,prno,subcode,ca_mark,ete_mark)values(2,2018,111,105,23,32);
insert into sem_year_stud_regi(semid,cur_year,prno,subcode,ca_mark,ete_mark)values(3,2018,111,301,30,22);
insert into sem_year_stud_regi(semid,cur_year,prno,subcode,ca_mark,ete_mark)values(3,2018,111,302,31,20);
insert into sem_year_stud_regi(semid,cur_year,prno,subcode,ca_mark,ete_mark)values(3,2018,111,303,11,10);
insert into sem_year_stud_regi(semid,cur_year,prno,subcode,ca_mark,ete_mark)values(3,2018,111,304,32,20);
insert into sem_year_stud_regi(semid,cur_year,prno,subcode,ca_mark,ete_mark)values(3,2018,111,305,22,20);
insert into sem_year_stud_regi(semid,cur_year,prno,subcode,ca_mark,ete_mark)values(3,2019,111,401,20,20);
insert into sem_year_stud_regi(semid,cur_year,prno,subcode,ca_mark,ete_mark)values(3,2019,111,402,30,20);
insert into sem_year_stud_regi(semid,cur_year,prno,subcode,ca_mark,ete_mark)values(3,2019,111,403,20,23);
insert into sem_year_stud_regi(semid,cur_year,prno,subcode,ca_mark,ete_mark)values(3,2019,111,404,30,26);
insert into sem_year_stud_regi(semid,cur_year,prno,subcode,ca_mark,ete_mark)values(4,2019,111,401,30,26);
insert into sem_year_stud_regi(semid,cur_year,prno,subcode,ca_mark,ete_mark)values(4,2019,111,402,23,20);
insert into sem_year_stud_regi(semid,cur_year,prno,subcode,ca_mark,ete_mark)values(4,2019,111,403,24,20);
insert into sem_year_stud_regi(semid,cur_year,prno,subcode,ca_mark,ete_mark)values(4,2019,111,404,24,25);
insert into sem_year_stud_regi(semid,cur_year,prno,subcode,ca_mark,ete_mark)values(4,2019,111,405,21,35);
insert into sem_year_stud_regi(semid,cur_year,prno,subcode,ca_mark,ete_mark)values(4,2019,111,303,24,26);


create view result as select semester_id,rno,(fname||' '||mname||' '||lname) as student_name,bno as batch_no,cur_year,join_1.prno,subcode,subject_name,ca_mark,ete_mark from student,(select semid as semester_id,cur_year,prno,sem_year_stud_regi.subcode,subname as subject_name,ca_mark,ete_mark from subject,sem_year_stud_regi where subject.subcode=sem_year_stud_regi.subcode) as join_1 where student.prno=join_1.prno;


create view std_result as select rno,student_name,batch_no,prno,array_agg(subject_name),array_agg(subcode)as Subject_code,array_agg(ca_mark)as CA_MARK from result group by rno,student_name,batch_no,prno;
