SELECT
  customerID,
  companyName,
  country,
  city,
  address
FROM 
  {{ref('stg_customer')}}