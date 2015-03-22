## rm(list=ls())
## setwd("/Users/rogerfischer/datasciencecoursera/explora/project2")

## The two files: Source_Classification_Code.rds and summarySCC_PM25.rds
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds") # 297.43 MB
## SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")
## summary(NEI)

## 1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 emission from all 
## sources for each of the years 1999, 2002, 2005, and 2008.

library(dplyr)
emissionsyear <- select(NEI, year, Emissions)
by_year <- group_by(emissionsyear, year)
embyyear <- summarise(by_year,
                   count = n(),
                   em = sum(Emissions))
## Result of embyyear
## ------------------
## Source: local data frame [4 x 3]
## year   count      em
## 1 1999 1108469 7332967
## 2 2002 1698677 5635780
## 3 2005 1713850 5454703
## 4 2008 1976655 3464206

## Plot Emissions by Year
## The decrease in emissions of PM2.5 from 1999 to 2008 is obvious
par(mar = c(5, 5, 4, 2))
plot(x = embyyear$year, y = embyyear$em, xlab = "Year", ylab = "Amount of PM2.5 emitted, in tons", type = "h", col = "red", lwd = 5, main = "PM2.5 Emissions in 1999, 2002, 2005, 2008")

## Creating the png file 
dev.copy(png, file = "plot1.png", width = 480, height = 480)  
dev.off() 
