select year, city, F.stationid, sum(wastecollected) as total_waste_collected
from FactTrips F
	left join DimDate DD on F.dateid=DD.dateid
		left join DimStation DS on F.stationid=DS.stationid
Group by rollup (year, city, F.stationid)
