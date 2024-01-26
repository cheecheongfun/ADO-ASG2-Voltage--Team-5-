{{ config(materialized='view') }}

SELECT
    supplierID,
    CompanyName,
    Country
FROM 
    {{ref('raw_supplier')}}
