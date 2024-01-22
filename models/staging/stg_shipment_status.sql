{{ config(materialized='view') }}

SELECT DISTINCT 
    orderID,
    o.customerID,
    employeeID,
    c.companyName AS Customer,
    freight AS Cost,
    ShipCountry,
    OrderDate,
    s.CompanyName,
    RequiredDate,
    ShippedDate,
    CASE WHEN RequiredDate < ShippedDate THEN 'Late' ELSE 'On-time' END AS Status,
    DATEDIFF(days, OrderDate, ShippedDate) AS DaysToShip,
    CASE WHEN DATEDIFF(days, ShippedDate, RequiredDate) < 7 THEN '1'ELSE '0' END AS Red,
    CASE WHEN DATEDIFF(days, ShippedDate, RequiredDate) > 7 THEN '1' ELSE '0' END AS Green

FROM 
    {{ ref('raw_orders') }} o 
INNER JOIN {{ref('raw_shipper')}} s ON o.ShipVia = s.shipperID
INNER JOIN {{ref ('raw_customer')}} c ON c.customerID = o.customerID