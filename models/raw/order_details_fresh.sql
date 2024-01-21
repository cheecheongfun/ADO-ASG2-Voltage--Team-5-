{{ config (materialized = "table")}}

Select *
from {{ source("NWT", 'ORDERDETAIL_FRESH')}}