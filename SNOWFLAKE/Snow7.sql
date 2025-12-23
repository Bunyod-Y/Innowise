USE DATABASE TASTY_BYTES_SAMPLE_DATA
USE SCHEMA RAW_POS

SELECT
    t.*,
    f.first_name AS franchisee_first_name,
    f.last_name AS franchisee_last_name
FROM tasty_bytes_sample_data.raw_pos.truck t
JOIN tasty_bytes_sample_data.raw_pos.franchise f
    ON t.franchise_id = f.franchise_id;

select * from tasty_bytes_sample_data.public.