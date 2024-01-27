WITH closed_orders_count AS (
    SELECT
        employeeID,
        COUNT(*) AS closed_orders_count
    FROM {{ ref('stg_orders') }}
    WHERE shippedDate IS NOT NULL
    GROUP BY employeeID
)

SELECT 
    s.employeeID AS employeeID,
    coc.closed_orders_count AS closed_orders_count,
    SUM(sed.netSales) AS netSales,
    SUM(sed.quantity) AS quantity,
    SUM(sed.revenue) AS revenue,
    COUNT(DISTINCT o.customerID) AS number_of_customers
FROM
    {{ ref('stg_employee') }} s 
    LEFT JOIN closed_orders_count coc ON coc.employeeID = s.employeeID
    INNER JOIN {{ ref('stg_orders') }} o ON coc.employeeID = o.employeeID
    INNER JOIN {{ ref('stg_order_detail') }} sed ON o.orderID = sed.orderID
GROUP BY s.employeeID, coc.closed_orders_count
