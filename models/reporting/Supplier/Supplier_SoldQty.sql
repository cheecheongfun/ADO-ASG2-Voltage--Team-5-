select companyName , s.supplierid , p.productName , p.productID , SUM(od.quantity) AS totalSales
from {{ref('raw_supplier')}} s
INNER JOIN {{ref('raw_product')}} p ON p.supplierid = s.supplierid
INNER JOIN {{ref('raw_order_details')}} od  ON od.productID = p.productID
group by companyName,s.supplierid , p.productID , p.productName
ORDER BY totalSales DESC