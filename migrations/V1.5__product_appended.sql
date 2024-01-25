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
    'Product ID' AS PRODUCTID,
    'Product Name' AS PRODUCTNAME,
    'ListPrice' AS LISTPRICE,
    'UnitCost' AS UNITCOST,
    'Discontinued' AS DISCONTINUED,
    'CategoryName' AS CATEGORYNAME,
    'Supplier' AS SUPPLIER
FROM @~/migrations/product_fresh.csv;


-- Drop columns from PRODUCT table
ALTER TABLE PRODUCT
DROP COLUMN IF EXISTS
    SUPPLIERID,
    CATEGORYID,
    QUANTITYPERUNIT,
    UNITSINSTOCK,
    UNITSONORDER,
    REORDERLEVEL,
    DISCONTINUED;

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
    PRODUCTNAME = temp_product.PRODUCTNAME,
    UNITCOST = temp_product.UNITCOST,
    DISCONTINUED = temp_product.DISCONTINUED,
    CATEGORYNAME = temp_product.CATEGORYNAME,
    SUPPLIER = temp_product.SUPPLIER
FROM
    temp_product
WHERE
    PRODUCT.PRODUCTID = temp_product.PRODUCTID
    AND (
        PRODUCT.UNITCOST IS NULL
        OR PRODUCT.DISCONTINUED IS NULL
        OR PRODUCT.CATEGORYNAME IS NULL
        OR PRODUCT.SUPPLIER IS NULL
    );


--INSERT INTO PRODUCT(PRODUCTID, UNITCOST, DISCONTINUED, CATEGORYNAME, SUPPLIER)
--SELECT
--    temp_product.PRODUCTID,temp_product.UNITCOST,temp_product.DISCONTINUED,temp_product.CATEGORYNAME,temp_product.SUPPLIER
--FROM
--    temp_product;