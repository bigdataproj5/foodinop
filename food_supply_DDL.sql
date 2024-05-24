--
--DROP SCHEMA vs;
--DROP TABLE IF EXISTS vs.Life_expectancy;
--DROP TABLE IF EXISTS vs.Countries;
--DROP TABLE IF EXISTS vs.Food_balance_n;
--DROP TABLE IF EXISTS vs.Food_balance_o;

CREATE SCHEMA vs;

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

CREATE TABLE vs.Food_balance_o (
	"ID_FBO" int NOT NULL IDENTITY(1,1) PRIMARY KEY
	,"ID_C" int
	,"Country" nvarchar(55) NOT NULL
	,"Item" varchar(50) NOT NULL
	,"Element" varchar(50) NOT NULL
	,"Year" int NOT NULL
	,"Unit" varchar(50) NOT NULL
	,"Value" float NOT NULL
	--,FOREIGN KEY (ID_C) REFERENCES knime.Countries(ID_C)
);

CREATE TABLE vs.Food_balance_n (
	"ID_FBO" int NOT NULL IDENTITY(1,1) PRIMARY KEY
	,"ID_C" int
	,"Country" nvarchar(55) NOT NULL
	,"Item" varchar(50) NOT NULL
	,"Element" varchar(50) NOT NULL
	,"Year" int NOT NULL
	,"Unit" varchar(50) NOT NULL
	,"Value" float NOT NULL
	--,FOREIGN KEY (ID_C) REFERENCES knime.Countries(ID_C)
);

CREATE TABLE vs.Countries (
	"ID_C" int NOT NULL IDENTITY(1,1) PRIMARY KEY
	,"Country" nvarchar(59) NOT NULL
	,"Country_code" varchar(8) NOT NULL
	,"Continent_update_year" int NOT NULL
	,"Continent" nvarchar(50) NOT NULL
	,"WHO_Region_update_year" int
	,"WHO_Region" nvarchar(50)
	,"World_Bank_update_year" int
	,"World_Bank_Region" nvarchar(50)
	,"United_Nations_update_year" int
	,"United_Nations_Region" nvarchar(50)
);


CREATE TABLE vs.FoodBalance (
"ID_FooBl" int NOT NULL IDENTITY(1,1) PRIMARY KEY
,"AreaCode" int NOT NULL
,"AreaCodeM49" varchar(10) NOT NULL
,"Area" varchar(50) NOT NULL
,"ItemCode" varchar(50) NOT NULL
,"ItemCodeFBS" varchar(50) NOT NULL
,"Item" varchar(50) NOT NULL
,"ElementCode" varchar(50) NOT NULL
,"Eelement" varchar(50) NOT NULL
,"YearCode" int NOT NULL
,"Year" int NOT NULL
,"Unit" varchar(50) NOT NULL
,"Value" float NOT NULL
,"Flag" char(1) NOT NULL
);

-- tu zacząłem testować "autouzupełnianie" kluczy obcych w tabelach odnoszących się do tabli knime.Countries ale nie działa jeszcze :D
--
--
--CREATE TRIGGER LifeExpectancy_Countries ON knime.Life_expectancy 
--	WITH EXECUTE AS OWNER
--	AFTER INSERT
--	
--AS
--   UPDATE ID_C
--	SET knime.Life_expectancy.ID_C = knime.Countries.ID_C
--	WHERE knime.Life_expectancy.Country = knime.Countries.Country
--
-- SELECT *
-- FROM sys.triggers
