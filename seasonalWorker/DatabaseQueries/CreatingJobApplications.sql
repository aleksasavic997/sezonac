use seasonalWorkerDB

CREATE TABLE JobApplications(
    ID int IDENTITY(1,1) PRIMARY KEY,
	MotivationalLetter varchar(5000),
    JobAdvertisementID int FOREIGN KEY REFERENCES JobAdvertisements(ID) not null,
	WorkerID int FOREIGN KEY REFERENCES Workers(ID) not null
);