select Neighbourhood.Name,  MajorFourSubway.ROUTE_NAME, Neighbourhood.shape.STIntersection(MAJORFOURSUBWAY.shape) from
Neighbourhood, MAJORFOURSUBWAY where 
Neighbourhood.shape.STIntersects(MAJORFOURSUBWAY.shape.STBuffer(1000))=1
order BY (neighbourhood.Name)