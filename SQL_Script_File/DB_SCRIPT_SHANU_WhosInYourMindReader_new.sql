-- =============================================                                
-- Author      : Shanu                                
-- Create date : 2015-03-16                                
-- Description : To Create Database,Table and Sample Insert Query                             
-- Latest                                
-- Modifier    : Shanu                                
-- Modify date : 2015-03-16                            
-- =============================================
--Script to create DB,Table and sample Insert data
USE MASTER
GO
-- 1) Check for the Database Exists .If the database is exist then drop and create new DB
IF EXISTS (SELECT [name] FROM sys.databases WHERE [name] = 'MindReader' )
DROP DATABASE MindReader
GO

CREATE DATABASE MindReader
GO

USE MindReader
GO

-- 1) //////////// Professional_Type table
-- Create Table  Professional_Type ,This table will be used to store the details like Professional type as Sports,Bollywood Movie Star,kollywood Movie Star

IF EXISTS ( SELECT [name] FROM sys.tables WHERE [name] = 'Professional_Type' )
DROP TABLE Professional_Type
GO

CREATE TABLE Professional_Type
(
   Profes_ID VARCHAR(10) NOT NULL,
   Profes_Type VARCHAR(50)
CONSTRAINT [PK_Professional_Type] PRIMARY KEY CLUSTERED      
(     
  [Profes_ID] ASC     
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]     
) ON [PRIMARY]   

GO
-- Insert the sample records to the Character_Type Table
Insert into Professional_Type(Profes_ID,Profes_Type) values('1','Sports')
Insert into Professional_Type(Profes_ID,Profes_Type) values('2','Bollywood Movie Star')
Insert into Professional_Type(Profes_ID,Profes_Type) values('3','kollywood Movie Star')

-- 1) END //


-- 2) //////////// Character_type table
-- Create Table  Character_Type ,This table will be used to store the details like Character type as Cricket,Bollywood Actor,kollywood Actor

IF EXISTS ( SELECT [name] FROM sys.tables WHERE [name] = 'Character_Type' )
DROP TABLE Character_Type
GO

CREATE TABLE Character_Type
(
   Char_ID VARCHAR(10) NOT NULL,
   Profes_ID VARCHAR(10) NOT NULL CONSTRAINT  fk_Professional_Type FOREIGN KEY REFERENCES Professional_Type,
   Char_Type VARCHAR(50)
CONSTRAINT [PK_Character_Type] PRIMARY KEY CLUSTERED      
(     
  [Char_ID] ASC     
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]     
) ON [PRIMARY] 
GO
-- Insert the sample records to the Character_Type Table
Insert into Character_Type(Char_ID,Profes_ID,Char_Type) values('1','1','Cricket')
Insert into Character_Type(Char_ID,Profes_ID,Char_Type) values('2','2','Bollywood Actor')
--Insert into Character_Type(Char_ID,Profes_ID,Char_Type) values('3','2','Bollywood Actress')
Insert into Character_Type(Char_ID,Profes_ID,Char_Type) values('4','3','kollywood Actor')
--Insert into Character_Type(Char_ID,Profes_ID,Char_Type) values('5','3','kollywood Actress')
-- 2) END //


-- 3) //////////// Character_Name
-- Create Table  Character_Name ,This table will be used to store the details of Character Names

IF EXISTS ( SELECT [name] FROM sys.tables WHERE [name] = 'Character_Name' )
DROP TABLE Character_Name
GO

CREATE TABLE Character_Name
(
   Char_Name_ID VARCHAR(10) NOT NULL,
    Char_ID VARCHAR(10) NOT NULL CONSTRAINT  fk_Character_Type FOREIGN KEY REFERENCES Character_Type,
   Char_Name VARCHAR(50),
   Char_Status VARCHAR(20)
CONSTRAINT [PK_Char_Name] PRIMARY KEY CLUSTERED      
(     
  [Char_Name_ID] ASC     
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]     
) ON [PRIMARY] 
GO
-- Insert the sample records to the Character_Type Table
--Sports
Insert into Character_Name(Char_Name_ID,Char_ID,Char_Name,Char_Status) values('1','1','Sachin Tendulkar','Past')
Insert into Character_Name(Char_Name_ID,Char_ID,Char_Name,Char_Status) values('2','1','Sunil Gavaskar' ,'Past')
Insert into Character_Name(Char_Name_ID,Char_ID,Char_Name,Char_Status) values('3','1','Mohammed Azharuddin','Past')
Insert into Character_Name(Char_Name_ID,Char_ID,Char_Name,Char_Status) values('4','1','Mahender Singh Dhoni','Present')
Insert into Character_Name(Char_Name_ID,Char_ID,Char_Name,Char_Status) values('5','1','Shikhar Dhawan','Present')
--Bollywood Actor
Insert into Character_Name(Char_Name_ID,Char_ID,Char_Name,Char_Status) values('6','2','Amitabh Bachchan','Present')
Insert into Character_Name(Char_Name_ID,Char_ID,Char_Name,Char_Status) values('7','2','Shah Rukh Khan' ,'Present')
Insert into Character_Name(Char_Name_ID,Char_ID,Char_Name,Char_Status) values('8','2','Aamir Khan','Present')
Insert into Character_Name(Char_Name_ID,Char_ID,Char_Name,Char_Status) values('9','2','Salman Khan','Present')

--kollywood Actor
Insert into Character_Name(Char_Name_ID,Char_ID,Char_Name,Char_Status) values('10','4','Rajini Kanth','Present')
Insert into Character_Name(Char_Name_ID,Char_ID,Char_Name,Char_Status) values('11','4','Ajith Kumar' ,'Present')
Insert into Character_Name(Char_Name_ID,Char_ID,Char_Name,Char_Status) values('12','4','Kamala Hasan','Present')
Insert into Character_Name(Char_Name_ID,Char_ID,Char_Name,Char_Status) values('13','4','Vijay','Present')

-- 3) END //

--//test Select
		--select * from Professional_Type
		--select * from Character_Type
		--select * from Character_Name

--////end test select

-- 4) //////////// Questions
-- Create Table  Questions ,This table will be used to store the details of Character Names

IF EXISTS ( SELECT [name] FROM sys.tables WHERE [name] = 'Questions' )
DROP TABLE Questions
GO

CREATE TABLE Questions
(
   Question_ID VARCHAR(10) NOT NULL,
       Char_Name_ID VARCHAR(10) NOT NULL CONSTRAINT  fk_Character_Name FOREIGN KEY REFERENCES Character_Name,
   Question VARCHAR(300),
   Answer VARCHAR(100)
CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED      
(     
  [Question_ID] ASC     
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]     
) ON [PRIMARY] 
GO
-- Insert the sample records to the Character_Type Table
--Sports
--// Sachin
	Insert into Questions(Question_ID,Char_Name_ID,Question,Answer) values('1','1','Is he Present Player?','No')
	Insert into Questions(Question_ID,Char_Name_ID,Question,Answer) values('2','1','Is he born in Mumbai, Maharastra?' ,'Yes')
	Insert into Questions(Question_ID,Char_Name_ID,Question,Answer) values('3','1','Is he also called as nick name Little Master?','Yes')

--// Sunil Gavaskar	
	Insert into Questions(Question_ID,Char_Name_ID,Question,Answer) values('4','2','Is he Present Player?','No')
	Insert into Questions(Question_ID,Char_Name_ID,Question,Answer) values('5','2','Is he born in Mumbai, Maharastra?' ,'Yes')
	Insert into Questions(Question_ID,Char_Name_ID,Question,Answer) values('6','2','Is he also called as nickname  Sunny?','Yes')
	
--// Mohammed Azharuddin
	Insert into Questions(Question_ID,Char_Name_ID,Question,Answer) values('7','3','Is he Present Player?','No')
	Insert into Questions(Question_ID,Char_Name_ID,Question,Answer) values('8','3','Is he born in Hyderabad, Andhra Pradesh?' ,'Yes')
	Insert into Questions(Question_ID,Char_Name_ID,Question,Answer) values('9','3','Is he also called as nickname Ajju?','Yes')
	
--// Mahender Singh Dhoni
	Insert into Questions(Question_ID,Char_Name_ID,Question,Answer) values('10','4','Is he Present Player?','Yes')
	Insert into Questions(Question_ID,Char_Name_ID,Question,Answer) values('11','4','Is he born in Ranchi, Jharkhand?' ,'Yes')
	Insert into Questions(Question_ID,Char_Name_ID,Question,Answer) values('12','4','Is he also called as nickname Mahi?','Yes')
	
--// Shikhar Dhawan
	Insert into Questions(Question_ID,Char_Name_ID,Question,Answer) values('13','5','Is he Present Player?','Yes')
	Insert into Questions(Question_ID,Char_Name_ID,Question,Answer) values('14','5','Is he born in Delhi?' ,'Yes')
	Insert into Questions(Question_ID,Char_Name_ID,Question,Answer) values('15','5','Is he also called as nickname Gabbar?','Yes')
	
--Bollywood Actor
--// Amitabh Bachchan
	Insert into Questions(Question_ID,Char_Name_ID,Question,Answer) values('16','6','Is Your Actor Born in Allahabad, Uttar Pradesh?','Yes')
	Insert into Questions(Question_ID,Char_Name_ID,Question,Answer) values('17','6','Is Your Actor Father Was a Hindi Poet?' ,'Yes')
	Insert into Questions(Question_ID,Char_Name_ID,Question,Answer) values('18','6','Is your Actor married to a Actress named Jaya Bhaduri?','Yes')
	
--// Shah Rukh Khan
	Insert into Questions(Question_ID,Char_Name_ID,Question,Answer) values('19','7','Is your Actor born in New Delhi?','Yes')
	Insert into Questions(Question_ID,Char_Name_ID,Question,Answer) values('20','7','Is one of his Famous film runs in a Theatre for nearly 20 Years?' ,'Yes')
	Insert into Questions(Question_ID,Char_Name_ID,Question,Answer) values('21','7','Is your Actor is called as King Khan?','Yes')
	
--// Aamir Khan
	Insert into Questions(Question_ID,Char_Name_ID,Question,Answer) values('22','8','Is your Actor born in Mumbai?','Yes')
	Insert into Questions(Question_ID,Char_Name_ID,Question,Answer) values('23','8','Is his father was a producer?' ,'Yes')
	Insert into Questions(Question_ID,Char_Name_ID,Question,Answer) values('24','8','Is he acted in a movie which has Cricket Matches and that movie got so many awards?','Yes')
	
	--// Salman Khan
	Insert into Questions(Question_ID,Char_Name_ID,Question,Answer) values('25','9','Is your Actor born in Indore?','Yes')
	Insert into Questions(Question_ID,Char_Name_ID,Question,Answer) values('26','9','Is his father was a screenwriter?' ,'Yes')
	Insert into Questions(Question_ID,Char_Name_ID,Question,Answer) values('27','9',') Is your Actor brothers name is Arbaaz khan?','Yes')

--kollywood Actor
--// Rajini Kanth
	Insert into Questions(Question_ID,Char_Name_ID,Question,Answer) values('28','10','Is your Actor born in Karnataka?','Yes')
	Insert into Questions(Question_ID,Char_Name_ID,Question,Answer) values('29','10','Is your Actor is called as Super Star?' ,'Yes')
	Insert into Questions(Question_ID,Char_Name_ID,Question,Answer) values('30','10','Is your Actor is called as Thalapathy?','Yes')

--// Ajith Kumar
	Insert into Questions(Question_ID,Char_Name_ID,Question,Answer) values('31','11','Is Your Actor Born in Hyderabad?','Yes')
	Insert into Questions(Question_ID,Char_Name_ID,Question,Answer) values('32','11','Is Your Actor Motor Bike racer?' ,'Yes')
	Insert into Questions(Question_ID,Char_Name_ID,Question,Answer) values('33','11','Is your Actor nick name is Thala?','Yes')
	
--// Kamala Hasan
	Insert into Questions(Question_ID,Char_Name_ID,Question,Answer) values('34','12','Is your Actor born in Paramakudi?','Yes')
	Insert into Questions(Question_ID,Char_Name_ID,Question,Answer) values('35','12','Is your Actor received padma shri award during 1990?' ,'Yes')
	Insert into Questions(Question_ID,Char_Name_ID,Question,Answer) values('36','12','Is your Actor acted in a file with 10 Characters Roles?','Yes')
	
--// Vijay
	Insert into Questions(Question_ID,Char_Name_ID,Question,Answer) values('37','13','Is your Actor born in Chennai?','Yes')
	Insert into Questions(Question_ID,Char_Name_ID,Question,Answer) values('38','13','Is his father producer/Director?' ,'Yes')
	Insert into Questions(Question_ID,Char_Name_ID,Question,Answer) values('39','13','Is your Actor Called as Ilaya Thalapathy?','Yes')

-- 4) END //

--//test Select
		select * from Professional_Type
		select * from Character_Type
		select * from Character_Name
		select * from Questions order by Question_ID,Char_Name_ID
--////end test select
--// this is sample join query which i will be used in WCF function for Linq query
	select		A.Question_ID,
				A.Char_Name_ID,
				B.Char_ID,
				A.Question,
				A.Answer,				
				B.Char_Name,
				B.Char_Status
				FROM
					Questions A 
						Inner JOIN Character_Name B
						ON A.Char_Name_ID=B.Char_Name_ID						
				WHERE 
				B.Char_ID='2'
		order by cast(A.Question_ID as INT)