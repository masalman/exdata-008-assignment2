## Mohamad Salman - 11/09/14
## Exploratory Data Analysis - Assignment 2 - Course Project 2
## ***************************************************************
## Plot 5 Code

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
# subset to only Baltimore Data
baltimore <- NEI_vehicle[NEI_vehicle$fips=="24510", ]

# Generate ggplot2 code to view how emissions from motor vehicle sources changed from 1999-2008 in Baltimore City
png("plot5.png", width=480, height=480, units="px", bg="transparent")
gplot <- ggplot(baltimore, aes(factor(year), Emissions/10^5)) +
  geom_bar(stat="identity") + theme_bw() + guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emissions (10^5 Tons)")) + 
  labs(title=expression("Baltimore PM"[2.5]*" Vehicle Source Emissions: 1999-2008"))
print(gplot)
dev.off()