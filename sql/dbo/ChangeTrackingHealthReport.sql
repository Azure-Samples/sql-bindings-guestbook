CREATE PROCEDURE [dbo].[ChangeTrackingHealthReport]
  @schema nvarchar(100),
  @table nvarchar(100)
AS
  -- content from mssqltips by Susantha Bathige 
  -- https://www.mssqltips.com/sqlservertip/4035/sql-server-change-tracking-performance-troubleshooting/

  select sch.name
    , it.name as CT_Name
    , ps.row_count as CT_Rows
    , sch2.name as Base_TableSchemaName
    , so2.name as Base_TableName

  from sys.internal_tables it
  inner join sys.objects so on it.object_id=so.object_id
  inner join sys.schemas sch on sch.schema_id=so.schema_id
  inner join sys.dm_db_partition_stats ps on ps.object_id=it.object_id
  left join sys.objects so2 on so2.object_id=it.parent_object_id
  left join sys.schemas sch2 on sch2.schema_id=so2.schema_id

  where it.internal_type IN (209, 210) and ps.index_id < 2
    and sch2.name = @schema and so2.name = @table
