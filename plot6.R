## Mohamad Salman - 11/09/14
## Exploratory Data Analysis - Assignment 2 - Course Project 2
## ***************************************************************
## Plot 6 Code

#source the data load files
source("dataread.R")
library(ggplot2)

# Load dataframes
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# subset vehicle data
vehicle <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
SCC_vehicle <- SCC[vehicle, ]$SCC
NEI_vehicle <- NEI[NEI$SCC %in% SCC_vehicle,]
# subset Baltimore and LA County data
baltimore <- NEI_vehicle[NEI_vehicle$fips=="24510", ]
LACounty <-  NEI_vehicle[NEI_vehicle$fips=="06037", ]
baltimore$city <- "Baltimore City"; LACounty$city <- "Los Angeles County"
#combine data for easier plots
both <- rbind(LACounty, baltimore)
# Generate ggplot2 code to compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County
png("plot6.png", width=480, height=480, units="px", bg="transparent")
gplot <- ggplot(both, aes(factor(year), Emissions, fill=city)) +
  geom_bar(stat="identity", aes(fill=year)) + facet_grid(scales="free", space="free", .~city) +  
  theme_bw() + guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emissions (kTons)")) + 
  labs(title=expression("Baltimore v. Los Angeles County PM"[2.5]*" Vehicle Emissions: 1999-2008"))
print(gplot)
dev.off()