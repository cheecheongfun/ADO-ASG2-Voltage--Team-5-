{{ config(materialized='view') }}

SELECT DISTINCT 
    orderID,
    c.companyName AS Customer,
    freight AS Cost,
    ShipCountry,
    s.CompanyName,
    CASE WHEN RequiredDate < ShippedDate THEN 'Late' ELSE 'On-time' END AS Status,
    DATEDIFF(days, OrderDate, ShippedDate) AS DaysToShip,
    CASE WHEN DATEDIFF(days, ShippedDate, RequiredDate) < 7 THEN 'Red' ELSE 'Green' END AS DeliveryStatus
FROM 
    {{ ref('raw_orders') }} o 
INNER JOIN {{ref('raw_shipper')}} s ON o.ShipVia = s.shipperID
INNER JOIN {{ref ('raw_customer')}} c ON c.customerID = o.customerID
