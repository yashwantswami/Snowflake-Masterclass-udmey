
CREATE OR REPLACE NOTIFICATION INTEGRATION snowpipe_event
  ENABLED = true
  TYPE = QUEUE
  NOTIFICATION_PROVIDER = AZURE_STORAGE_QUEUE
  AZURE_STORAGE_QUEUE_PRIMARY_URI = 'https://<your-container-url>'
  AZURE_TENANT_ID = '<your-tenant-id>';
  
  
  -- Register Integration
  
  DESC notification integration snowpipe_event;
  S
  
  