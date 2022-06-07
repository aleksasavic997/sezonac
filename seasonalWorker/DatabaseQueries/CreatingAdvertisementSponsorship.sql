use seasonalWorkerDB

CREATE TABLE AdvertisementSponsorships(
    ID int IDENTITY(1,1) PRIMARY KEY,
    JobAdvertisementID int FOREIGN KEY REFERENCES JobAdvertisements(ID) not null,
	SponsorID int FOREIGN KEY REFERENCES Sponsors(ID) not null
);