use seasonalWorkerDB

CREATE TABLE EmployerFeedbackOnJob(
    ID int IDENTITY(1,1) PRIMARY KEY,
	EmployerComment varchar(5000),
	EmployerMark int not null,
    WorkerWorksOnAJobID int FOREIGN KEY REFERENCES WorkerWorksOnAJob(ID) not null,
	EmployerID int FOREIGN KEY REFERENCES Employers(ID) not null
);