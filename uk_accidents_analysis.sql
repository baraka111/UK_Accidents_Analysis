##########
### EXPLORATORY DATA ANALYSIS ###
## Get an overview of the data
SELECT 
    *
FROM
    accidents.accidents_2015;
    
## No. of rows ##
SELECT COUNT(*) FROM accidents.accidents_2015;

## Accident severity level ##
SELECT MAX(Accident_Severity) FROM accidents.accidents_2015 as maximum;
SELECT MIN(Accident_Severity) FROM accidents.accidents_2015 as minimum;

## Accident severity frequency ##
SELECT COUNT(*) FROM accidents.accidents_2015 as level_3 WHERE Accident_Severity = 3;
SELECT COUNT(*) FROM accidents.accidents_2015 as level_2 WHERE Accident_Severity = 2;
SELECT COUNT(*) FROM accidents.accidents_2015 as level_1 WHERE Accident_Severity = 1;