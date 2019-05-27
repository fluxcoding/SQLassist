SELECT * 
FROM Employee
WHERE FirstName = 'Goran'
order by LastName DESC
GO

-------------------------------------------------------------------------------------------------------------------


-- UNION nevrakja duplikati
--List all regions where some BusinessEntity is based, or some Customer is based. Remove duplicates
SELECT Region
FROM BusinessEntity
UNION
SELECT RegionName 
FROM dbo.Customer
GO


--UNION ALL - vrakja duplikati
--List all BusinessEntity Names and Customer Names in single result set with duplicates
SELECT Name
FROM BusinessEntity
UNION ALL
SELECT Name 
FROM dbo.Customer
GO


--INTERSECT vrakja zaednicki elementi
--List all regions where we have BusinessEntities and Customers in the same time
SELECT Region
FROM BusinessEntity
INTERSECT
--EXCEPT
SELECT RegionName 
FROM dbo.Customer
GO

-------------------------------------------------------------------------------------------------------------------

--Change Products table always to insert value 1 in price column if no price is provided on insert
ALTER TABLE Product
ADD CONSTRAINT DF_Product_Price
DEFAULT 1 FOR [Price]
GO

--Change Products table to prevent inserting Price that will more than 2x bigger then the cost price
ALTER TABLE [dbo].[Product] WITH CHECK
ADD CONSTRAINT CHK_Products_Price
CHECK (price<=Cost*2);
GO


--Change Products table to guarantee unique names across the products
-- This will fail due to duplicates (remove all duplicates)
ALTER TABLE [dbo].[Product] WITH CHECK
ADD CONSTRAINT UC_Product_Name UNIQUE (Name)
GO
insert into dbo.Product_test (Name,Code) values ('Musli bar','msb')

-------------------------------------------------------------------------------------------------------------------

-- create constraints
ALTER TABLE [dbo].[OrderDetails] ADD CONSTRAINT [FK_OrderDetails_Order] FOREIGN KEY ([OrderId]) REFERENCES [dbo].[Order]([Id]);


-------------------------------------------------------------------------------------------------------------------
CREATE TABLE TableA (idA int);
CREATE TABLE TableB (idB int);

Insert into TableA values (1),(2)--,(3)
Insert into TableB values (2),(3)--,(4)


-- INNER JOIN
select * 
from TableA
INNER JOIN TableB ON idA=idB

-- LEFT JOIN
select * 
from TableA
LEFT JOIN TableB ON idA=idB
