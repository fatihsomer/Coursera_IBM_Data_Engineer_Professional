CREATE TABLE max_waste_stats (CITY, STATIONID, TRUCKTYPE, max_waste collected) as 
(select city, F.stationid, DT.trucktype, max(wastecollected) 
from FactTrips F
	left join DimTruck DT on F.truckid-DT.truckid
		left join DimStation DS on F.stationid=DS.stationid
Group by city, F.stationid, DT.trucktype)
	DATA INITIALLY DEFERRED
	REFRESH DEFERRED
	MAINTAINED BY SYSTEM