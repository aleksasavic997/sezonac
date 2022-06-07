use seasonalWorkerDB

CREATE TABLE Workers (
    ID int IDENTITY(1,1) PRIMARY KEY,
    FirstName varchar(255) not null,
    LastName varchar(255) not null,
	Username varchar(255) not null,
	Pass varchar(255) not null,
	Sex bit not null,
	ProfileImageURL varchar(500),
	Email varchar(255) not null,
	DateOfBirth datetime,
	CVURL varchar(500),
	CoverLetter varchar(3000),
	CountryID int,
    CityID int,
);