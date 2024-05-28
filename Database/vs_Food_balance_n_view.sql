USE [projekt5]
GO

/****** Object:  View [vs].[Food_balance_n_view]    Script Date: 5/28/2024 7:54:47 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



create view [vs].[Food_balance_n_view] as 
select * from knime.Food_balance_n
where element in (
'Food supply quantity (kg/capita/yr)',
'Fat supply quantity (g/capita/day)',
'Food supply (kcal/capita/day)',
'Protein supply quantity (g/capita/day)')
and Country IN (SELECT country FROM knime.Countries) 
and item != 'grand total'
GO


