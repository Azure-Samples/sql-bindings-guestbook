CREATE USER [vsliveguestbook] FROM EXTERNAL PROVIDER;
go
ALTER ROLE db_datareader ADD MEMBER [vsliveguestbook];
go
ALTER ROLE db_datawriter ADD MEMBER [vsliveguestbook];
go
GRANT VIEW CHANGE TRACKING ON [app].[Entry] TO [vsliveguestbook];
GO