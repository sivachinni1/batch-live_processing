-- SQL Script to Load and Unload Data from AWS to Snowflake

USE ROLE accountadmin;

USE WAREHOUSE compute_wh;

CREATE OR REPLACE DATABASE Name;

CREATE TABLE table_name(
Column varchar(80)
);

SELECT * FROM table_name

CREATE STORAGE INTEGRATION s1
    TYPE = EXTERNAL_STAGE
    STORAGE_PROVIDER = 's1'
    STORAGE_AWS_ROLE_ARN = 'paste the link of the aws role arn'
    ENABLED = TRUE 
    STORAGE_ALLOWED_LOCATIONS = ('location of the file in s3 bucket')

DESCRIBE INTEGRATION s1

SHOW STORAGE INTEGRATIONS;


CREATE STAGE s1_table_name_notheader
URL = 'location of the file in s3 bucket'
STORAGE_INTEGRATION = s1
FILE_FORMAT = (TYPE='CSV')

SHOW STAGES 

COPY INTO table_name
FROM @s1_table_name_notheader
