{{ config (materialized='view') }}
select
birthdate,
city,
country,
employeeID,
firstname,
hiredate,
homephone,
lastname,
notes,
postalcode,
region,
reportsTo,
title,
titleofcourtesy
from {{ref("raw_employee")}} 