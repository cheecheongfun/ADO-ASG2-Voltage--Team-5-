SELECT
  orderID,
  shipcountry AS Country,
  CompanyName AS Courier,
  Status,
  ProcessingTime,
  orderDate,
  DATE_PART(DAY, orderDate) as orderDay,
  DATE_PART(Month, orderDate) as orderMonth,
  DATE_PART(Year, orderDate) as orderYear,
  Red,
  Green
FROM
  {{ ref('stg_shipment_status') }}
