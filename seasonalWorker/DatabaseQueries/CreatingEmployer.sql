use seasonalWorkerDB

CREATE TABLE Employer(
    ID int IDENTITY(1,1) PRIMARY KEY,
    EmployerName varchar(255) not null,
	EmployerUsername varchar(255) not null,
	EmployerPassword varchar(255) not null,
	EmployerDescription varchar(255) not null,
	ProfileImageUrl varchar (500),
	Email varchar(255) not null,
	PhoneNumber varchar(255) not null,
	EmployerTypeID int FOREIGN KEY REFERENCES EmployerType(ID) not null,
	CityID int FOREIGN KEY REFERENCES City(ID) not null,
	AreaOfActivityID int FOREIGN KEY REFERENCES AreaOfActivity(ID) not null

);