--SCALAR FUNCTIONS
CREATE FUNCTION dbo.fn_FormatProductName (@ProductId int)
RETURNS Nvarchar(100)
AS 
BEGIN

DECLARE @Output Nvarchar(100)

select @Output = SUBSTRING(Code,2,2) + '-' + right(Name,3) + '-' + cast(Price as nvarchar(10))
from dbo.Product
where id = @ProductId

RETURN @Output

END
GO

-- test execution
select *,dbo.fn_FormatProductName (id) as FunctionOutput
from dbo.Product

--------------------------------------------------------------------------------------------------
-- TABLE FUNCTION

CREATE FUNCTION dbo.fn_OrdersPerCustomer (@BusinessEntityId int,@CustomerId int)
RETURNS @output TABLE (ProducName nvarchar(100),TotalQuantity int, TotalPrice decimal(18,9))
AS
BEGIN


INSERT INTO @output
select p.Name as ProductName, sum(d.Quantity) as TotalQuantity, sum(d.Quantity*d.Price) as TotalPrice
from dbo.[Order] o
inner join dbo.OrderDetails d on o.Id = d.OrderId
inner join dbo.Product p on p.id = d.ProductId
where o.BusinessEntityId = @BusinessEntityId
and o.CustomerId = @CustomerId
group by  p.name
ORDER BY TotalQuantity


RETURN 
END

GO

-- Execution

declare @BusinessEntityId int = 1
declare @CustomerId int = 64

select * from dbo.fn_OrdersPerCustomer (@BusinessEntityId,@CustomerId)