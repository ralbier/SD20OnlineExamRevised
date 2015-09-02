`use master
go
drop database dbSD20
go
create database dbSD20
go
use dbSD20
go
create table tbProgram
(
	ProgramId int primary key identity(1,1),
	ProgramName varchar(max)
)
go
insert into tbProgram(ProgramName)values
	('Software and Database Developer'),('Accounting Specialist'),
	('Administrative Professional'),('Business Administration'),
	('Casino / Resort / Event Coordinator'),('Legal Assistant'),
	('Travel Counsellor'),('Veterinary Office Assistant'),('Network Engineering'),
	('Enhanced Health Care Aide'),('Health Care Aide '),('Massage Therapy '),
	('Medical Laboratory Assistant'),('Medical Office Assistant'),('Nursing Assistant'),
	('Pharmacy Technician')
go
create table tbSession
(
	SessionId int primary key identity(1,1),
	SessionCode Varchar(max),
	ProgramId int foreign key references tbProgram(ProgramId) 
)
go
insert into tbSession(SessionCode,ProgramId) values
('AP12',1),('AP13',2),('SD20',3),('CREC01',4),('CREC02',4),('CREC03',4),
('LA10',5),('LA11',5),('LA12',5),
('TC002',6),('TC003',6),('TC004',6),
('VOA1',7),('VOA2',7),('VOA3',7),
('NA001',8),('NA002',8),('NA003',8),
('EHCA31',9),('EHCA32',9),('EHCA3',9),
('HCA07',10),('HCA08',10),('HCA09',10),
('MT03',11),('MT04',11),('MT05',11),
('MLA022',12),('MLA023',12),('MLA024',12),
('MOA11',13),('MOA12',13),('MOA14',13),
('NA15',14),('NA16',14),('NA17',14),
('PT007',15),('PT008',15),('PT009',15)
go
-----------------------------------------------
create table tbTypeOfQuestions
(
TypeOfQuestionsId int primary key identity(1,1),
TypeName varchar(max)
)
go
insert into tbTypeOfQuestions(TypeName)values
			('Multiple Questions/Fill the Blanks'),
			('True/False')
			
go
create table tbDifficulty
(
	DifficultyId int primary key identity(1,1),
	difficultyName Varchar(max)
)
go
Insert into tbDifficulty(difficultyName)values
			('Beginner'),
			('Intermediate'),
			('Advance')											
go

-----------------------------------------------

create table tbUser
(
	UserId int primary key identity(1,1),
	FirstName Varchar(max),
	LastName Varchar(max),
	Email Varchar(60) unique,---User Name----
	Password Varchar(max),
	SecurityLevel int 
	
)
go

Insert into tbUser (FirstName,LastName,Email,Password,SecurityLevel) values 
('Mohammad','Rahim','mohammad.rahim@robertsoncollege.net','1234',3),
('Mandeep','Kainth','mandeep.kainth@robertsoncollege.net','1234',2),
('Rimon','Bishay','rimon.bishay@robertsoncollege.net','1234',1),
('Adam','Jakab','adam@robertsoncollege.net','1234',1),
('Jackey','Walter','JackeyW@robertsoncollege.net','1234',1),
('Trish','Khan','trishK@robertsoncollege.net','1234',1),
('Rahul','Metha','RMetha@robertsoncollege.net','1234',1),
('Kathy','McDonald','Km@robertsoncollege.net','1234',1),
('Mathew','Robert','mathewR@robertsoncollege.net','1234',1),
('Paul','Barida','PaulB@robertsoncollege.net','1234',1),
('Adda','Jackson','AdaJackson@robertsoncollege.net','1234',1)
go 
select * from tbUser
go
-----------------------------------------------

create table tbUserSession
(
UserSessionId int primary key identity(1,1),
UserId int foreign key references tbUser(UserId),
	SessionId int foreign key references tbSession(SessionId)	
)
go

insert into tbUserSession(UserId, SessionId)values(3,3), (2,5),(4,6),(5,7), (7,8),(9,7), (6,8)
go
select * from tbUserSession
-----------------------------------------------
create table tbQuiz
(
  QuizId int primary key identity(1,1),
  QuizTitle varchar(max),
  TimeinMinute datetime,
  ProgramId int foreign key references tbProgram(ProgramId),
  DifficultyId int foreign key references tbDifficulty(DifficultyId),
  TypeOfQuestionsId int foreign key references tbTypeOfQuestions(TypeOfQuestionsId)	

)

go
insert into tbQuiz(QuizTitle,TimeinMinute,ProgramId,DifficultyId,TypeOfQuestionsId)values
					--('Test1',DATEADD(Minute,60,GETDATE()),1,1,1)
					('Test1',30,1,1,1),
					('Test2',30,2,1,1),
					('Test3',30,3,1,1)
--SELECT * FROM tbQuiz WHERE TimeinMinute > GETDATE()			
go
---------------------------------spGetQuiz----------------------------------------------------------------
create proc spGetQuiz
(
@QuizId int=NULL
)

as begin 
select * from tbQuiz
 where QuizId=ISNULL(@QuizId,QuizId)
 end
 go

------------------------------------------------------------------------------------


go
create table tbQuestion
(
  QuestionId int primary key identity(1,1),
  Question varchar(max),
  
  CorrectAnswer int,
  Marks int,

  QuizId int foreign key references tbQuiz(QuizId)
)
go
create table tbQuestionsAnswer
	(
	AnswerId int ,
	Answer varchar(max) NULL,
	QuestionId int foreign key references tbQuestion(QuestionId)
	)

go
INSERT INTO tbQuestion  (Question,CorrectAnswer,Marks,QuizId)VALUES
	('What  Default Data Type ?',2,1,1),
	('What is Default Form Border Style ?',3,1,1),
	('Which is not type of Control ?',1,1,1),
	('Which of the follwing contexts are available in the add watch window?', 4,1,2),
	('Which window will allow you to halt the execution of your code when a variable changes?',4,1,2),
	('How can you print the object name associated with the last VB  error to the Immediate window?',3,1,2),
	('boolean has two values true or false',4,1,1),	
	('How can you print the object name associated with the last VB  error to the Immediate window?',3,1,1),
	('What function does the TabStop property on a command button perform?',3,1,1),
	('You application creates an instance of a form. What is the first event that will be triggered in the from?', 2,1,1)

go
INSERT INTO tbQuestionsAnswer(AnswerId,Answer,QuestionId)VALUES
	(1,'String',1),(2,'Variant',1),(3,'Interger',1),(4,'Boolean',1),
	(1,'Fixed Single',2),( 2,'None',2),(3, 'Sizeable',2),(4,'Fixed Diaglog',2), 
	(1,'text',3), (2,'lable',3), (3,'checkbox',3), (4,'option button',3),
	(1,'Project',4), (2,'Module',4),(3, 'Procedure',4), (4,'All',4),
	(1,'The call stack window',5),(2, 'The immedite window',5), (3,'The locals window',5),(4, 'The watch window',5),
	(1,'Debug.Print Err.Number',6), (2,'Debug.Print Err.Source',6),(3, 'Debug.Print Err.Description',6), (1,'Debug.Print Err.LastDLLError',6),
	(1,'true',7),(2,'false',7),(3, null,7), (4,null,7),
	(1,'true',8),(2,'false',8),(3,null,8),(4,null,8),	
	(1,'Load',9),(2,'GotFocus',9),(3,'Instance',9),(4,'Initialize',9),
	(1,'Load',10),(2,'GotFocus',10),(3,'Instance', 10),(4,'Initialize',10)

--('What  Default Data Type ?', 'String', 'Variant', 'Integer', 'Boolear','Variant',1,1),
--( 'What is Default Form Border Style ?', 'Fixed Single', 'None', 'Sizeable','Fixed Diaglog', 'Sizeable',1,1),
-- ( 'Which is not type of Control ?', 'text', 'lable', 'checkbox', 'option button', 'text',1,1),
--( 'Which of the follwing contexts are available in the add watch window?', 'Project', 'Module', 'Procedure', 'All', 'All',1,1),
--( 'Which window will allow you to halt the execution of your code when a variable changes?', 'The call stack window', 'The immedite window', 'The locals window', 'The watch window', 'The watch window',1,1),
--( 'How can you print the object name associated with the last VB  error to the Immediate window?', 'Debug.Print Err.Number', 'Debug.Print Err.Source', 'Debug.Print Err.Description', 'Debug.Print Err.LastDLLError', 'Debug.Print Err.Source',1,1),
--('boolean has two values true or false','true','false',null,null,'true',1,1),	
--( 'How can you print the object name associated with the last VB  error to the Immediate window?', 'Debug.Print Err.Number', 'Debug.Print Err.Source', 'Debug.Print Err.Description', 'Debug.Print Err.LastDLLError', 'Debug.Print Err.Source',1,1),
--( 'What function does the TabStop property on a command button perform?', 'It determines whether the button can get the focus', 'If set to False it disables the Tabindex property.', 'It determines the order in which the button will receive the focus', 'It determines if the access key swquence can be used', 'It determines whether the button can get the focus',1,1),
--( 'You application creates an instance of a form. What is the first event that will be triggered in the from?', 'Load', 'GotFocus', 'Instance', 'Initialize', 'Initialize',1,1)

go
select * from tbQuestion
---------------------------------------------
go
create table tbQuizResponse
(
  QuizResponseId int primary key identity(1,1),
  ExamDate Date,
  UserId int foreign key references tbUser(UserId),
  QuizId INT FOREIGN KEY REFERENCES tbQuiz(QuizId)
)
go

INSERT INTO tbQuizResponse(ExamDate, UserId, QuizId)VALUES
('2015-02-07',3,1), ('2015-05-09',10,1)

--,('2015-07-10',9,1), ('2014-03-30',4,1),
--('2015-05-15',6,1), ('2015-07-07',7,1),('2014-08-14',8,1), ('2015-08-07',11,1),
--('2014-01-10',5,1), ('2015-04-03',2,1),('2015-04-09',1,1)
go

--select * from tbUser
--select * from tbQuizResponse
--select * from tbQuestion
------------------------------------------------
create table tbQuestionResponse
(
  QuestionResponseId int primary key identity(1,1),
  QuizResponseId int foreign key references tbQuizResponse(QuizResponseId),
  QuestionId int foreign key references tbQuestion(QuestionId),
  Response varchar(max)   
)
go


INSERT INTO tbQuestionResponse(QuizResponseId, QuestionId, Response)VALUES

(1,1,'Variant'),(1,2,'lable'),(1,3,'None'),(1,4,'false'),(1,5,'Module'),
(2,1,'False'),(2,2,'123123'),(2,3,'Hellow WOrlds!'),(2,4,'I dont know')
GO
--------------------------------------------spGetQuizResponseByUserId--------------------------------------------------------------


CREATE PROC spGetAllQuizReponsesByQuizId 
(@QuizId AS INT)
AS
BEGIN


	DECLARE @TotalMarks DECIMAL
	SELECT @TotalMarks = CONVERT(DECIMAL,SUM(Marks)) FROM tbQuestion WHERE QuizId = @QuizID


SELECT	[first].UserId,
		[first].Email,
		[first].QuizTitle,
		[first].ExamDate,
		(CASE WHEN [second].[Correct Reponses] IS NULL THEN 0 ELSE [second].[Correct Reponses] END) AS [Correct Responses], 
		@TotalMarks AS [Number Of Questions],
		(CASE WHEN [second].Grade IS NULL THEN 0 ELSE [second].Grade END) AS [Grade],
		CASE WHEN [second].Grade IS NOT NULL AND [second].Grade >= 70 THEN 'Pass'
				 ELSE 'Fail' END AS [Pass/Fail]
	FROM 
		(SELECT qr.UserId, u.Email, q.QuizTitle, qr.ExamDate
			FROM tbQuiz q
				JOIN tbQuizResponse qr ON qr.QuizId = q.QuizId
				JOIN tbUser u ON u.UserId = qr.UserId
				WHERE q.QuizId = @QuizId) AS [first]
	LEFT OUTER JOIN
		(SELECT qr.UserId, u.Email, q.QuizTitle, qr.ExamDate, 
					SUM(qu.Marks) AS [Correct Reponses], 
					@TotalMarks AS [Number Of Questions],
					CONVERT(DECIMAL(3,2),(CONVERT(DECIMAL(3,2),SUM(qu.Marks)) / @TotalMarks)) AS [Grade]
				FROM tbQuiz q
					JOIN tbQuizResponse qr ON qr.QuizId = q.QuizId
					JOIN tbQuestionResponse qur ON qur.QuizResponseId = qr.QuizResponseId
					JOIN tbQuestion qu ON qu.QuestionId = qur.QuestionId
					JOIN tbUser u ON u.UserId = qr.UserId
					WHERE qu.CorrectAnswer = qur.Response AND q.QuizId = @QuizId
				GROUP BY qr.UserId, u.Email, q.QuizTitle, qr.ExamDate) AS [second] ON [first].Email = [second].Email

END

GO
-------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROC spGetQuizResponseByUserId --@UserId=3, @QuizResponseId = 1
(
	@QuizResponseId INT, 
	@UserId INT
)
AS
BEGIN
	DECLARE @TotalQuestions INT
	DECLARE @Marks INT
	DECLARE @Grade DECIMAL

	SELECT @TotalQuestions = COUNT(*) 
		FROM tbQuiz q 
		JOIN tbQuestion qu ON q.QuizId = qu.QuizId
		JOIN tbQuizResponse r ON r.QuizId = q.QuizId
		WHERE r.QuizResponseId = @QuizResponseId

	SELECT @Marks = SUM(q.Marks)
	FROM tbQuestionResponse qr 
		JOIN tbQuestion q ON qr.QuestionId = q.QuestionId
		JOIN tbQuizResponse r ON r.QuizResponseId = qr.QuestionResponseId
		JOIN tbUser u ON u.UserId = r.UserId
	WHERE q.CorrectAnswer = qr.Response
			AND u.UserId = @UserId AND r.QuizResponseId = @QuizResponseId
	GROUP BY u.UserId, r.QuizResponseId,u.Email

	SET @Grade = CONVERT(DECIMAL(3,2),(CONVERT(DECIMAL,@Marks)/CONVERT(DECIMAL,@TotalQuestions))) * 100.0

	SELECT	FirstName, LastName, Email,	
			@Marks AS [Correct], 
			@TotalQuestions AS [Quiz Questions],
			(CONVERT(VARCHAR(5),@Grade) + '%') AS [Grade],
			CASE WHEN @Grade >= 70 THEN 'Pass'
				 ELSE 'Fail' END AS [Pass/Fail]
		FROM tbUser u
		WHERE u.UserId = @UserID
END

--select distinct  * from tbQuestionResponse,tbQuiz,tbQuizResponse
------------------------------------------------
go
create proc spCountNumberOfQuestions 
(
@QuizId int
)
as begin
 select count(*) as numberofquestions
	from tbQuestion
	
	where QuizId = @quizId
end
go
exec spCountNumberOfQuestions @QuizId=2


go
create table tbUserProgram
(
  UserProgramId int primary key identity(1,1),
  UserId int foreign key references tbUser(UserId),
  ProgramId int foreign key references tbProgram(ProgramId)	    
)
go

insert into tbUserProgram(UserId,ProgramId)values(3,1)
--select * from tbUserProgra
------------------------------------------------
go
create table tbActiveExam
(
  ActiveExamId int primary key identity(1,1),
  StartTime datetime,
  EndTime datetime,
  QuizId INT FOREIGN KEY REFERENCES tbQuiz(QuizId),
  SessionId int foreign key references tbSession(SessionId) 	    
)
go
--select * from tbActiveExam

insert into tbActiveExam (StartTime,EndTime,QuizId,SessionId)values
('2015-09-01 12:10:00','2015-09-01 13:00:00',1,3)
						-- (GETDATE(),DATEADD(minute,30,GETDATE()),1,3)
------------------------spInsertUser--------------------------
go
create proc spInsertUser
(
	@FirstName Varchar(60),
	@LastName varchar(60),
	@Password Varchar(60),
	@Email Varchar(60),
	@SecurityLevel int 
)
	as begin
		if exists (select Email from tbUser where Email=@Email)
	begin
		select 'ERROR!' as Message
	end
		else begin
			insert into tbUser(FirstName,LastName,Password,Email,SecurityLevel)values
			(@FirstName,@LastName,@Password,@Email,@SecurityLevel)
			select 'OK' as Message
	end
end



--------------------spGetUser---------------------------------
go
create proc spGetUser
(
	@UserId int=NULL
)
	as begin
		Select  * from tbUser
		Where UserId=ISNULL (UserId,@UserId)
	end

--------------------spDeleteUser-----------------------------

go
create proc spDeleteUser
(
	@UserId varchar (60)
)
	as begin
	delete from tbUser
	where UserId = @UserId
end

--exec spDeleteUser @UserId='Rahim'

--------------------spUpdateUser-----------------------------

go
create proc spUpdateUser
(
	@UserId int,
	@FirstName Varchar(60),
	@LastName Varchar(60),
	@Password Varchar(60),
	@Email Varchar(50),
	@SecurityLevel int
)
	as begin update tbUser 
	set FirstName=@FirstName, 
		LastName=@LastName,
		Password=@Password, 
		Email=@Email
		--SecurityLevel=@SecurityLevel
	where UserId=@UserId
	end
go
----------------------------------------
--create proc spQuestionsInsert
--(
--  @Question varchar(500),
--  @Answer1 varchar(50),
--  @Answer2 varchar(50),
--  @Answer3 varchar(50),
--  @Answer4 varchar(50),
--  @CorrectAnswer varchar(4),
--  @Marks int
-- )
--as begin
--  insert into tbQuestion(Question,Answer1,Answer2,Answer3,Answer4,CorrectAnswer,Marks)values
--						(@Question,@Answer1,@Answer2,@Answer3,@Answer4,@CorrectAnswer,@Marks)
--end
--go
--create proc spQuestionsUpdate
--(
--  @QuestionId int,
--  @Question varchar(500),
--  @Answer1 varchar(50),
--  @Answer2 varchar(50),
--  @Answer3 varchar(50),
--  @Answer4 varchar(50),
--  @CorrectAnswer varchar(4),
--  @Marks int
--)
--as begin
--  update tbQuestion
--  set Question=@Question,
--	  Answer1=@Answer1,
--	  Answer2=@Answer2,
--	  Answer3=@Answer3,
--	  Answer4=@Answer4,
--	  CorrectAnswer=@CorrectAnswer,
--	  Marks=@Marks
--	  where QuestionId=@QuestionId

--end
--go
--create proc spQuestionDelete
--(
--@QuestionId int
--)
--as begin
--	delete from tbQuestion
--	where QuestionId=@QuestionId
--end
--go

--create proc spQuestion
--(
--@QuestionId int
--)
--as begin
--	select * from tbQuestion
--	where QuestionId=isnull(@QuestionId,QuestionId)
--end 
--go

create proc spQuestionsbyQuizId  
(
@QuizId int
)
as begin
	select * from tbQuestion
	where QuizId=isnull(@QuizId,QuizId)
end 
exec spQuestion @QuestionId=3
go






---------------------Create Login Proc For User--------------------------

create procedure UserspLogin(
@Email varchar(60),
@Password varchar(60)
)
as begin
	select * from tbUser where tbUser.Email = @Email and tbUser.Password = @Password 
end
go
-----------------------------------
create proc spSelectSession
as begin
select * from tbSession
end
-------------------------------

go
create proc spSelectProgram
as begin
select * from tbProgram
end
go
---------------------
create proc spSelectDifficulty
as begin
select * from tbDifficulty
end
go
-----------------------------------
create proc spSelectTypeofQusetions
as begin
select * from tbTypeOfQuestions
end
go
------------------------------------

create proc spSelectQuiz
as begin
select QuizId,QuizTitle,  CONVERT(VARCHAR(8),GETDATE(),108) AS TimeinMinute,ProgramId,DifficultyId,TypeOfQuestionsId
 from tbQuiz
end
go

------------------------------------
create proc spShowQuiz
as begin
select * from tbQuiz
end
go

------------------------------------

create proc spUpdateQuiz
(
	@QuizId int,
@QuizTitle varchar(max),
@Time datetime,
@pro_Id int,
@DifficultyId int,
@typeofQuestionId int
)
as begin
	update tbQuiz
	set QuizTitle=@QuizTitle,
	TimeinMinute=@Time,
	ProgramId=@pro_Id,
	DifficultyId=@DifficultyId,
	TypeOfQuestionsId=@typeofQuestionId
	where QuizId=@QuizId
end
go	

------------------------------------

create proc spDeleteQuiz
(
@QuizId int
)
as begin
if exists 
	(
		select * from tbActiveExam where QuizId=@QuizId
	)
	select 'Failed' as Result
	else
	begin
	
delete from tbQuiz
where QuizId=@QuizId
select 'Success' as Result
end
end
go

---------------------------------------------------------------------
create procedure spTeacher
as begin
  select FirstName, LastName, Password, Email, SecurityLevel from tbUser
                   where SecurityLevel=1
end 
go

----------------------------------------------------------------------
create procedure spStudent
as begin
  select FirstName, LastName, Password, Email, SecurityLevel from tbUser
                  where SecurityLevel=2
end
go
-----------------------------------------------------------------------
--create proc spInsertQuestionMultiChoice
--(
--@QuizTitle varchar(60),
--@ProgramId int,
--@DifficultyId int,
--@TimeInMinute dateTime,
--@TypeOfQuestionsId int,
--@Question varchar(max),
--@Answer1 varchar(60),
--@Answer2 varchar(60),
--@Answer3 varchar(60),
--@Answer4 varchar(60),
--@CorrectAnswer varchar(60),
--@Mark int
--)
--as begin
-- insert into tbQuiz(QuizTitle,TimeInMinute,ProgramId,DifficultyId,TypeOfQuestionsId)values
--				   (@QuizTitle,@TimeInMinute,@ProgramId,@DifficultyId,@TypeOfQuestionsId)
-- insert into tbQuestion(Question,Answer1,Answer2,Answer3,Answer4,CorrectAnswer,Marks)values
--						(@Question,@Answer1,@Answer2,@Answer3,@Answer4,@CorrectAnswer,@Mark)
--end
--go
--create proc spInsertQuestionTrueFalse
--(
--@QuizTitle varchar(max),
--@ProgramId int,
--@DifficultyId int,
--@TimeInMinute dateTime,
--@TypeOfQuestionsId int,
--@Question varchar(max),
----@Answer1 varchar(60),
----@Answer2 varchar(60),
--@CorrectAnswer varchar(max),
--@Mark int
--)
--as begin
-- insert into tbQuiz(QuizTitle,TimeInMinute,ProgramId,DifficultyId,TypeOfQuestionsId)values
--				   (@QuizTitle,@TimeInMinute,@ProgramId,@DifficultyId,@TypeOfQuestionsId)
-- insert into tbQuestion(Question,CorrectAnswer,Marks)values
--						(@Question,@CorrectAnswer,@Mark)
--end
--go



-----------------------------------------------------------------------------------------------

create procedure spGetActiveQuizByUser 
(
@UserId int
)
as begin
	if Exists (SELECT * FROM tbUserSession WHERE UserId=@UserId)
		select FirstName,LastName,SessionCode,ProgramName, tbQuiz.QuizTitle
			from tbUserSession JOIN tbUser ON tbUser.UserId=tbUserSession.UserId
							   JOIN tbSession ON tbSession.SessionId= tbUserSession.SessionId
							   JOIN tbProgram ON tbProgram.ProgramId=tbSession.ProgramId
							   JOIN tbActiveExam ON tbActiveExam.SessionId = tbSession.SessionId
							   JOIN tbQuiz ON tbQuiz.QuizId = tbActiveExam.QuizId
			where tbUser.UserId = @UserId AND tbActiveExam.EndTime > GETDATE()
end
go

-----------------------------------
--exec spGetActiveQuizByUser @UserId=3
create proc spActiveExam
(
  @StartTime DATETIME,
  @EndTime DATETIME,
  @QuizId INT, 
  @SessionId int 
)
as begin

	insert into tbActiveExam(StartTime,EndTime,SessionId,QuizId)values
							(@StartTime,@EndTime,@SessionId,@QuizId)

end
go
---------------------
create proc spShowExam
as begin
select distinct QuizId,QuizTitle,TimeinMinute,tbProgram.ProgramName,
	tbDifficulty.difficultyName as Difficulty,tbTypeOfQuestions.TypeName as Type_of_Question 
		from tbQuiz,tbProgram,tbDifficulty,tbTypeOfQuestions,tbSession
		where tbProgram.ProgramId=tbQuiz.ProgramId and
				tbDifficulty.DifficultyId=tbQuiz.DifficultyId and
				tbTypeOfQuestions.TypeOfQuestionsId=tbQuiz.TypeOfQuestionsId 


end
go


-------------------------
create proc spShowActiveExam
as begin
select * from tbActiveExam
end
go




-----------------------------------------------------tbResetpasswordRequest---------------------------------------------
--drop table tbResetpasswordRequest
go
create table tbResetpasswordRequest
(
ID uniqueidentifier primary key,
UserId int foreign key references tbUser(UserId),
ResetRequestDateTime datetime 
)
go
insert into tbResetpasswordRequest values ('a1c52544-0eb8-4912-8d38-241fbfcf9753',1,GETDATE())



go
create proc spResetPassword 
(
@Email varchar(60)
)
as begin
    Declare @UserId INT

	select @UserId=UserId, @Email=Email
		from tbUser
		where Email=@Email

    if (@UserId is Not null)
	  begin
		Declare @GUID uniqueIdentifier
		set @GUID=NEWID()
     
		INSERT INTO tbResetpasswordRequest (ID,UserId,ResetRequestDateTime)
		VALUES (@GUID,@UserId,GETDATE())

		SELECT 1 AS RETURNCODE,@GUID as Uniqueid, @Email as Email
	 end
	 else 
	 begin	 
		 -- if username does not exist
		 select 0 as RETURNCODE, NULL AS UNIQUEID, NULL AS EMAIL
	 END
	 END
-------------------------------------------------------spIsPasswordResetLinkValid--------------------------------------------------------------------------------------
GO
create proc spIsPasswordResetLinkValid
(
@GUID uniqueidentifier

)
AS BEGIN
IF (EXISTS (SELECT  UserId from tbResetpasswordRequest where ID = @GUID))
 begin
     select 1 as [IsvalidPasswordResetLink]
 end
 else
 begin
     select 0 as [IsvalidPasswordResetLink] 
	 end
end
go
-------------------------------------------------spChangePassword--------------------------------------------------
create proc spChangePassword 
(
@GUID uniqueidentifier,
@Password varchar(60)
)
as begin
        Declare @UserId int 
		select @UserId=UserId
		from tbResetpasswordRequest
		where ID =@GUID

 IF (@UserId IS NULL)
 BEGIN
 -- IF CustID DOES NOT EXIST
 SELECT 0 AS IspasswordChanged
 end
 else
 begin
 --- IF CustID EXISTS, UPDATE WITH NEW PASSWORD 
 UPDATE tbUser SET 
 [Password]=@Password
 where UserId=@UserId

 -- delete the password reset request row 
 delete from tbResetpasswordRequest
 where ID=@GUID

 SELECT 1 AS IsPasswordChanged
 end
 end
----------------------------------------------------spGetStudentByEachProgram-------------------------------------------------------------
--drop proc spGetStudentEachProgram
go 
create proc spGetStudentEachProgram

as begin

	select FirstName,LastName,ProgramName, SessionCode
	from tbUser, tbProgram, tbSession,tbUserSession
	where tbUser.UserId= tbUserSession.UserId and 
	tbSession.SessionId=tbUserSession.SessionId and
	tbProgram.ProgramId=tbSession.ProgramId 

end
go
--exec spGetStudentEachProgram
--------------------------------------------------spGetNumberOfStudentByProgram-----------------------------------------------------------------

--drop proc spGetNumberOfStudentByProgram

create proc spGetNumberOfStudentByProgram
(
@Direction Varchar(10)
)
as begin
       if (@Direction = 'asc')
       begin
	       select tbProgram.ProgramName,tbSession.SessionCode, count (DISTINCT  tbuser.UserId) as NumberOfStudent
	       from tbProgram,tbSession,tbUserSession,tbUser
	       where tbProgram.ProgramId=tbSession.ProgramId AND
		        tbSession.SessionId=tbUserSession.SessionId and 
				tbUser.UserId=tbUserSession.UserId
		  group by tbProgram.ProgramName,tbSession.SessionCode
	   end 
	   else 
		  begin
		   select tbProgram.ProgramName,tbSession.SessionCode, count (DISTINCT  tbuser.UserId) as NumberOfStudent
	       from tbProgram,tbSession,tbUserSession,tbUser
	       where tbProgram.ProgramId=tbSession.ProgramId AND
		        tbSession.SessionId=tbUserSession.SessionId and 
				tbUser.UserId=tbUserSession.UserId
		  group by tbProgram.ProgramName,tbSession.SessionCode
			Order by tbProgram.ProgramName DESC;
	   end
	end
  go

--------------------------------------spGetQutionNumberbyExam--------------------------------------------------------------------------------

--drop proc spGetQutionNumberbyExam
create proc spGetQutionNumberbyExam
  
as begin
     select  tbQuiz.QuizTitle, count (DISTINCT tbQuestion.QuestionId) AS NumberOfQuestion 
      from tbQuiz,tbQuestion
      where tbQuiz.QuizId=tbQuestion.QuizId
    GROUP BY tbQuiz.QuizTitle
  end
go
--EXEC  spGetQutionNumberbyExam

-----------------------------------spGetSessionsByProgram ----------------------------------------------------------------

create proc spGetSessionsByProgram
as begin 
       select  tbProgram.ProgramName, tbProgram.ProgramId, COUNT (DISTINCT tbSession.SessionId) as NumberOfSession
	   from tbProgram, tbSession
	   where tbProgram.ProgramId=tbSession.ProgramId
	   GROUP BY tbprogram.ProgramName, tbProgram.ProgramId
	end
go
-- exec spGetSessionsByProgram

SELECT * FROM tbProgram p JOIN tbSession s ON p.ProgramId = s.ProgramId
---------------------------------------------------------------------------------------------------------------------------------
--create proc spGetSessionByProgram
--(
--@ProgramId int
--)
--as begin
--select  distinct * from tbSession,tbProgram
--where tbProgram.ProgramId=tbSession.ProgramId  and
--end

--create proc spGetSessionByProgram
--as begin
--select  distinct tbProgram.ProgramId, SessionCode from tbSession
--inner join tbProgram on tbSession.ProgramId  = tbProgram.ProgramId
--where tbProgram.ProgramId
--end

--select * from tbSession
--select * from tbProgram
select * from tbQuizResponse,tbQuestionResponse
select * from tbQuestionResponse
go
create proc spInsertQuestionResponse
(
@UserId int ,
  @QuizId int,
  @QuestionId int ,
  @Response varchar(max)   
  )
  as begin
  declare @newQuizResponseId int

  insert into tbQuizResponse(QuizId,ExamDate,UserId)values(@QuizId,GETDATE(),@UserId)
	set  @newQuizResponseId=SCOPE_IDENTITY()
	insert into tbQuestionResponse(QuestionId,QuizResponseId,Response)values
									(@QuestionId,@newQuizResponseId,@Response)

end
go



create proc sploadQuestions
( 
 @QuizId int 
)
as begin
create table #QuestionAnswer(
			QuestionId int,
			Answer1 varchar(max),
			Answer2 varchar(max),
			Answer3 varchar(max),
			Answer4 varchar(max)
						)

insert into #QuestionAnswer 
select * from tbQuestionsAnswer 
pivot (
		max(Answer) for AnswerId
			in ([1],[2],[3],[4] ) )as answers

			where QuestionId in (
			select QuestionId from tbQuestion where QuizId=@QuizId)

select tbQuestion.QuestionId,Question,Answer1,Answer2,Answer3,Answer4,CorrectAnswer,Marks,QuizId from #QuestionAnswer,tbQuestion
where tbQuestion.QuestionId=#QuestionAnswer.QuestionId

end
go
exec sploadQuestions @QuizId=1
select * from tbQuestionResponse
