{{ config (materialized='view') }}
select
  customerID,
  companyName,
  contactTitle,
  CONCAT_WS(', ', COALESCE(address, ''), COALESCE(city, ''), COALESCE(postalCode, ''), COALESCE(country, '')) as address,
  country
from {{ ref('raw_customer') }}