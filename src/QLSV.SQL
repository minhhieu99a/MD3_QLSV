CREATE DATABASE QuanLySinhVien;
use QuanLySinhVien;
CREATE TABLE Class
(
    ClassID   INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    ClassName VARCHAR(60)        NOT NULL,
    StartDate DateTime           NOT NULL,
    Status    BIT
);
CREATE TABLE Student
(
    StudentID   INT         NOT NULL PRIMARY KEY AUTO_INCREMENT,
    StudentName VARCHAR(30) NOT NULL,
    Address     VARCHAR(50),
    Phone       VARCHAR(20),
    Status      BIT,
    ClassID     INT         NOT NULL,
    FOREIGN KEY (ClassId) REFERENCES Class (ClassID)
);
CREATE TABLE Subject
(
    SubID   INT         NOT NULL PRIMARY KEY AUTO_INCREMENT,
    SubName VARCHAR(30) NOT NULL,
    Credit  TINYINT     NOT NULL DEFAULT 1 CHECK (Credit >= 1),
    Status  BIT                  DEFAULT 1
);
CREATE TABLE Mark
(
    MarkID    INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    SubID     INT NOT NULL,
    StudentId INT NOT NULL,
    Mark      FLOAT   DEFAULT 0 CHECK (Mark Between 0 AND 100),
    ExamTimes TinyINT DEFAULT 1,
    UNIQUE (SubID, StudentId),
    FOREIGN KEY (SubID) REFERENCES Subject (SubID),
    FOREIGN KEY (StudentId) REFERENCES Student (StudentID)
);
SELECT *
FROM Class;
Select *
FROM Student;
Select *
FROM subject;
Select *
FROM Mark;
INSERT INTO Class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO Class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO Class
VALUES (3, 'B3', current_date, 0);
INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO Student (StudentName, Address, Status, ClassId)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);
INSERT INTO Subject(subid, subname, credit, status)
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
SELECT *
FROM Class
WHERE Status = true;
SELECT *
FROM subject
WHERE Credit < 10;
SELECT S.StudentID, S.StudentName, C.ClassName
FROM Student S
         join Class C on C.ClassID = S.ClassID
where ClassName = 'A1';
SELECT S.StudentID, S.StudentName, S2.SubName, Mark
FROM Student S
         JOIN Mark M on S.StudentID = M.StudentId
         JOIN Subject S2 on M.SubID = S2.SubID
WHERE S2.SubName = 'CF';
SELECT *
FROM Student
where StudentName like 'h%';
SELECT *
FROM Class
where MONTH(StartDate) = '12';
SELECT *
FROM subject
where Credit between 3 and 5;
UPDATE Student
SET ClassID =2
WHERE StudentName = 'Hung';
SELECT S.StudentName, SubName, M.Mark
FROM Student S
         join Mark M on S.StudentID = M.StudentId
         JOIN Subject S2 on M.SubID = S2.SubID
ORDER BY Mark;

SELECT Address, count(StudentID)
FROM Student
GROUP BY Address;
SELECT S.StudentID, S.StudentName, AVG(M.Mark)
FROM Student S
         join Mark M on S.StudentID = M.StudentId
GROUP BY S.StudentID, S.StudentName;
SELECT S.StudentID,S.StudentName,AVG(M.Mark)from Student S join Mark M on S.StudentID = M.StudentId GROUP BY S.StudentID, S.StudentName HAVING AVG(M.Mark)>15;
SELECT S.StudentId, S.StudentName, AVG(Mark)
FROM Student S join Mark M on S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName
HAVING AVG(Mark) >= ALL (SELECT AVG(Mark) FROM Mark GROUP BY Mark.StudentId);

