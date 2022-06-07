use seasonalWorkerDB

CREATE TABLE JobApplicationsFeedback(
    ID int IDENTITY(1,1) PRIMARY KEY,
	Accepted bit not null,
    Comment varchar(5000)
);