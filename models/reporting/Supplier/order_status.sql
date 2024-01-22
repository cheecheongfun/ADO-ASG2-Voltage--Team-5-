select orderID ,
       shipcountry AS Country, 
       CompanyName AS Courier, 
       Status, 
       Daystoship AS LeadTime, 
       CAST(OrderDate AS DATE) AS OrderedOn,
       Red, 
       Green
from {{ref ('stg_shipment_status')}}