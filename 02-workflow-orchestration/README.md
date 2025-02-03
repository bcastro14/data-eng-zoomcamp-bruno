# Homework answers and code

### Q1
Result is obtained by running the flow for the specified date and taxi data, or by checking the data lake (GCP bucket) where the CSVs were saved.

### Q2
The rendered value replaces the placeholders with the actual values.

### Q3
```
SELECT COUNT(*)
FROM `awesome-treat-447716-e5.de_zoomcamp.yellow_tripdata` as y
WHERE y.filename LIKE 'yellow_tripdata_2020-%.csv'
```

### Q4
```
SELECT COUNT(*)
FROM `awesome-treat-447716-e5.de_zoomcamp.green_tripdata` as g
WHERE g.filename LIKE 'green_tripdata_2020-%.csv'
```

### Q5
Can be found by checking the corresponding table that was created in Big Query by Kestra, for the year 2021 and Month 03.

### Q6
Can be found in the documentation: https://kestra.io/docs/workflow-components/triggers/schedule-trigger