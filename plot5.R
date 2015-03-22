# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

## rm(list=ls())
## setwd("/Users/rogerfischer/datasciencecoursera/explora/project2")

NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds") 

# Baltimore and On Road (= Motor Vehicle Sources)
baltimore_road <- subset(NEI, NEI$fips == "24510" & NEI$type == "ON-ROAD")

g <- qplot(year, Emissions, data = baltimore_road, geom = c("point", "smooth"), method = "lm")
g + labs(title = "Emissions from Motor Vehicle Sources in Baltimore 1999-2008, in tons")

## Creating the png file 
dev.copy(png, file = "plot5.png", width = 640, height = 480)  
dev.off() 