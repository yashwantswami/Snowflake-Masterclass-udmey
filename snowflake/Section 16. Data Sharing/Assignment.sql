--- Assignment ---

// Assume we want to create a share from the database CUSTOMER_DB and share the table CUSTOMERS.

Database: CUSTOMER_DB
Schema: PUBLIC
Table: CUSTOMERS
Provider account: asd163257
Consumer account: sdw135733

Questions for this assignment
Solution :
1. How can we create a share object called CUSTOMER_SHARE and grant sufficient grant privileges (provide sql commands)?

create share CUSTOMER_SHARE;
grant usage on database CUSTOMER_DB to share CUSTOMER_SHARE;
grant usage on schema CUSTOMER_DB.PUBLIC to share CUSTOMER_SHARE;
grant select on table CUSTOMER_DB.PUBLIC.CUSTOMERS to share CUSTOMER_SHARE;

2.How can we add the consumer account (provide sql commands)?

alter share CUSTOMER_SHARE add accounts=sdw135733;