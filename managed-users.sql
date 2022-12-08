CREATE USER [passguestbook] FROM EXTERNAL PROVIDER;
ALTER ROLE db_datareader ADD MEMBER [passguestbook];
ALTER ROLE db_datawriter ADD MEMBER [passguestbook];
GO

CREATE USER [guestbookmoderator] FROM EXTERNAL PROVIDER;
ALTER ROLE db_datareader ADD MEMBER [guestbookmoderator];
ALTER ROLE db_datawriter ADD MEMBER [guestbookmoderator];
ALTER ROLE db_ddladmin ADD MEMBER [guestbookmoderator];
GO


CREATE USER [changetrackinghealth] FROM EXTERNAL PROVIDER;
ALTER ROLE db_datareader ADD MEMBER [changetrackinghealth];
ALTER ROLE db_datawriter ADD MEMBER [changetrackinghealth];
GO

GRANT EXECUTE ON OBJECT::dbo.ChangeTrackingHealthReport
    TO changetrackinghealth;
GO

GRANT VIEW DATABASE PERFORMANCE STATE TO changetrackinghealth;
GO