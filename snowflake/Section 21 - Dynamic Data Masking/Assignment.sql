--- Assignment ---

1. Prepare the table and two roles to test the masking policies (you can use the statement below)

USE DEMO_DB;
USE ROLE ACCOUNTADMIN;
 
-- Prepare table --
create or replace table customers(
  id number,
  full_name varchar, 
  email varchar,
  phone varchar,
  spent number,
  create_date DATE DEFAULT CURRENT_DATE);
 
 
-- insert values in table --
insert into customers (id, full_name, email,phone,spent)
values
  (1,'Lewiss MacDwyer','lmacdwyer0@un.org','262-665-9168',140),
  (2,'Ty Pettingall','tpettingall1@mayoclinic.com','734-987-7120',254),
  (3,'Marlee Spadazzi','mspadazzi2@txnews.com','867-946-3659',120),
  (4,'Heywood Tearney','htearney3@patch.com','563-853-8192',1230),
  (5,'Odilia Seti','oseti4@globo.com','730-451-8637',143),
  (6,'Meggie Washtell','mwashtell5@rediff.com','568-896-6138',600);
 
 
-- set up roles
CREATE OR REPLACE ROLE ANALYST_MASKED;
CREATE OR REPLACE ROLE ANALYST_FULL;
 
-- grant select on table to roles
GRANT SELECT ON TABLE DEMO_DB.PUBLIC.CUSTOMERS TO ROLE ANALYST_MASKED;
GRANT SELECT ON TABLE DEMO_DB.PUBLIC.CUSTOMERS TO ROLE ANALYST_FULL;
 
GRANT USAGE ON SCHEMA DEMO_DB.PUBLIC TO ROLE ANALYST_MASKED;
GRANT USAGE ON SCHEMA DEMO_DB.PUBLIC TO ROLE ANALYST_FULL;
 
-- grant warehouse access to roles
GRANT USAGE ON WAREHOUSE COMPUTE_WH TO ROLE ANALYST_MASKED;
GRANT USAGE ON WAREHOUSE COMPUTE_WH TO ROLE ANALYST_FULL;
 
-- assign roles to a user
GRANT ROLE ANALYST_MASKED TO USER <YOUR-USER-NAME>;
GRANT ROLE ANALYST_FULL TO USER <YOUR-USER-NAME>;



Questions for this assignment

Solution:

-- 2. Create masking policy called name that is showing '***' instead of the original varchar value

create or replace masking policy name 
    as (val varchar) returns varchar ->
            case        
            when current_role() in ('ANALYST_FULL') then val
            else '***'
            end;
        

-- 3. Apply the masking policy on the column full_name    

ALTER TABLE IF EXISTS CUSTOMERS MODIFY COLUMN full_name 
SET MASKING POLICY name;


-- 4. Validating policies

USE ROLE ANALYST_FULL;
SELECT * FROM CUSTOMERS;

USE ROLE ANALYST_MASKED;
SELECT * FROM CUSTOMERS;

-- Unset policy
USE ROLE ACCOUNTADMIN;

ALTER TABLE IF EXISTS CUSTOMERS MODIFY COLUMN full_name
UNSET MASKING POLICY;

-- Validating policies
USE ROLE ANALYST_FULL;
SELECT * FROM CUSTOMERS;

USE ROLE ANALYST_MASKED;
SELECT * FROM CUSTOMERS;



-- 6. Alter the policy so that the last two characters are shown and before that only '***' (example: ***er)
alter masking policy name set body ->
            case
            when current_role() in ('ANALYST_FULL') then val
            else CONCAT('***',RIGHT(val,2))
            end;

-- 7. Apply the masking policy on the column full_name    

ALTER TABLE IF EXISTS CUSTOMERS MODIFY COLUMN full_name 
SET MASKING POLICY name;  

-- Validating policies

USE ROLE ANALYST_FULL;
SELECT * FROM CUSTOMERS;

USE ROLE ANALYST_MASKED;
SELECT * FROM CUSTOMERS;