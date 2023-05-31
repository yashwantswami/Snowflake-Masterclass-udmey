// Cloning Schema
CREATE TRANSIENT SCHEMA OUR_FIRST_DB.COPIED_SCHEMA
CLONE OUR_FIRST_DB.PUBLIC;

SELECT * FROM COPIED_SCHEMA.CUSTOMERS;


CREATE TRANSIENT SCHEMA OUR_FIRST_DB.EXTERNAL_STAGES_COPIED
CLONE MANAGE_DB.EXTERNAL_STAGES;



// Cloning Database
CREATE TRANSIENT DATABASE OUR_FIRST_DB_COPY
CLONE OUR_FIRST_DB;

DROP DATABASE OUR_FIRST_DB_COPY;
DROP SCHEMA OUR_FIRST_DB.EXTERNAL_STAGES_COPIED;
DROP SCHEMA OUR_FIRST_DB.COPIED_SCHEMA;