SELECT
  customerID,
  companyName,
  country,
  city,
  address
FROM 
  {{ref('raw_customer')}}