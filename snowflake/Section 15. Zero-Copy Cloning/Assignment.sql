--- Assignment 1: Zero-Copy Cloning ---

-- 1. Create exercise table

-- Switch to role of accountadmin --
 
USE ROLE ACCOUNTDMIN;
USE DATABASE DEMO_DB;
USE WAREHOUSE COMPUTE_WH;
 
CREATE OR REPLACE TABLE DEMO_DB.PUBLIC.SUPPLIER
AS
SELECT * FROM "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."SUPPLIER";


-- 2. Create a clone of that table called SUPPLIER_CLONE



-- 3. Update the clone table and copy the query id

UPDATE SUPPLIER_CLONE
SET S_PHONE='###';
 
--> Query ID:


4. Create another clone from the updated clone using the time travel feature to clone before the update has been executed.

 1. Questions for this assignment
If we delete the source table, does the clone still exist?

--- Solution ---

Yes since it is an independent object.

Solution for first clone:

CREATE TABLE SUPPLIER_CLONE CLONE SUPPLIER;


Solution for second clone:

CREATE TABLE SUPPLIER_CLONE_CLONE CLONE SUPPLIER_CLONE BEFORE (statement => 'your query id');
SELECT * FROM SUPPLIER_CLONE_CLONE



