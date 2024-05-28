USE [projekt5]
GO

/****** Object:  View [vs].[Countries_view]    Script Date: 5/28/2024 7:52:27 PM ******/
DROP VIEW [vs].[Countries_view]
GO

/****** Object:  View [vs].[Countries_view]    Script Date: 5/28/2024 7:52:27 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create view [vs].[Countries_view] as 
select 
ID_C,
Country,
Country_code,
Continent,
WHO_Region,
World_Bank_Region,
United_Nations_Region
from [knime].[Countries]
GO


