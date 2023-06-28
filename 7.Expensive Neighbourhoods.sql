
With MLS as
(SELECT 
Neighbourhood.Name as Neighbourhood_Name,
Neighbourhood.NeighbourhoodID as Neigh_ID
FROM  Neighbourhood, RealEstate_Districts
WHERE Neighbourhood.shape.STIntersects(RealEstate_Districts.shape)=1 
GROUP BY Neighbourhood.Name,Neighbourhood.NeighbourhoodID
) 
select Top 5 Neigh_ID,Neighbourhood_Name, mls_dist, Apartment_Benchmark_price from  
MLS,Neighbourhood_TRREB,RealEstate_Districts
where Neighbourhood_TRREB.NeighbourhoodID = MLS.Neigh_ID and 
upper(Neighbourhood_TRREB.mls_dist) = upper(RealEstate_Districts.TRREB_Area)
Order by RealEstate_Districts.Apartment_Benchmark_price desc

