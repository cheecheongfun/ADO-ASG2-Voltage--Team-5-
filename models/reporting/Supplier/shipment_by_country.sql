select ShipCountry ,
       ROUND(AVG(Cost),2) as AVGCOST,
       ROUND(AVG(Daystoship)) as AVGLEADTIME
from {{ref ('stg_shipment_status')}}
GROUP BY ShipCountry
Order by AVGCOST,AVGLEADTIME Desc