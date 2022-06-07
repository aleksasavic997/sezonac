use seasonalWorkerDB

CREATE TABLE Job(
    ID int IDENTITY(1,1) PRIMARY KEY,
    JobName varchar (255) not null,
	JobDescription varchar(1000) not null,
	CategoryID int FOREIGN KEY REFERENCES JobCategory(ID)
);