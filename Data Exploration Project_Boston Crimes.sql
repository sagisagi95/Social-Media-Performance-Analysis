/*
Data Exploration in Boston_Crimes dataset: 
This dataset contains basic information about the crime instances that occurred during 2015-2018 in Boston. However, only data from Jan to Sep 2018 was filtered for analysis in this project.

Skills used: Converting Data Types, Windows Functions, Aggregate Functions, Joins, CTE's, Temp Tables

*/

-- Select data that we are going to explore

CREATE TABLE crimes_in_2018 AS
(
Select *
From boston_crimes.crime
Where YEAR = 2018
);

-- Clean missing data and null value, delete unused column

ALTER TABLE boston_crimes.crimes_in_2018
DROP COLUMN OFFENSE_DESCRIPTION;

ALTER TABLE boston_crimes.crimes_in_2018
DROP COLUMN SHOOTING;

Delete From boston_crimes.crimes_in_2018
Where INCIDENT_NUMBER IS NULL OR OFFENSE_CODE IS NULL OR LENGTH(DISTRICT) < 2;


-- List all the crimes committed in Boston in 2018, in alphabetical order

Select Distinct OFFENSE_CODE_GROUP
From boston_crimes.crimes_in_2018
Order by OFFENSE_CODE_GROUP ASC;


-- Standardize Date Format in MONTH column

ALTER TABLE boston_crimes.crimes_in_2018
ADD Month_Converted TEXT;

UPDATE boston_crimes.crimes_in_2018
SET Month_Converted =
  DATE_FORMAT(STR_TO_DATE(CONCAT(Month, '-01-2018'), '%m-%d-%Y'), '%b');


-- List the number of crimes committed in 2018 and grouped by crime types? And the detailed description for each type of crime
-- Description of crime/incident can be determined by NAME in the Offense_codes table

Select c.OFFENSE_CODE_GROUP, c.OFFENSE_CODE, o.NAME as CRIME_DESCRIPTION, COUNT(INCIDENT_NUMBER) as num_of_crimes
From boston_crimes.crimes_in_2018 c
	Join boston_crimes.offense_codes o on o.CODE = c.OFFENSE_CODE
Group by 1,2,3
Order by num_of_crimes DESC
;


-- Which district has the highest total number of incidents in 2018?

Select Distinct DISTRICT, COUNT(INCIDENT_NUMBER) as num_of_crimes
From boston_crimes.crimes_in_2018 
Group by 1
Order by num_of_crimes DESC
Limit 1;


-- Which month has the highest number of crimes in 2018? 

Select Month_Converted, COUNT(INCIDENT_NUMBER) AS num_of_crimes
From boston_crimes.crimes_in_2018
Group by 1
Order by num_of_crimes DESC
Limit 1;

-- Which crime type has the highest number of incidents in May 2018?

With t as
(
Select Distinct OFFENSE_CODE, OFFENSE_CODE_GROUP, COUNT(INCIDENT_NUMBER) as num_of_crimes
From boston_crimes.crimes_in_2018 
Where MONTH = 5
Group by 2,1
)
	Select Distinct t.OFFENSE_CODE, t.OFFENSE_CODE_GROUP, o.NAME as CRIME_DESCRIPTION, t.num_of_crimes
	From t
	Join boston_crimes.offense_codes o on o.CODE = t.OFFENSE_CODE
    Where t.num_of_crimes = (Select MAX(num_of_crimes) From t);
    
    
-- What type(s) of crimes/incidents has(have) occurred more than 20 times in July of 2018? 
-- Types of crime/incident can be determined by OFFENSE_CODE_GROUP

Select Distinct OFFENSE_CODE, OFFENSE_CODE_GROUP, COUNT(OFFENSE_CODE) AS occur_times
From boston_crimes.crimes_in_2018
Where Month = 7
Group by OFFENSE_CODE, OFFENSE_CODE_GROUP
Having COUNT(OFFENSE_CODE) > 20
Order by 3 DESC;


-- How many districts have occurred robbery?

Select COUNT(Distinct DISTRICT) AS num_of_district
From boston_crimes.crimes_in_2018
Where OFFENSE_CODE_GROUP LIKE "%robbery%" ;


-- In which district are robberies most likely to occur?

Select DISTRICT, COUNT(INCIDENT_NUMBER) as num_of_robbery
From boston_crimes.crimes_in_2018
Where OFFENSE_CODE_GROUP LIKE "%robbery%"
Group by DISTRICT
Order by num_of_robbery DESC
Limit 1;


-- What hour in a day has the highest number of crime incidents?

Select HOUR, COUNT(INCIDENT_NUMBER) AS num_of_incidents
From boston_crimes.crimes_in_2018
Group by HOUR
Order by 2 DESC
Limit 1;


-- Which types of crime/incident is most likely to happen on Washington ST? 

Select OFFENSE_CODE_GROUP, COUNT(INCIDENT_NUMBER) AS num_of_incidents
From boston_crimes.crimes_in_2018
Where STREET LIKE "%washington%"
Group by 1
Order by 2 DESC;


-- What is the difference between the number of incidents that occurred in 18:00 and the number of incidents that occurred in 6:00?

With cte as
	(
	Select HOUR, COUNT(INCIDENT_NUMBER) AS num_of_incidents
	From boston_crimes.crimes_in_2018
	Group by HOUR
	)
Select ((Select num_of_incidents From cte Where HOUR = 18) - (Select num_of_incidents From cte Where HOUR = 6))
	as diff_between_18h_and_6h
    ;

-- How many instances of larceny had been reported in the hour that has the most number of crimes/incidents?

Select COUNT(INCIDENT_NUMBER) AS instances_of_larceny
From boston_crimes.crimes_in_2018 c
	JOIN 
		(Select HOUR, COUNT(INCIDENT_NUMBER) AS num_of_incidents
		From boston_crimes.crimes_in_2018
		Group by HOUR
		Order by num_of_incidents DESC
		Limit 1) t 
	ON t.HOUR = c.HOUR
Where OFFENSE_CODE_GROUP LIKE "%larceny%" ;


-- How many PART ONE crimes occurred in district A1? Use "UCR_PART" to find PART ONE crimes.

Select COUNT(INCIDENT_NUMBER) AS num_of_part_one_crimes
From boston_crimes.crimes_in_2018
Where DISTRICT = "A1" AND UCR_PART = "Part One" ;


-- What is the difference between the number of Motor Vehicle Accidents (MVAs) occurred on Monday and the number of MVAs occurred on Thursday? 

With cte as
	(Select DAY_OF_WEEK, COUNT(INCIDENT_NUMBER) AS num_of_incidents
	From boston_crimes.crimes_in_2018
	Where OFFENSE_CODE_GROUP LIKE "%vehicle accident%"
	Group by 1)
Select (
	(Select num_of_incidents From cte Where DAY_OF_WEEK = "Monday") - (Select num_of_incidents From cte Where DAY_OF_WEEK = "Thursday")
	) as diff_MVAs_between_Mon_and_Thu ;


-- Which day of week has the most number of crimes/incidents in 17:00? Report the day of week together with number of crimes.

Select DAY_OF_WEEK, COUNT(INCIDENT_NUMBER) AS num_of_incidents
From boston_crimes.crimes_in_2018
Where HOUR = 17
Group by 1
Order by 2 DESC
Limit 1;


-- List top 3 streets with the most number of crimes that occurred on Wednesday

Select Distinct STREET, COUNT(INCIDENT_NUMBER) AS num_of_crimes
From boston_crimes.crimes_in_2018
Where DAY_OF_WEEK = "Wednesday"
Group by 1
Order by 2 DESC
Limit 3;
