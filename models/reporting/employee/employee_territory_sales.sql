SELECT 
  st.territoryID,
  st.territorydescription,
  SUM(sbe.netSales) as netSales
FROM
  {{ref("stg_territory")}} st  
  INNER JOIN {{ref('sales_by_employee')}} sbe
  ON st.employeeID = sbe.employeeID
GROUP BY st.territoryID, st.territorydescription
