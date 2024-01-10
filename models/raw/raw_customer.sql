--SELECT * FROM ASGGGGGGGG.NWT.CUSTOMER

{{ config (materialized='table')}}
SELECT *
FROM
{{source('NWT','CUSTOMER')}}