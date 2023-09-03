CREATE TABLE MyDimWaste(
    wasteid INT PRIMARY KEY NOT NULL,
    wasteType VARCHAR(20) NOT NULL,
    wasteCollectionInTons DECIMAL(6,2) NOT NULL
)
