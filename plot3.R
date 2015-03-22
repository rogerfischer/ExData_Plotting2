## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
## which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
## Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make 
## a plot answer this question.

## rm(list=ls())
## setwd("/Users/rogerfischer/datasciencecoursera/explora/project2")

NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds") 

baltimore <- subset(NEI, NEI$fips == "24510")
baltimore$type <- factor(baltimore$type)

## Creating the plot
library(ggplot2)
g <- qplot(year, Emissions, data = baltimore, facets = .~type, color = type, geom = c("point", "smooth"), method = "lm")
## I excluded one outlier from NONPOINT, therefore the ylim(0, 400)
g + labs(title = "Baltimore Emissions 1999-2008, in tons") +  ylim(0, 400)

## Creating the png file 
dev.copy(png, file = "plot3.png", width = 640, height = 480)  
dev.off() 
