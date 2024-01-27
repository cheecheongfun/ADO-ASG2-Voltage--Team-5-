WITH closed_orders_count AS (
    SELECT
        employeeID,
        COUNT(*) AS closed_orders_count
    FROM {{ ref('stg_orders') }}
    WHERE shippedDate IS NOT NULL
    GROUP BY employeeID
),
fiscal_year AS (
    SELECT
        ORDERDATE,
        CASE
            WHEN EXTRACT(MONTH FROM ORDERDATE) >= 7 THEN EXTRACT(YEAR FROM ORDERDATE) + 1
            ELSE EXTRACT(YEAR FROM ORDERDATE)
        END AS fiscal_year,
        CASE
            WHEN EXTRACT(MONTH FROM ORDERDATE) BETWEEN 7 AND 9 THEN 'Q1'
            WHEN EXTRACT(MONTH FROM ORDERDATE) BETWEEN 10 AND 12 THEN 'Q2'
            WHEN EXTRACT(MONTH FROM ORDERDATE) BETWEEN 1 AND 3 THEN 'Q3'
            WHEN EXTRACT(MONTH FROM ORDERDATE) BETWEEN 4 AND 6 THEN 'Q4'
        END AS fiscal_quarter
    FROM
        {{ ref("stg_orders") }}
)

SELECT 
    s.employeeID AS employeeID,
    o.orderDate,
    sed.orderID,
    sed.netSales,
    sed.quantity,
    sed.profit,
    sed.profitMargin,
    fy.fiscal_year AS fiscal_year,
    fy.fiscal_quarter AS fiscal_quarter
FROM
    {{ ref('raw_employee') }} s 
    LEFT JOIN closed_orders_count coc ON coc.employeeID = s.employeeID
    INNER JOIN {{ ref('stg_orders') }} o ON coc.employeeID = o.employeeID
    INNER JOIN {{ ref('stg_order_detail') }} sed ON o.orderID = sed.orderID
    INNER JOIN fiscal_year fy ON o.ORDERDATE = fy.ORDERDATE
GROUP BY s.employeeID, coc.closed_orders_count, o.orderDate, fy.fiscal_year, sed.orderID, fy.fiscal_quarter, sed.orderID, sed.netSales, sed.quantity, sed.profit, sed.profitMargin
