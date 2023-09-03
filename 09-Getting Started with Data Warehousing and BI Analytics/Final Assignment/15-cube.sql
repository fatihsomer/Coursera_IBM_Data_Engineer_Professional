select year, city, F.stationid, avg(wastecollected) as average_waste_collected
from FactTrips F
	left join DimDate DD on F.dateid=DD.dateid
		left join DimStation DS on F.stationid=05.stationid
Group by cube(year, city, F.stationid)
