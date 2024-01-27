select orderID,
    CompanyName AS ShipCompany, 
    cost, 
    status, 
    red,
    green, 
    shipcountry,
    ProccesingTime 
from {{ref('stg_shipment_status')}} 
