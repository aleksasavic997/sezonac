use seasonalWorkerDB

CREATE TABLE Sponsor(
    ID int IDENTITY(1,1) PRIMARY KEY,
    SponsorName varchar (255) not null,
	SponsorDescription varchar(1000) not null,
);