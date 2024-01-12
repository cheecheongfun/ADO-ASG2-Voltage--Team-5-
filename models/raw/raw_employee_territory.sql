{{ config (materialized='table')}}
SELECT * 
FROM 
{{source('NWT','EMPLOYEE_TERRITORY')}}