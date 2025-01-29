# Homework code

### Q1
Run `docker run -it --entrypoint=bash python:3.12.8`

Then, once the container loads: `pip --version`


### Q2
Solution under '01-homework' subfolder.


### Q3
During the period of October 1st 2019 (inclusive) and November 1st 2019 (exclusive), how many trips, respectively, happened:

1. Up to 1 mile
```
SELECT COUNT(*)
FROM green_taxi_data as g
WHERE DATE(g.lpep_pickup_datetime) >= '2019-10-01' AND
	DATE(g.lpep_dropoff_datetime) < '2019-11-01' AND
	g.trip_distance <= 1;
```

2. In between 1 (exclusive) and 3 miles (inclusive)
```
SELECT COUNT(*)
FROM green_taxi_data as g
WHERE DATE(g.lpep_pickup_datetime) >= '2019-10-01' AND
	DATE(g.lpep_dropoff_datetime) < '2019-11-01' AND
	g.trip_distance > 1 AND g.trip_distance <= 3;
```

3. In between 3 (exclusive) and 7 miles (inclusive)
```
SELECT COUNT(*)
FROM green_taxi_data as g
WHERE DATE(g.lpep_pickup_datetime) >= '2019-10-01' AND
	DATE(g.lpep_dropoff_datetime) < '2019-11-01' AND
	g.trip_distance > 3 AND g.trip_distance <= 7;
```

4. In between 7 (exclusive) and 10 miles (inclusive)
```
SELECT COUNT(*)
FROM green_taxi_data as g
WHERE DATE(g.lpep_pickup_datetime) >= '2019-10-01' AND
	DATE(g.lpep_dropoff_datetime) < '2019-11-01' AND
	g.trip_distance > 7 AND g.trip_distance <= 10;
```

5. Over 10 miles
```
SELECT COUNT(*)
FROM green_taxi_data as g
WHERE DATE(g.lpep_pickup_datetime) >= '2019-10-01' AND
	DATE(g.lpep_dropoff_datetime) < '2019-11-01' AND
	g.trip_distance > 10;
```


### Q4
Which was the pick up day with the longest trip distance? Use the pick up time for your calculations.

```
SELECT DATE(g.lpep_pickup_datetime)
FROM green_taxi_data as g
WHERE g.trip_distance = 
	(SELECT MAX(g1.trip_distance) FROM green_taxi_data as g1)
```


### Q5
Which were the top pickup locations with over 13,000 in total_amount (across all trips) for 2019-10-18?
Consider only lpep_pickup_datetime when filtering by date.

```
SELECT z."Zone"
FROM green_taxi_data as g JOIN taxi_zone as z
ON z."LocationID" = g."PULocationID"
WHERE DATE(g.lpep_pickup_datetime) = '2019-10-18'
GROUP BY z."Zone" HAVING (
	SUM(g.total_amount) > 13000
)
ORDER BY SUM(g.total_amount) DESC
LIMIT 3
```


### Q6
For the passengers picked up in October 2019 in the zone named "East Harlem North" which was the drop off zone that had the largest tip?
```
SELECT z2."Zone"
FROM green_taxi_data as g JOIN taxi_zone as z1
ON z1."LocationID" = g."PULocationID" JOIN taxi_zone as z2
	ON z2."LocationID" = g."DOLocationID"
WHERE 
	z1."Zone" = 'East Harlem North' AND
	EXTRACT(MONTH FROM g.lpep_pickup_datetime) = 10 AND
	EXTRACT(YEAR FROM g.lpep_pickup_datetime) = 2019
ORDER BY g.tip_amount DESC
LIMIT 1
```

### Q7
Code for testing commands in folder '01-homework-terraform'