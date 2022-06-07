use seasonalWorkerDB

CREATE TABLE WorkerWorksOnAJob(
    ID int IDENTITY(1,1) PRIMARY KEY,
	ContractDetails varchar(5000),
    JobAdvertisementID int FOREIGN KEY REFERENCES JobAdvertisements(ID) not null,
	WorkerID int FOREIGN KEY REFERENCES Workers(ID) not null
);