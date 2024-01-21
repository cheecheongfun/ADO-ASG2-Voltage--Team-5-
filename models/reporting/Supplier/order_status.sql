select orderID ,
       shipcountry AS Country, 
       CompanyName AS Courier, 
       Status, 
       Daystoship AS LeadTime ,
       DeliveryStatus 
 from {{ref ('stg_shipment_status')}}