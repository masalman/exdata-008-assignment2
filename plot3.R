## Mohamad Salman - 11/09/14
## Exploratory Data Analysis - Assignment 2 - Course Project 2
## ***************************************************************
## Plot 3 Code

#source the data load files
source("dataread.R")
library(ggplot2)

# Load dataframes
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# subset Baltimore data by FIP
baltimoredata <- NEI[NEI$fips=="24510",]
# Aggregate by sum: Baltimore emmisions by year
aggs_baltimore <- aggregate(Emissions ~ year, baltimoredata, sum)
png("plot3.png", width=480, height=480, units="px", bg="transparent")
# Generate ggplot2 code to view emmisions by source type
ggp <- ggplot(baltimoredata, aes(factor(year), Emissions, fill=type)) +
  geom_bar(stat="identity") + theme_bw() + guides(fill=FALSE) +
  facet_grid(.~type,scales = "free", space="free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("Baltimore: PM"[2.5]*" Emissions from 1999-2008 by Source"))
print(ggp)
dev.off()