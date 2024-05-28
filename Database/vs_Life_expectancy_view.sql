USE [projekt5]
GO

/****** Object:  View [vs].[Life_expectancy_year_view]    Script Date: 5/28/2024 7:41:06 PM ******/
DROP VIEW [vs].[Life_expectancy_year_view]
GO

/****** Object:  View [vs].[Life_expectancy_year_view]    Script Date: 5/28/2024 7:41:06 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create view 
[vs].[Life_expectancy_year_view] as 
select Country, Year, Life_expectancy from vs.[Life_expectancy]
where country in (select country from vs.Countries) 
and year in (select year from [vs].[Food_balance_n])
or year in (select year from [vs].[Food_balance_o])
GO


