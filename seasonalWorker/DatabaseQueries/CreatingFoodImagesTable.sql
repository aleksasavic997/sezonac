use seasonalWorkerDB

CREATE TABLE FoodImages(
    ID int IDENTITY(1,1) PRIMARY KEY,
	FoodID int FOREIGN KEY REFERENCES Foods(ID) not null,
	FoodImageUrl varchar(300)
);