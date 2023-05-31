-- 1. To be able to create the virtual warehouse, you have to use at least the role SYSADMIN (or SECURITYADMIN or ACCOUNTADMIN).

USE ROLE SYSADMIN;


-- 2. Set up a virtual warehouse using SQL command:

CREATE WAREHOUSE EXERCISE_WH
WAREHOUSE_SIZE = XSMALL
AUTO_SUSPEND = 600  -- automatically suspend the virtual warehouse after 10 minutes of not being used
AUTO_RESUME = TRUE 
COMMENT = 'This is a virtual warehouse of size X-SMALL that can be used to process queries.';


-- 3. Drop the virtual warehouse

DROP WAREHOUSE EXERCISE_WH;



