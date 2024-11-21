
with customer_order as(
	select
		Rank() over(partition by c.CustomerID order by o.OrderDate desc) as RankID,
		c.CustomerID,
        c.CompanyName,
        c.ContactName,
        c.ContactTitle,
        o.OrderID,
        o.EmployeeID,
		o.OrderDate,
        o.ShipVia,
        o.Freight,
        o.ShipName,
        o.ShipAddress
	from Orders o
	inner join Customers c
	on o.CustomerID = c.CustomerID
)
select
	CustomerID,
    CompanyName,
    ContactName,
    ContactTitle,
    OrderID,
	CustomerID,
    EmployeeID,
	OrderDate,
    ShipVia,
    Freight,
    ShipName,
    ShipAddress
from customer_order
where RankID = 1
