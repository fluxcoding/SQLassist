CREATE TABLE [Customer](
Id int IDENTITY(1,1) NOT NULL,
Name nvarchar (100) NOT NULL,
City nvarchar (100) NULL,
CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED
(
[Id] ASC
))
GO


--INSERT OPERATION
INSERT INTO [Customer](Name,City)
VALUES ('Teodor','Skopje')


--READ OPERATION
--Read all data in the table
SELECT * FROM Customer

--Read only specific columns
SELECT Id,Name,City
FROM Customer

--Read specific colums n rows
SELECT Id,Name,City
FROM Customer
WHERE City = 'Skopje'


--UPDATE OPERATION
UPDATE Customer
SET Name = 'Vero Bitola', City = 'Bitola'
WHERE Name = 'Vero Skopje'

--DELETE OPERATIOn
DELETE
FROM Customer
WHERE Name = 'Vero Skopje'

-- DROP
DROP TABLE Customer
