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
SELECT *FROM Class;