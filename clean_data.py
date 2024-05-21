import pandas as pd
import numpy as np
import math
import os
import sys
from datetime import datetime
import csv

raw_data_folder = "C:\\Studia\\Big_Data\\Projekt\\Data_Sets\\Data-ready\\"

# Read csv file to the DataFrame
df_RegionsAccordingWorldBank = pd.read_csv(raw_data_folder + "world-regions-according-to-the-world-bank.csv",encoding='latin-1', dtype=str)
df_continents = pd.read_csv(raw_data_folder + "continents-according-to-our-world-in-data.csv",encoding='latin-1', dtype=str)
df_FoodBalanceSheets = pd.read_csv(raw_data_folder + "FoodBalanceSheets_E_All_Data_(Normalized).csv",encoding='latin-1', dtype=str)
df_FoodBalanceSheetsHistoric = pd.read_csv(raw_data_folder + "FoodBalanceSheetsHistoric_E_All_Data_(Normalized).csv",encoding='latin-1', dtype=str)
df_LifeExpectancy = pd.read_csv(raw_data_folder + "life-expectancy.csv",encoding='latin-1', dtype=str)
df_WhoRegions = pd.read_csv(raw_data_folder + "who-regions.csv",encoding='latin-1', dtype=str)
df_RegionsUnitedNations = pd.read_csv(raw_data_folder + "world-regions-sdg-united-nations.csv",encoding='latin-1', dtype=str)
df_FoodBalanceSheetsEAreaCodes = pd.read_csv(raw_data_folder + "copy_FoodBalanceSheets_E_AreaCodes.csv",encoding='latin-1', dtype=str)


def clean_data(df, df_name,raw_data_name):
# arguments description: 
# df - to put datframe name as datframe type
# df_name - to put the dataframe name as as string 
    
    dt_string = datetime.now().replace(microsecond=0)
    # prepare variables to open file
    data_folder = "C:\\Studia\\Big_Data\\Projekt\\Data_Sets\\Data-ready\\"
    file_to_open = data_folder + df_name + ".log" 
    
    # open file to log progress
    with open(file_to_open, "a") as logfile:
        
        # start cleaning data from NULLs
        print("############################################################################",file=logfile)
        print("### CLEAN DATA FOR ", df_name, " FILE date: ", dt_string, file=logfile)
        print("############################################################################",file=logfile)
        print(" ",file=logfile)
        print("List of columns with any NULLs in ", df_name, " Data Frame:",file=logfile)
        print(df.isnull().any(),file=logfile)
        print(" ",file=logfile)
        
        # take all columns from a dataframe
        list_col = list(df.columns)
        
        # loop to remove nulls from every column 
        for col in list_col:
            if df[col].isnull().any() == True:
                # print information about null values
                print("-----------", file=logfile)
                print("Column: ",col," - in this column exist ",df[col].isnull().sum(),"NULL values", file=logfile)
                print(' ', file=logfile)
                print("REPLACE NULL values in column ", col, " with the '-' sign:", file=logfile)
                print(" ", file=logfile)
                # replase duplicates
                df[col] = df[col].fillna('0')
                # print information whether all null has been replaced
                print(" ", file=logfile)
                print("List any NULLs after replacing in", col, "column", file=logfile)
                print(df.isnull().any(), file=logfile)
            elif df[col].isnull().any() == False:
                print("-----------", file=logfile)
                print("The [",col, "] column do not have any NULLs", file=logfile)
                print(" ", file=logfile)
        
        # start removing duplicates
        print("##############################################################################", file=logfile)
        print("### REMOVE DUPLICATES FROM ", df_name, " FILE date: ", dt_string, file=logfile)
        print("##############################################################################", file=logfile)
        print(" ",file=logfile)
        
        # count duplicates
        num_of_dup = df.duplicated().sum()
        print("The ", df_name, " dataframe has ", num_of_dup, " duplicates", file=logfile)
        
        # remove duplicates if exists
        if num_of_dup > 0:
            df = df.drop_duplicates()
            print("Duplicates has been removed from the ", df_name, " Dataframe", file=logfile)
        else:
            print("There is no duplicates in the ", df_name, " Dataframe to delete", file=logfile)
            
        # start removing the apostrof from dataframe
        print("##############################################################################", file=logfile)
        print("### REMOVE WRONG APOSTROFS ", df_name, " FILE date: ", dt_string, file=logfile)
        print("##############################################################################", file=logfile)
        print(" ",file=logfile)
        
        if df_name == "df_FoodBalanceSheets":
            df['Area Code (M49)'] = df['Area Code (M49)'].str.replace("'","")
            df['Item Code (FBS)'] = df['Item Code (FBS)'].str.replace("'","")
            print("Remove apostrofs from " + df_name + " columns: [Area Code (M49)], [Item Code (FBS)]", file=logfile)
        elif df_name == "df_FoodBalanceSheetsHistoric":
            df['Area Code (M49)'] = df['Area Code (M49)'].str.replace("'","")
            print("Remove apostrofs from " + df_name + " columns: [Area Code (M49)], [Item Code (FBS)]", file=logfile)
        elif df_name == "df_FoodBalanceSheetsEAreaCodes":
            df['M49 Code'] = df['M49 Code'].str.replace("'","")
            print("Remove apostrofs from " + df_name + " columns: [M49 Code]", file=logfile)
            
        df.to_csv(raw_data_folder + raw_data_name + "_CLEAN.csv", sep=',', quotechar='"', quoting=csv.QUOTE_ALL, index=False, encoding='utf-8')
        print(df.head())
        
    return None
 
clean_data(df_RegionsAccordingWorldBank, "df_RegionsAccordingWorldBank","world-regions-according-to-the-world-bank.csv")
clean_data(df_continents, "df_continents", "continents-according-to-our-world-in-data.csv")
clean_data(df_FoodBalanceSheets, "df_FoodBalanceSheets", "FoodBalanceSheets_E_All_Data_(Normalized).csv")
clean_data(df_FoodBalanceSheetsHistoric, "df_FoodBalanceSheetsHistoric", "FoodBalanceSheetsHistoric_E_All_Data_(Normalized).csv")
clean_data(df_LifeExpectancy, "df_LifeExpectancy", "life-expectancy.csv")
clean_data(df_WhoRegions, "df_WhoRegions", "who-regions.csv")
clean_data(df_RegionsUnitedNations, "df_RegionsUnitedNations", "world-regions-sdg-united-nations.csv")
clean_data(df_FoodBalanceSheetsEAreaCodes, "df_FoodBalanceSheetsEAreaCodes", "copy_FoodBalanceSheets_E_AreaCodes.csv")
