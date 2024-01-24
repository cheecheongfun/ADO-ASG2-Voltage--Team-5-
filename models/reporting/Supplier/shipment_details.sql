select orderID,
    CompanyName AS ShipCompany, 
    cost, 
    status, 
    red,
    green, 
    shipcountry,
    DaysToShip AS ProcessingTime
from {{ref('stg_shipment_status')}} 
