CREATE TABLE MyDimDate(
	dateid INT PRIMARY KEY NOT NULL,
	date DATE NOT NULL,
	year SMALLINT,
	quarter SMALLINT,
	quarterName CHAR(2),
	month SMALLINT,
	monthName VARCHAR(20),
	day SMALLINT,
	weekday SMALLINT,
	weekdayName VARCHAR(20)	
)
