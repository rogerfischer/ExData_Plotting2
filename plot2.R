## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
## from 1999 to 2008? Use the base plotting system to make a plot answering this question.

## rm(list=ls())
## setwd("/Users/rogerfischer/datasciencecoursera/explora/project2")

## The two files: Source_Classification_Code.rds and summarySCC_PM25.rds
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds") 

baltimore <- subset(NEI, NEI$fips == "24510")

library(dplyr)
emissionsyear <- select(baltimore, year, Emissions)
by_year <- group_by(emissionsyear, year)
embyyear <- summarise(by_year,
                      count = n(),
                      em = sum(Emissions))

## > embyyear
## Source: local data frame [4 x 3]

## year count       em
## 1 1999   320 3274.180
## 2 2002   535 2453.916
## 3 2005   542 3091.354
## 4 2008   699 1862.282

## Plot emissions by year
## The decrease in emissions of PM2.5 from 1999 to 2008 is there, but 2005 it was quite high.
par(mar = c(5, 5, 4, 2))
plot(x = embyyear$year, y = embyyear$em, xlab = "Year", ylab = "Amount of PM2.5 emitted, in tons", type = "h", col = "red", lwd = 5, main = "Baltimore PM2.5 Emissions in 1999, 2002, 2005, 2008")

## Creating the png file 
dev.copy(png, file = "plot2.png", width = 540, height = 480)  
dev.off() 