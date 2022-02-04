/* Assigment 1
Class: IS362
Name: Vladimir nunez

Q1. How many airplanes have listed speeds? What is the
minimum listed speed and the maximum listed speed?  */

 -- airplanes with liste speed SQL statement
 -- Answer: 23
 SELECT 
		COUNT(*)
		FROM planes
		where speed > 0;
        
-- Minimum listed Speed SQL statement
-- Answer: 90
SELECT
		MIN(speed)
        FROM planes;
        
-- Maximum listed Speed SQL statement
-- Answer: 432

SELECT 
	MAX(speed)
	FROM planes;


/* Q2. What is the total distance flown by all of the planes in
January 2013? What is the total distance flown by all of
the planes in January 2013 where the tailnum is
missing? */

-- Total dist flown by all planes in January 2013 SQL Statement
-- Answer: 27,188,805

SELECT
    SUM(distance) AS 'Total Distance'
    FROM flights
	WHERE (
		year = 2013
		AND month = 1);
        
-- Total dist flown by all planes in January 2013 where the tailnum is missing SQL statement
-- Answer: 0

SELECT
    SUM(distance) AS 'Total NULL Distance'
    FROM flights  
	WHERE (
		year = 2013
		AND month = 1
		AND tailnum is null);
        
        
	/*
	Q3. What is the total distance flown for all planes on July 5,
	2013 grouped by aircraft manufacturer? Write this
	statement first using an INNER JOIN, then using a LEFT
	OUTER JOIN. How do your results compare? */
    
    -- Inner joint SQL statemnt
    
    SELECT 
        planes.manufacturer,
        SUM(distance) AS 'SUM(distance)'
	FROM flights
	INNER JOIN planes
		ON flights.tailnum = planes.tailnum
		WHERE (
			flights.year = 2013 
            AND flights.month = 7
            AND flights.day = 5)
		GROUP BY manufacturer;
			
     -- Outer joint SQL statement
     
     SELECT 
        planes.manufacturer,
        SUM(distance) AS 'SUM(distance)'
	FROM flights
	LEFT OUTER JOIN planes
		ON flights.tailnum = planes.tailnum
		WHERE (
			flights.year = 2013 
            AND flights.month = 7
            AND flights.day = 5)
		GROUP BY manufacturer;
        
        /* comparing inner join and left join:
        inner join return records in both side whereas left join return records with null */
        
        
        