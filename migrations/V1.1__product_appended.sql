-- Create or replace the temporary table
CREATE OR REPLACE TEMPORARY TABLE temp_product (
    PRODUCTID NUMBER(38,0),
    PRODUCTNAME VARCHAR(40),
    LISTPRICE FLOAT,
    UNITCOST FLOAT,
    DISCONTINUED VARCHAR(3),
    CATEGORYNAME VARCHAR(15),
    SUPPLIER VARCHAR(30),
    UNIQUE (PRODUCTID)
);

-- Insert data into the temporary table using FRESH materialization
INSERT INTO temp_product
SELECT
    "Product ID" AS PRODUCTID,
    "Product Name" AS PRODUCTNAME,
    "ListPrice" AS LISTPRICE,
    "UnitCost" AS UNITCOST,
    "Discontinued" AS DISCONTINUED,
    "CategoryName" AS CATEGORYNAME,
    "Supplier" AS SUPPLIER
FROM {{ config(materialized) == 'fresh' }} 
    {{ adapter.dispatch.load(file('migrations/product_fresh.csv', temp_table='temp_product')) }}


-- Drop columns from PRODUCT table
ALTER TABLE PRODUCT
DROP COLUMN IF EXISTS
    SUPPLIERID,
    CATEGORYID,
    QUANTITYPERUNIT;

-- Rename UNITPRICE to LISTPRICE in PRODUCT table
ALTER TABLE PRODUCT
RENAME COLUMN UNITPRICE TO LISTPRICE;

-- Add columns to PRODUCT table
ALTER TABLE PRODUCT
ADD COLUMN IF NOT EXISTS
    UNITCOST FLOAT,
    DISCONTINUED VARCHAR(3),
    CATEGORYNAME VARCHAR(15),
    SUPPLIER VARCHAR(30);

-- Update data in PRODUCT table from temp_product
UPDATE PRODUCT
SET
    PRODUCT.PRODUCTNAME = temp_product.PRODUCTNAME,
    PRODUCT.UNITCOST = temp_product.UNITCOST,
    PRODUCT.DISCONTINUED = temp_product.DISCONTINUED,
    PRODUCT.CATEGORYNAME = temp_product.CATEGORYNAME,
    PRODUCT.SUPPLIER = temp_product.SUPPLIER
FROM
    temp_product
WHERE
    PRODUCT.PRODUCTID = temp_product.PRODUCTID;
