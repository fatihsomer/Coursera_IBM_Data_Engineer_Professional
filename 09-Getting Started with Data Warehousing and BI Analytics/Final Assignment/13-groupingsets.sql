select stationid, trucktype, sum(waste-collected) as total_waste_collected
from FactTrips F
left join DimTruck D on F.truckid=D.truckid
Group by grouping sets (stationid, trucktype)
