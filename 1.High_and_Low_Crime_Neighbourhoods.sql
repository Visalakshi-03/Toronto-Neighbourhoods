
SELECT  Top 1 [Neighbourhood].name as HighCrime_Neighbourhood, count(CRIME.offence) as No_of_Offences
FROM CRIME, Neighbourhood
WHERE Neighbourhood.shape.STContains(CRIME.shape)=1 
GROUP BY Neighbourhood.Name 
order by count([CRIME].offence) desc

SELECT  Top 1 [Neighbourhood].name as LowCrime_Neighbourhood, count(CRIME.offence) as No_of_Offences
FROM CRIME, Neighbourhood
WHERE Neighbourhood.shape.STContains(CRIME.shape)=1 
GROUP BY Neighbourhood.Name 
order by count([CRIME].offence) 