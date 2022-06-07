use seasonalWorkerDB

CREATE TABLE City(
    ID int IDENTITY(1,1) PRIMARY KEY,
    CityName varchar (255) not null,
	CountryID int FOREIGN KEY REFERENCES Country(ID) not null
);