select * from dbo.Questions
order by CAST(LEFT(Question_ID,10) as int) desc