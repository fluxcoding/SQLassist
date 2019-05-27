-- PROCEDURE
CREATE PROCEDURE dbo.NewCustomer (@Name nvarchar(100), @AccountNumber nvarchar(50), 
	@City nvarchar(100), @RegionName nvarchar(100),@isActive bit)
AS
BEGIN
	
	INSERT INTO dbo.Customer ([Name], [AccountNumber], [City], [RegionName], [isActive])
	VALUES (@Name, @AccountNumber, @City, @RegionName, @isActive)

	select count(*) as TotalCostomersFirstLetter
	FROM dbo.Customer
	where substring(Name,1,1) = substring(@name,1,1)

	select count(*) as CustomersInRegion
	FROM dbo.Customer
	where regionName = @RegionName

END
GO

-- Test

exec dbo.NewCustomer 
 @Name = 'Viva',
 @AccountNumber = '123',
 @City  = 'Skopje',
 @RegionName ='Skopski',
@isActive = 1
---------------------------------------------------------------------------------------------------------
--TRY CATCH ERRORS

-- Verify that the stored procedure does not already exist.  
IF OBJECT_ID ( 'usp_GetErrorInfo', 'P' ) IS NOT NULL   
    DROP PROCEDURE usp_GetErrorInfo;  
GO  
  
-- Create procedure to retrieve error information.  
CREATE PROCEDURE usp_GetErrorInfo  
AS  
SELECT  
    ERROR_NUMBER() AS ErrorNumber  
    ,ERROR_SEVERITY() AS ErrorSeverity  
    ,ERROR_STATE() AS ErrorState  
    ,ERROR_PROCEDURE() AS ErrorProcedure  
    ,ERROR_LINE() AS ErrorLine  
    ,ERROR_MESSAGE() AS ErrorMessage;  
GO  
  
BEGIN TRY  
    -- Generate divide-by-zero error.  
    SELECT 1/0;  
END TRY  
BEGIN CATCH  
    -- Execute error retrieval routine.  
    EXECUTE usp_GetErrorInfo;  
END CATCH;