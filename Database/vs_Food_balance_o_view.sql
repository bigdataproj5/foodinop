USE [projekt5]
GO

/****** Object:  View [vs].[Food_balance_o_view]    Script Date: 5/28/2024 7:52:16 PM ******/
DROP VIEW [vs].[Food_balance_o_view]
GO

/****** Object:  View [vs].[Food_balance_o_view]    Script Date: 5/28/2024 7:52:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



create view [vs].[Food_balance_o_view] as 
select * from knime.Food_balance_o
where element in (
'Food supply quantity (kg/capita/yr)',
'Fat supply quantity (g/capita/day)',
'Food supply (kcal/capita/day)',
'Protein supply quantity (g/capita/day)')
and Country IN (SELECT country FROM knime.Countries) 
and item != 'grand total'
GO


