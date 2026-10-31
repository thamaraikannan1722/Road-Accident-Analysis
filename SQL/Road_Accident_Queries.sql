



select* from road_accident

select SUM(number_of_casualties) as CY_Casualties 
from road_accident
where YEAR(accident_date)='2021'

select SUM(number_of_casualties) as CY_Casualties 
from road_accident
where YEAR(accident_date)='2022' and road_surface_conditions = 'Dry'


select count (distinct accident_index) as CY_Accidents 
from road_accident
where YEAR(accident_date)='2022'

select SUM(number_of_casualties) as CY_Fatal_casulties
from road_accident
where YEAR(accident_date)='2022' and accident_severity = 'Fatal'


select SUM(number_of_casualties) as CY_Fatal_casulties
from road_accident
where accident_severity = 'Fatal'


select SUM(number_of_casualties) as CY_Serious_casulties
from road_accident
where YEAR(accident_date)='2022' and accident_severity = 'Serious'

select SUM(number_of_casualties) as CY_Serious_casulties
from road_accident
where accident_severity = 'serious'


select SUM(number_of_casualties) as CY_Slight_casulties
from road_accident
where YEAR(accident_date)='2022' and accident_severity = 'Slight'


select SUM(number_of_casualties) as CY_Slight_casulties
from road_accident
where  accident_severity = 'Slight'



select SUM(number_of_casualties)/(select sum(number_of_casualties) from road_accident)
from road_accident
where  accident_severity = 'Slight'


select cast(SUM(number_of_casualties)as decimal(10,2))/
(select CAST(sum(number_of_casualties)as decimal(10,2)) from road_accident)
from road_accident where accident_severity = 'slight'

SELECT 
    ((CAST(SUM(number_of_casualties) AS DECIMAL(10,2)) * 100) / 
    (SELECT CAST(SUM(number_of_casualties) AS DECIMAL(10,2)) FROM road_accident)) AS PCT
FROM road_accident 
WHERE accident_severity = 'Slight'

SELECT 
    ((CAST(SUM(number_of_casualties) AS DECIMAL(10,2)) * 100) / 
    (SELECT CAST(SUM(number_of_casualties) AS DECIMAL(10,2)) FROM road_accident)) AS PCT
FROM road_accident 
WHERE accident_severity = 'Serious'


SELECT 
    ((CAST(SUM(number_of_casualties) AS DECIMAL(10,2)) * 100) / 
    (SELECT CAST(SUM(number_of_casualties) AS DECIMAL(10,2)) FROM road_accident)) AS PCT
FROM road_accident 
WHERE accident_severity = 'Fatal'

casualties by vechical type
-----------------------------

SELECT 
    CASE 
        WHEN vehicle_type IN ('Agricultural vehicle') THEN 'Agricultural'
        WHEN vehicle_type IN ('Car', 'Taxi/Private hire car') THEN 'Cars'
        WHEN vehicle_type IN ('Motorcycle 125cc and under', 
                              'Motorcycle 50cc and under', 
                              'Motorcycle over 125cc and up to 500cc', 
                              'Motorcycle over 500cc', 
                              'Pedal cycle') THEN 'Bike'
        WHEN vehicle_type IN ('Bus or coach (17 or more pass seats)', 
                              'Minibus (8 - 16 passenger seats)') THEN 'Bus'
        WHEN vehicle_type IN ('Goods 7.5 tonnes mgw and over', 
                              'Goods over 3.5t. and under 7.5t', 
                              'Van / Goods 3.5 tonnes mgw or under') THEN 'Van'
        ELSE 'Other'
    END AS vehicle_group,
    SUM(number_of_casualties) AS CY_Casualties
FROM road_accident
WHERE YEAR(accident_date) = '2022'
GROUP BY 
    CASE 
        WHEN vehicle_type IN ('Agricultural vehicle') THEN 'Agricultural'
        WHEN vehicle_type IN ('Car', 'Taxi/Private hire car') THEN 'Cars'
        WHEN vehicle_type IN ('Motorcycle 125cc and under', 
                              'Motorcycle 50cc and under', 
                              'Motorcycle over 125cc and up to 500cc', 
                              'Motorcycle over 500cc', 
                              'Pedal cycle') THEN 'Bike'
        WHEN vehicle_type IN ('Bus or coach (17 or more pass seats)', 
                              'Minibus (8 - 16 passenger seats)') THEN 'Bus'
        WHEN vehicle_type IN ('Goods 7.5 tonnes mgw and over', 
                              'Goods over 3.5t. and under 7.5t', 
                              'Van / Goods 3.5 tonnes mgw or under') THEN 'Van'
        ELSE 'Other' end




SELECT 
    CASE 
        WHEN vehicle_type IN ('Agricultural vehicle') THEN 'Agricultural'
        WHEN vehicle_type IN ('Car', 'Taxi/Private hire car') THEN 'Cars'
        WHEN vehicle_type IN ('Motorcycle 125cc and under', 
                              'Motorcycle 50cc and under', 
                              'Motorcycle over 125cc and up to 500cc', 
                              'Motorcycle over 500cc', 
                              'Pedal cycle') THEN 'Bike'
        WHEN vehicle_type IN ('Bus or coach (17 or more pass seats)', 
                              'Minibus (8 - 16 passenger seats)') THEN 'Bus'
        WHEN vehicle_type IN ('Goods 7.5 tonnes mgw and over', 
                              'Goods over 3.5t. and under 7.5t', 
                              'Van / Goods 3.5 tonnes mgw or under') THEN 'Van'
        ELSE 'Other'
    END AS vehicle_group,
    SUM(number_of_casualties) AS CY_Casualties
FROM road_accident
---WHERE YEAR(accident_date) = '2022'
GROUP BY 
    CASE 
        WHEN vehicle_type IN ('Agricultural vehicle') THEN 'Agricultural'
        WHEN vehicle_type IN ('Car', 'Taxi/Private hire car') THEN 'Cars'
        WHEN vehicle_type IN ('Motorcycle 125cc and under', 
                              'Motorcycle 50cc and under', 
                              'Motorcycle over 125cc and up to 500cc', 
                              'Motorcycle over 500cc', 
                              'Pedal cycle') THEN 'Bike'
        WHEN vehicle_type IN ('Bus or coach (17 or more pass seats)', 
                              'Minibus (8 - 16 passenger seats)') THEN 'Bus'
        WHEN vehicle_type IN ('Goods 7.5 tonnes mgw and over', 
                              'Goods over 3.5t. and under 7.5t', 
                              'Van / Goods 3.5 tonnes mgw or under') THEN 'Van'
        ELSE 'Other' end


select * from road_accident

CY Casulties monthly trend
-------------------------------

select DATENAME(month,accident_date) as Month_Name,
SUM(number_of_casualties) as CY_Casulties from road_accident
where YEAR(accident_date) ='2022'
group by DATENAME(month,accident_date)

Road Type
----------

select road_type, SUM(number_of_casualties)as CY_Casualties from road_accident
where year(accident_date)='2022'
group by road_type


urban/rural 
-----------

select urban_or_rural_area,cast( SUM(number_of_casualties)as decimal(10,2))*100/ 
(select sum (number_of_casualties) from road_accident
where YEAR(accident_date)='2022') as PCT from road_accident
where YEAR(accident_date)='2022'
group by urban_or_rural_area



select urban_or_rural_area, SUM(number_of_casualties)as Total_Casualties,
cast(sum (number_of_casualties) as decimal(10,2))*100/
(select cast(sum(number_of_casualties)as decimal (10,2)) from road_accident) as PCT from road_accident
--where YEAR(accident_date)='2022'
group by urban_or_rural_area


Casualties by light condition
------------------------------

SELECT 
    CASE 
        WHEN light_conditions IN ('Daylight') THEN 'Day'
        WHEN light_conditions IN ('Darkness - lighting unknown', 
                                  'Darkness - lights lit', 
                                  'Darkness - lights unlit', 
                                  'Darkness - no lighting') THEN 'Night'
    END AS Light_Condition,
    CAST(CAST(SUM(number_of_casualties) AS DECIMAL(10,2)) * 100 / 
    (SELECT CAST(SUM(number_of_casualties) AS DECIMAL(10,2)) FROM road_accident WHERE YEAR(accident_date) = '2022') AS DECIMAL(10,2)) 
    AS CY_Casualties_PCT
FROM road_accident
WHERE YEAR(accident_date) = '2022'
GROUP BY 
    CASE 
        WHEN light_conditions IN ('Daylight') THEN 'Day'
        WHEN light_conditions IN ('Darkness - lighting unknown', 
                                  'Darkness - lights lit', 
                                  'Darkness - lights unlit', 
                                  'Darkness - no lighting') THEN 'Night'
    END


top 10 location
-----------------

select local_authority, sum(number_of_casualties)as Total_Casualties
from road_accident 
group by local_authority
order by Total_Casualties desc


select top 10 local_authority, sum(number_of_casualties)as Total_Casualties
from road_accident 
group by local_authority
order by Total_Casualties desc










