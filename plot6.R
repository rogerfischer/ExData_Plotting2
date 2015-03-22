## Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle 
## sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes 
## over time in motor vehicle emissions?

## rm(list=ls())
## setwd("/Users/rogerfischer/datasciencecoursera/explora/project2")

NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds") 

## Baltimore
baltimore <- subset(NEI, NEI$fips == "24510")

## Los Angeles
losangeles <- subset(NEI, NEI$fips == "06037")

## Combine Baltimore and Los Angeles
labal <- rbind(baltimore, losangeles)
fips <- factor(fips)

## Create the plot
g <- qplot(year, Emissions, data = labal, geom = "point", method = "lm", facets = .~fips, color = fips)
g + labs(title = "Los Angeles (06037) vs Baltimore (24510) Emissions 1999-2008, in tons")

## Creating the png file 
dev.copy(png, file = "plot6.png", width = 640, height = 480)  
dev.off() 