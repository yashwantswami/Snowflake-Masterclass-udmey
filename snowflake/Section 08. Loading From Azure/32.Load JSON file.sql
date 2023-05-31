--- Load JSON ----
---- Create file format & stage objects ----
 
create or replace file format demo_db.public.fileformat_azure_json
    TYPE = JSON;
  
  
create or replace stage demo_db.public.stage_azure
    STORAGE_INTEGRATION = azure_integration
    URL = 'azure://storageaccountsnow.blob.core.windows.net/snowflakejson'
    FILE_FORMAT = fileformat_azure_json; 
  
LIST  @demo_db.public.stage_azure;

-- Query from stage  
SELECT * FROM @demo_db.public.stage_azure;  


-- Query one attribute/column
SELECT $1:"Car Model" FROM @demo_db.public.stage_azure; 
  
-- Convert data type  
SELECT $1:"Car Model"::STRING FROM @demo_db.public.stage_azure; 

-- Query all attributes  
SELECT 
$1:"Car Model"::STRING, 
$1:"Car Model Year"::INT,
$1:"car make"::STRING, 
$1:"first_name"::STRING,
$1:"last_name"::STRING
FROM @demo_db.public.stage_azure;   
  
-- Query all attributes and use aliases 
SELECT 
$1:"Car Model"::STRING as car_model, 
$1:"Car Model Year"::INT as car_model_year,
$1:"car make"::STRING as "car make", 
$1:"first_name"::STRING as first_name,
$1:"last_name"::STRING as last_name
FROM @demo_db.public.stage_azure;     


Create or replace table car_owner (
    car_model varchar, 
    car_model_year int,
    car_make varchar, 
    first_name varchar,
    last_name varchar)
 
COPY INTO car_owner
FROM
(SELECT 
$1:"Car Model"::STRING as car_model, 
$1:"Car Model Year"::INT as car_model_year,
$1:"car make"::STRING as "car make", 
$1:"first_name"::STRING as first_name,
$1:"last_name"::STRING as last_name
FROM @demo_db.public.stage_azure);

SELECT * FROM CAR_OWNER;


-- Alternative: Using a raw file table step
-- car_owner table is already Created above  --
--- if table is already created then turncate it ---
truncate table car_owner;
select * from car_owner;

---  First load the data into a raw file table of the datatype variant,it store raw data into table having one column datatype variant ---
create or replace table car_owner_raw (
  raw variant);

--- Copy raw data type varient into car_owner_raw table 
COPY INTO car_owner_raw
FROM @demo_db.public.stage_azure;

SELECT * FROM car_owner_raw;

--- Transform the Raw data type varient column with multiple column and insert them into table --- 
INSERT INTO car_owner  
(SELECT 
$1:"Car Model"::STRING as car_model, 
$1:"Car Model Year"::INT as car_model_year,
$1:"car make"::STRING as car_make, 
$1:"first_name"::STRING as first_name,
$1:"last_name"::STRING as last_name
FROM car_owner_raw)  
  
  
select * from car_owner;
  