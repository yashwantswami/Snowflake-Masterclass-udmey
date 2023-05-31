--- Assignment ---

Create a materialized view called PARTS in the database DEMO_DB from the following statement:

SELECT 
AVG(PS_SUPPLYCOST) as PS_SUPPLYCOST_AVG,
AVG(PS_AVAILQTY) as PS_AVAILQTY_AVG,
MAX(PS_COMMENT) as PS_COMMENT_MAX
FROM"SNOWFLAKE_SAMPLE_DATA"."TPCH_SF100"."PARTSUPP"
Execute the SELECT before creating the materialized view and note down the time until the query is executed.


1.How long did the SELECT statement take initially?
It is probably around 5s - 15s when you execute the select statement for the first time.
Solution:

USE ROLE ACCOUNTADMIN;
USE DEMO_DB;

CREATE OR REPLACE MATERIALIZED VIEW PARTS AS
SELECT
AVG(PS_SUPPLYCOST) as PS_SUPPLYCOST_AVG,
AVG(PS_AVAILQTY) as PS_AVAILQTY_AVG,
MAX(PS_COMMENT) as PS_COMMENT_MAX
FROM"SNOWFLAKE_SAMPLE_DATA"."TPCH_SF100"."PARTSUPP";


2.How long did the execution of the materialized view take?
It should be much faster now. Probably less than 1s.