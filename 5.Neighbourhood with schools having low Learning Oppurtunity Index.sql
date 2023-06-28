
SELECT  TOP 3 Neighbourhood.Name as Neighbourhood_With_Low_LOI, avg(LOI2020score) as LearningOppuntunityIndex_LOI2020
FROM SCHOOLS, Neighbourhood
WHERE Neighbourhood.shape.STContains(SCHOOLS.shape)=1 and
SCHOOLS.Board_Name='Toronto DSB'
GROUP BY Neighbourhood.Name 
ORDER BY avg(LOI2020score) 
