{{ config (materialized = "table")}}

Select *
from {{ source("NWT", 'ORDER_FRESH')}}