-- Creating tables:
CREATE OR REPLACE EXTERNAL TABLE `awesome-treat-447716-e5.module3.ext_yellow_tripdata_parquet`
OPTIONS(
  FORMAT = 'parquet',
  uris = ['gs://awesome-treat-447716-e5-bucket/yellow_tripdata_2024-*.parquet']
);

CREATE OR REPLACE TABLE `awesome-treat-447716-e5.module3.yellow_tripdata_parquet` AS
SELECT * FROM `module3.ext_yellow_tripdata_parquet`;

-- Question 1
SELECT COUNT(*) AS Records
FROM `module3.yellow_tripdata_parquet`;

-- Question 2
SELECT COUNT(DISTINCT(PULocationID)) AS `Number of PU Location IDs in Ext Table`
FROM `module3.ext_yellow_tripdata_parquet`;

SELECT COUNT(DISTINCT(PULocationID)) AS `Number of PU Location IDs in Normal Table`
FROM `module3.yellow_tripdata_parquet`;

-- Question 3
SELECT PULocationID
FROM `module3.yellow_tripdata_parquet`;

SELECT PULocationID, DOLocationID
FROM `module3.yellow_tripdata_parquet`;

-- Question 4
SELECT COUNT(1)
FROM `module3.yellow_tripdata_parquet`
WHERE fare_amount = 0;

-- Question 5
CREATE OR REPLACE TABLE `module3.yellow_td_parquet_part_clust`
PARTITION BY DATE(tpep_dropoff_datetime)
CLUSTER BY VendorID
AS SELECT * FROM `module3.ext_yellow_tripdata_parquet`;

-- Question 6
SELECT DISTINCT(VendorID)
FROM `module3.yellow_tripdata_parquet`
WHERE tpep_dropoff_datetime BETWEEN '2024-03-01' AND '2024-03-15'; --310MB

SELECT DISTINCT(VendorID)
FROM `module3.yellow_td_parquet_part_clust`
WHERE tpep_dropoff_datetime BETWEEN '2024-03-01' AND '2024-03-15'; --26.84MB

-- Question 9
SELECT COUNT(*)
FROM `module3.yellow_tripdata_parquet`; --0MB
/* This happens because BigQuery stores the precomputed count from the materialized table, and as there were no changes to the table, it can easily return this count without having to scan the entire table again.
*/