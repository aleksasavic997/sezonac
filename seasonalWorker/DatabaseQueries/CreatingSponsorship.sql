use seasonalWorkerDB

CREATE TABLE Sponsorship(
    ID int IDENTITY(1,1) PRIMARY KEY,
    EmployerID int FOREIGN KEY REFERENCES Employer(ID) not null,
	SponsorID int FOREIGN KEY REFERENCES Sponsor(ID) not null
);