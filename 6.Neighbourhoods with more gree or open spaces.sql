SELECT TOP 5 [Neighbourhood].Name AS Neighbourhood, SUM([PARKSANDSPACES].Shape.STArea())/1000000 AS Open_Spaces_Sq_km from
[Neighbourhood], [PARKSANDSPACES] WHERE
[PARKSANDSPACES].Shape.STWithin(Neighbourhood.shape)=1
GROUP BY [Neighbourhood].Name
ORDER BY SUM([PARKSANDSPACES].Shape.STArea())/1000000 DESC