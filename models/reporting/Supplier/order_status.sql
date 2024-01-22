select orderID ,
       shipcountry AS Country, 
       CompanyName AS Courier, 
       Status, 
       Daystoship AS LeadTime, 
       CAST(shippeddate AS DATE) AS ShippedDate,
       Red, 
       Green
from {{ref ('stg_shipment_status')}}