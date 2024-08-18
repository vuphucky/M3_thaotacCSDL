CREATE DATABASE quanlyhocsinh;
USE quanlyhocsinh;

CREATE TABLE class (
    ClassID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ClassName VARCHAR(60) NOT NULL,
    StartDate datetime NOT NULL,
    Status BIT
);

CREATE TABLE student (
    StudentID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    StudentName VARCHAR(30) NOT NULL,
    Address VARCHAR(50),
    Phone VARCHAR(20),
    Status BIT,
    ClassID INT NOT NULL,
    FOREIGN KEY (ClassID)
        REFERENCES class (ClassID)
);

CREATE TABLE subject (
    SubID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    SubName VARCHAR(30) NOT NULL,
    Credit TINYINT NOT NULL DEFAULT 1 CHECK (Credit >= 1),
    Status BIT DEFAULT 1
);

CREATE TABLE mark (
    MarkID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    SubID INT NOT NULL,
    StudentID INT NOT NULL,
    Mark FLOAT DEFAULT 0 CHECK (Mark BETWEEN 0 AND 100),
    ExamTime TINYINT DEFAULT 1,
    UNIQUE (SubID , StudentID),
    FOREIGN KEY (SubID)
        REFERENCES subject (SubID),
    FOREIGN KEY (StudentID)
        REFERENCES student (StudentID)
);

insert into class
values(1,"A1","2008-12-20",1);
insert into class
values(2,"A2","2008-12-22",1);
insert into class
values (3,"B3",current_date,0);

insert into student (StudentName, Address, Phone, Status, ClassID)
values("Hung", "Ha Noi", "0912113113",1,1);
insert into student (StudentName, Address,Status, ClassID)
values ("hoa", "HCM", 1,1);
insert into student(StudentName, Address, Phone, Status, ClassID)
values ("manh", "HCM","0123123123",0,2);

insert into subject
values(1,"CF",5,1),
(2,"C",6,1),
(3,"HDJ",5,1),
(4,"RDBMS",10,1);

insert into mark(SubId, StudentId, Mark, Examtime)
values(1,1,8,1),
(1,2,10,2),
(2,1,12,1);

select *
from student;

select*
from student
where Status = true;

select *
from subject
where Credit < 10;

select S.StudentID, S.StudentName, C.ClassName 
from student S join class C on S.ClassID = C.ClassID
where C.ClassName = "A1";

select S.StudentID, S.StudentName, SUB.SubName, M.Mark
from student s join Mark M on S.StudentID = M.StudentID join subject SUB on SUB.SubID
where SUB.SubName = "CF";

select *
from student 
where StudentName like "h%";

select * 
from class
where month(class.StartDate) = 12;

select*
from subject;

select *
from subject
where Credit between 3 and 5;


update student
set ClassID = 2
where StudentID = 1;

SELECT 
    student.StudentName, subject.SubName, mark.Mark
FROM
    student
        JOIN
    mark ON student.StudentID = mark.StudentID
        JOIN
    subject ON mark.SubID = subject.SubID
ORDER BY mark.Mark DESC;

select student.StudentName, mark.Mark
from student
join mark on student.StudentID = mark.StudentID;
