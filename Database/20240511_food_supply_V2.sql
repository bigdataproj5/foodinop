-- tworzę 2 schematy żeby przepuściś dane przez knime i visual studio osobno do odpowiednich tabel. Same tabele są takie same (np. knime.Life_expectancy i vs.Life_expectancy)
CREATE SCHEMA knime;
CREATE SCHEMA vs;




DROP TABLE IF EXISTS knime.Life_expectancy;
CREATE TABLE knime.Life_expectancy (
	"ID_LE" int NOT NULL IDENTITY(1,1) PRIMARY KEY
	,"ID_C" int
	,"Country" varchar(59) NOT NULL
	,"Country_code" varchar(8) NOT NULL
	,"Year" int NOT NULL
	,"Life_expectancy" float NOT NULL
	--,"Life_expectancy_period" nvarchar(10) NOT NULL
	--,FOREIGN KEY (ID_C) REFERENCES knime.Countries(ID_C)
);


DROP TABLE IF EXISTS knime.Countries;
CREATE TABLE knime.Countries (
	"ID_C" int NOT NULL IDENTITY(1,1) PRIMARY KEY
	,"Country" varchar(44) NOT NULL
	,"Country_code" varchar(8) NOT NULL
	,"Continent_update_year" int NOT NULL
	,"Continent" varchar(13) NOT NULL
	,"WHO_Region_update_year" int NOT NULL
	,"WHO_Region" varchar(21) NOT NULL
	,"World_Bank_update_year" int NOT NULL
	,"World_Bank_Region" varchar(28) NOT NULL
	,"United_Nations_update_year" int NOT NULL
	,"United_Nations_Region" varchar(32) NOT NULL


);

DROP TABLE IF EXISTS knime.Food_balance_o
CREATE TABLE knime.Food_balance_o (
	"ID_FBO" int NOT NULL IDENTITY(1,1) PRIMARY KEY
	,"ID_C" int
	,"Country" varchar(44) NOT NULL
	,"Item" varchar(31) NOT NULL
	,"Element" varchar(38) NOT NULL
	,"Year" int NOT NULL
	,"Unit" varchar(12) NOT NULL
	,"Value" float NOT NULL
	--,FOREIGN KEY (ID_C) REFERENCES knime.Countries(ID_C)

);

DROP TABLE IF EXISTS knime.Food_balance_n
CREATE TABLE knime.Food_balance_n (
	"ID_FBO" int NOT NULL IDENTITY(1,1) PRIMARY KEY
	,"ID_C" int
	,"Country" varchar(44) NOT NULL
	,"Item" varchar(31) NOT NULL
	,"Element" varchar(38) NOT NULL
	,"Year" int NOT NULL
	,"Unit" varchar(12) NOT NULL
	,"Value" float NOT NULL
	--,FOREIGN KEY (ID_C) REFERENCES knime.Countries(ID_C)

);

-- tu testowaem prostą perspektywę
DROP VIEW IF EXISTS knime.LE_test
CREATE VIEW knime.LE_test
AS
SELECT * 
FROM knime.Life_expectancy
WHERE Year < 2000 OR Year > 2010
GO

SELECT *
FROM knime.LE_test


-- i tu przechodzimy do docelowych schmetów z visual studio 


DROP TABLE IF EXISTS vs.Life_expectancy;
CREATE TABLE vs.Life_expectancy (
	"ID_LE" int NOT NULL IDENTITY(1,1) PRIMARY KEY
	,"ID_C" int
	,"Country" nvarchar(59) NOT NULL
	,"Country_code" nvarchar(8) NOT NULL
	,"Year" int NOT NULL
	,"Life_expectancy" float NOT NULL
	--,FOREIGN KEY (ID_C) REFERENCES knime.Countries(ID_C)

);

-- to tylko pod sprawdzenie ilościowe knime - vs
--SELECT COUNT(*)
--FROM vs.Life_expectancy


DROP TABLE IF EXISTS vs.Food_balance_o
CREATE TABLE vs.Food_balance_o (
	"ID_FBO" int NOT NULL IDENTITY(1,1) PRIMARY KEY
	,"ID_C" int
	,"Country" varchar(44) NOT NULL
	,"Item" varchar(31) NOT NULL
	,"Element" varchar(38) NOT NULL
	,"Year" int NOT NULL
	,"Unit" varchar(12) NOT NULL
	,"Value" float NOT NULL
	--,FOREIGN KEY (ID_C) REFERENCES knime.Countries(ID_C)


);

DROP TABLE IF EXISTS vs.Food_balance_n
CREATE TABLE vs.Food_balance_n (
	"ID_FBO" int NOT NULL IDENTITY(1,1) PRIMARY KEY
	,"ID_C" int
	,"Country" varchar(44) NOT NULL
	,"Item" varchar(31) NOT NULL
	,"Element" varchar(8) NOT NULL
	,"Year" int NOT NULL
	,"Unit" varchar(12) NOT NULL
	,"Value" float NOT NULL
	--,FOREIGN KEY (ID_C) REFERENCES knime.Countries(ID_C)
);

DROP TABLE IF EXISTS vs.Countries;
CREATE TABLE vs.Countries (
	"ID_C" int NOT NULL IDENTITY(1,1) PRIMARY KEY
	,"Country" varchar(50) NOT NULL
	,"Country_code" varchar(8) NOT NULL
	,"Continent_update_year" int NOT NULL
	,"Continent" varchar(50) NOT NULL
	,"WHO_Region_update_year" int NOT NULL
	,"WHO_Region" varchar(50) NOT NULL
	,"World_Bank_update_year" int NOT NULL
	,"World_Bank_Region" varchar(50) NOT NULL
	,"United_Nations_update_year" int NOT NULL
	,"United_Nations_Region" varchar(50) NOT NULL


);


-- tu zacząłem testować "autouzupełnianie" kluczy obcych w tabelach odnoszących się do tabli knime.Countries ale nie działa jeszcze :D


CREATE TRIGGER LifeExpectancy_Countries ON knime.Life_expectancy 
	WITH EXECUTE AS OWNER
	AFTER INSERT
	
AS
   UPDATE ID_C
	SET knime.Life_expectancy.ID_C = knime.Countries.ID_C
	WHERE knime.Life_expectancy.Country = knime.Countries.Country



 SELECT *
 FROM sys.triggers
