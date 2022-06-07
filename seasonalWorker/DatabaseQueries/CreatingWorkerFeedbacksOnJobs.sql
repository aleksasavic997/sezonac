use seasonalWorkerDB

CREATE TABLE WorkerFeedbackOnJob(
    ID int IDENTITY(1,1) PRIMARY KEY,
	WorkerComment varchar(5000),
	WorkerMark int not null,
    WorkerWorksOnAJobID int FOREIGN KEY REFERENCES WorkerWorksOnAJob(ID) not null,
	WorkerID int FOREIGN KEY REFERENCES Workers(ID) not null
);