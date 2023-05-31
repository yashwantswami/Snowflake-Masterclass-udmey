//   Start Assignment 1: Time travel 


How did you do it? Feel free to share the code or your experience.

Solution:

1. Create exercise table

-- Switch to role of accountadmin --
 
USE ROLE ACCOUNTDMIN;
USE DATABASE DEMO_DB;
USE WAREHOUSE COMPUTE_WH;
 
CREATE OR REPLACE TABLE DEMO_DB.PUBLIC.PART
AS
SELECT * FROM "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."PART";
 
SELECT * FROM PART
ORDER BY P_MFGR DESC;


2. Update the table

UPDATE DEMO_DB.PUBLIC.PART
SET P_MFGR='Manufacturer#CompanyX'
WHERE P_MFGR='Manufacturer#5';
 
----> Note down query id here:
 
SELECT * FROM PART
ORDER BY P_MFGR DESC;

-- Step 3.1: Travel back using the offset until you get the result of before the update

SELECT * FROM PART at (OFFSET => -60*1.5) ORDER BY P_MFGR DESC;


-- Step 3.2: Travel back using the query id to get the result before the update

SELECT * FROM PART before (statement => 'your-query-id');
 