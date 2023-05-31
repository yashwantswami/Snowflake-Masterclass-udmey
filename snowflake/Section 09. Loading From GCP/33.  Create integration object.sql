-- create integration object that contains the access information
CREATE STORAGE INTEGRATION gcp_integration
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = GCS
  ENABLED = TRUE
  STORAGE_ALLOWED_LOCATIONS = ('gcs://bucket/path/file', 'gcs://bucket/path2/file2');
  
  --- With Path ---
  STORAGE_ALLOWED_LOCATIONS = ('gcs://snowflakebucketgcp', 'gcs://snowflakebucketgcpjson');

  
-- Describe integration object to provide access
DESC STORAGE integration gcp_integration;
