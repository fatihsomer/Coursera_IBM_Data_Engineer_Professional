CREATE TABLE  MyFactTrips(
    tripid INT PRIMARY KEY NOT NULL,
    tripNumber INT NOT NULL,
    wasteid INT NOT NULL ,
    zoneid INT NOT NULL,
    dateid INT NOT NULL,
    CONSTRAINT fk_waste FOREIGN KEY (wasteid) REFERENCES MyDimWaste(wasteid),
    CONSTRAINT fk_zone FOREIGN KEY (zoneid) REFERENCES MyDimZone(zoneid),
    CONSTRAINT fk_date FOREIGN KEY (dateid) REFERENCES MyDimDate(dateid)
)
