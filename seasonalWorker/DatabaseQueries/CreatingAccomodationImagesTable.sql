use seasonalWorkerDB

CREATE TABLE AccomodationImages(
    ID int IDENTITY(1,1) PRIMARY KEY,
	AccomodationID int FOREIGN KEY REFERENCES Accomodation(ID) not null,
	AccomodationImageUrl varchar(300)
);