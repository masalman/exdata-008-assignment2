## Mohamad Salman - 11/09/14
## Exploratory Data Analysis - Assignment 2 - Course Project 2
## ***************************************************************
## Plot 1 Code

#source the data load files
source("dataread.R")

# Load dataframes
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# Aggregate by sum: total emmisions by year
aggs <- aggregate(Emissions ~ year, NEI, sum)
png("plot1.png", width=480, height=480, units="px", bg="transparent")
barplot((aggs$Emissions)/10^6,names.arg=aggs$year, xlab="Year", ylab="PM2.5 Emissions (10^6 Tons)",
  main="Total PM2.5 Emissions: All US Sources"
)
dev.off()