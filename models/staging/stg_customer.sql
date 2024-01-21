{{ config (materialized='view')}}
select
customerID,
companyName,
contactTitle,
CONCAT_WS(', ', address , city, postalCode, country) as address,
country
from {{ref('raw_customer')}}