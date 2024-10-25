USE [LinkShorter]
GO

UPDATE [dbo].[Tbl_Links]
   SET [Link] = <Link, varchar(50),>
      ,[Status] = <Status, bit,>
 WHERE <Search Conditions,,>
GO


