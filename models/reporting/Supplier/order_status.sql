select orderID ,
       shipcountry AS Country, 
       CompanyName AS Courier, 
       Status, 
       Daystoship AS LeadTime, 
       Red, 
       Green
from {{ref ('stg_shipment_status')}}