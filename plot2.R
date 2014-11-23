## Mohamad Salman - 11/09/14
## Exploratory Data Analysis - Assignment 2 - Course Project 2
## ***************************************************************
## Plot 2 Code

#source the data load files
source("dataread.R")

# Load dataframes
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# subset Baltimore data by FIP
baltimoredata <- NEI[NEI$fips=="24510",]
# Aggregate by sum: Baltimore emmisions by year

aggs_baltimore <- aggregate(Emissions ~ year, baltimoredata, sum)
png("plot2.png", width=480, height=480, units="px", bg="transparent")
barplot((aggs_baltimore$Emissions)/10^6,names.arg=aggs_baltimore$year, xlab="Year", ylab="PM2.5 Emissions (10^6 Tons)",
  main="Total PM2.5 Emissions: Baltimore, MD"
)
dev.off()