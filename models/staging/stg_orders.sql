select
    orderID,
    customerID,
    employeeID,
    orderDate,
    DATE_PART(DAY, orderDate) as orderDay,
    DATE_PART(Month, orderDate) as orderMonth,
    DATE_PART(Year, orderDate) as orderYear,
    requiredDate,
    shippedDate,
    shipVia,
    freight,
    shipName,
    shipAddress,
    shipCity,
    shipRegion,
    shipPostalCode,
    shipCountry
FROM {{ref('raw_orders')}}