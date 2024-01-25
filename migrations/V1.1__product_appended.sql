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

INSERT INTO temp_product
SELECT
    "Product ID" AS PRODUCTID,
    "Product Name" AS PRODUCTNAME,
    LISTPRICE,
    UNITCOST,
    DISCONTINUED,
    CATEGORYNAME,
    SUPPLIER
FROM
    CURRENT_DIRECTORY() || 'product_fresh.csv';

ALTER TABLE PRODUCT
DROP COLUMN IF EXISTS
    SUPPLIERID,
    CATEGORYID,
    QUANTITYPERUNIT;

ALTER TABLE PRODUCT
RENAME COLUMN UNITPRICE TO LISTPRICE;

ALTER TABLE PRODUCT
ADD COLUMN IF NOT EXISTS
    UNITCOST FLOAT,
    DISCONTINUED VARCHAR(3),
    CATEGORYNAME VARCHAR(15),
    SUPPLIER VARCHAR(30);

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
