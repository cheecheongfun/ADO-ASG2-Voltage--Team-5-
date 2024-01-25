{{ config (materialized='view')}}
select
t.territoryID,
t.territorydescription,
et.employeeID
from {{ref('raw_territory')}} t INNER JOIN {{ref('raw_employee_territory')}} et ON t.territoryID = et.territoryID