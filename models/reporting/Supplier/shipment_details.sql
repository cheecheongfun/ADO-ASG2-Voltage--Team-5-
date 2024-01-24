select orderID,
    CompanyName AS ShipCompany, 
    cost, 
    status, 
    red,
    green, 
    shipcountry,
    DaysToShip
from {{ref('stg_shipment_status')}} 
