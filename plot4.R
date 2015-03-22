## Across the United States, how have emissions from coal combustion-related sources changed 
## from 1999–2008?

## Search everything with "Coal" in SCC$Short.Name
coal_rows_SCC <- grep("Coal", SCC$Short.Name) # 230 mentions of Coal in 11717 observations
coal_SCC <- SCC[coal_rows_SCC, ] # dim(coal_SCC) [1] 230  15

## names(NEI)
## [1] "fips"      "SCC"       "Pollutant" "Emissions" "type"      "year" 
coal_NEI <- subset(NEI, NEI$SCC == coal_SCC$SCC) # dim(coal_NEI) [1] 235   6

library(ggplot2)
g <- qplot(year, Emissions, data = coal_NEI, geom = c("point", "smooth"), method = "lm")
g + labs(title = "Coal Combustion-Related Emissions 1999-2008, in tons")

## Creating the png file 
dev.copy(png, file = "plot4.png", width = 640, height = 480)  
dev.off() 