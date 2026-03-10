##########
### EXPLORATORY DATA ANALYSIS ###
## Get an overview of the data
SELECT * FROM accidents.accidents_2015;
DESCRIBE accidents_2015;
    
## No. of rows ##
SELECT COUNT(*) FROM accidents.accidents_2015;

##Check for null values
SELECT * FROM accidents.accidents_2015 HAVING NULL;

##Check for duplicates
SELECT COUNT(DISTINCT Accident_Index) FROM accidents.accidents_2015;

##Find the different accident severity levels
SELECT DISTINCT(Accident_Severity) FROM accidents.accidents_2015;

##Find the number of accidents for the different severity levels
SELECT COUNT(*) FROM accidents.accidents_2015 as level_3 WHERE Accident_Severity = 3;
SELECT COUNT(*) FROM accidents.accidents_2015 as level_2 WHERE Accident_Severity = 2;
SELECT COUNT(*) FROM accidents.accidents_2015 as level_1 WHERE Accident_Severity = 1;

##Total number of casualities
SELECT SUM(Number_of_Casualties) FROM accidents.accidents_2015;

##Find the maximum, minimum and total number of casualties according to accident severity
SELECT MAX(Number_of_Casualties) FROM accidents.accidents_2015 WHERE Accident_Severity = 3;
SELECT MIN(Number_of_Casualties) FROM accidents.accidents_2015 WHERE Accident_Severity = 3;
SELECT SUM(Number_of_Casualties) FROM accidents.accidents_2015 WHERE Accident_Severity = 3;

SELECT MAX(Number_of_Casualties) FROM accidents.accidents_2015 WHERE Accident_Severity = 2;
SELECT MIN(Number_of_Casualties) FROM accidents.accidents_2015 WHERE Accident_Severity = 2;
SELECT SUM(Number_of_Casualties) FROM accidents.accidents_2015 WHERE Accident_Severity = 2;

SELECT MAX(Number_of_Casualties) FROM accidents.accidents_2015 WHERE Accident_Severity = 1;
SELECT MIN(Number_of_Casualties) FROM accidents.accidents_2015 WHERE Accident_Severity = 3;
SELECT SUM(Number_of_Casualties) FROM accidents.accidents_2015 WHERE Accident_Severity = 1;

## Convert the date column from text to datetime format
UPDATE accidents_2015
SET Date= str_to_date(Date, '%d/%m/%Y');
ALTER TABLE accidents_2015
MODIFY Date DATE;
DESCRIBE accidents_2015;

##Create a column for months
ALTER TABLE accidents_2015
ADD Month_name TEXT AFTER Day_of_Week;

##Input the corresponding month names
UPDATE accidents_2015
SET Month_name = monthname(Date);
SELECT COUNT(DISTINCT(Month_name)) FROM accidents.accidents_2015; 

##Find the number of accidents for each month
SELECT Month_name ,COUNT(Accident_Severity) FROM accidents.accidents_2015
GROUP BY Month_name;

## Convert the Time column to time format
ALTER TABLE accidents_2015
MODIFY Time TIME;

##Create a column for the hour of the day
ALTER TABLE accidents_2015
ADD Hour INT AFTER Time;

##Input the corresponding hours from the Time column
UPDATE accidents_2015
SET Hour= hour(Time);

##Investigate the various road surface conditions and the number of accidents for each
SELECT DISTINCT Road_Surface_Conditions FROM accidents.accidents_2015;

SELECT Road_Surface_Conditions, COUNT(Accident_Severity) FROM accidents.accidents_2015
GROUP BY Road_Surface_Conditions;

##Investigate the various weather conditions levels and how they affect the number of accidents
SELECT DISTINCT Weather_Conditions FROM accidents.accidents_2015
ORDER BY Weather_Conditions ASC;

SELECT Weather_Conditions, COUNT(Accident_Severity) FROM accidents.accidents_2015
GROUP BY Weather_Conditions;

##Investigate the speed limits and how each accounts for the number of accidents
SELECT DISTINCT Speed_limit FROM accidents.accidents_2015
ORDER BY Speed_limit ASC;

SELECT Speed_limit, COUNT(Accident_Severity) FROM accidents.accidents_2015
GROUP BY Speed_limit;

##Create a new table with the fields of interest used in analysis
CREATE TABLE accidents_new AS 
SELECT Accident_Index, Longitude, Latitude, Accident_Severity, Number_of_Vehicles,
Number_of_Casualties, Date, Day_of_Week, Month_name, Time, Hour, Weather_Conditions,
Road_Surface_Conditions, Speed_limit FROM accidents.accidents_2015;


