use seasonalWorkerDB

CREATE TABLE EmployerType(
    ID int IDENTITY(1,1) PRIMARY KEY,
    EmployerTypeName varchar (255) not null,
	EmployerTypeDescription varchar(1000) not null,
);