SELECT  top 5 Neighbourhood.Name as Neighbourhood,  SCHOOLS.School_Name as SchoolName, SCHOOLS.FraserScore as FraserScore
 FROM SCHOOLS,Neighbourhood
WHERE SCHOOLS.shape.STWithin(Neighbourhood.shape)=1 and
SCHOOLS.SchoolLevel ='Elementary' AND
[SCHOOLS].Board_name ='Toronto DSB'
ORDER BY SCHOOLS.FraserScore desc