drop database if exists testing_system_assignment_1;

create database if not exists Testing_System_Assignment_1;

use Testing_System_Assignment_1;

create table Department(
DepartmentID int primary key auto_increment,
DepartmentName varchar(50) not null unique
);
create table `Position`(
PositionID int primary key auto_increment,
PositionName varchar(50) not null unique
);
create table `Account`(
AccountID int primary key auto_increment,
Email varchar(50) not null unique,
Username varchar(50) not null unique,
Fullname varchar(50),
DepartmentID int,
PositionID int,
CreateDate date,
constraint foreign key fk_Account_Department(DepartmentID) references Department(DepartmentID),
constraint foreign key fk_Account_Position(PositionID) references `Position`(PositionID)
);
create table `Group`(
GroupID int primary key auto_increment,
GroupName varchar(50),
creatorID int,
CreateDate date
);
Create table GroupAccount(
GroupID int primary key,
AccountID int,
JoinDate date
);
Create table TypeQuestion(
TypeID int primary key auto_increment,
TypeName enum('essay','Multiple-Choice')
);
create table CategoryQuestion(
CategoryID int primary key auto_increment,
CategoryName varchar(50)
);
create table Question(
QuestionID int primary key auto_increment,
Content varchar(200),
CategoryID int,
TypeID int,
CreatorID int,
CreateDate date,
constraint foreign key fk_Question_CategoryQuestion(CategoryID) references CategoryQuestion(CategoryID),
constraint foreign key fk_Question_TypeQuestion(TypeID) references TypeQuestion(TypeID)
);
create table Answer(
AnswerID int primary key auto_increment,
Content varchar(200),
QuestionID int,
isCorrect enum('đúng','sai'),
constraint foreign key fk_Answer_Question(QuestionID) references Question(QuestionID)
);
create table Exam(
ExamID int primary key auto_increment,
`Code` int not null unique,
Title varchar(50),
CategoryID int,
Duration time,
CreatorID int,
CreateDate date,
constraint foreign key fk_Exam_CategoryQuestion(CategoryID) references CategoryQuestion(CategoryID)
);
create table ExamQuestion(
ExamID int,
QuestionID int
);
