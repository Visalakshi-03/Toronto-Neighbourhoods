with TTC as 
(
SELECT 
Neighbourhood.NeighbourhoodID as Neighbourhood_id,
Neighbourhood.Name as Neighbourhood_name,
Count(TTCstops.stop_id) as No_of_TTCstops
FROM Neighbourhood, TTCstops
WHERE Neighbourhood.shape.STContains(TTCstops.shape)=1 
GROUP BY Neighbourhood.NeighbourhoodID,Neighbourhood.Name
),
GO_stop as
(
SELECT
Neighbourhood.NeighbourhoodID as Neighbourhood_id, 
Neighbourhood.Name as Neighbourhood_name,
Count(GOstops.stop_id) as No_of_GOstops
FROM Neighbourhood, GOstops
WHERE 
Neighbourhood.shape.STContains(GOstops.shape)=1 
GROUP BY Neighbourhood.NeighbourhoodID,Neighbourhood.Name
)
select TOP 3 TTC.Neighbourhood_id,
TTC.Neighbourhood_name,
ISNULL(No_of_TTCstops,0) as No_of_TTCstops,
ISNULL(No_of_gostops,0) as No_of_GOstops,
ISNULL(No_of_TTCstops,0) + ISNULL(No_of_gostops,0) as Total_no_of_stops
from TTC LEFT OUTER JOIN GO_stop ON
TTC.Neighbourhood_id = GO_stop.Neighbourhood_id
order by Total_no_of_stops desc



