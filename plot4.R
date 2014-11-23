## Mohamad Salman - 11/09/14
## Exploratory Data Analysis - Assignment 2 - Course Project 2
## ***************************************************************
## Plot 4 Code

#source the data load files
source("dataread.R")
library(ggplot2)

# Load dataframes
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# subset coal and combustion data
coal <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE)
comb <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
both <- (comb & coal)
SCC_both <- SCC[both, ]$SCC
NEI_both <- NEI[NEI$SCC %in% SCC_both,]

# Generate ggplot2 code to view how emissions from coal combustion-related sources changed from 1999-2008
png("plot4.png", width=480, height=480, units="px", bg="transparent")
gplot <- ggplot(NEI_both, aes(factor(year), Emissions/10^5)) +
  geom_bar(stat="identity") + theme_bw() + guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emissions (10^5 Tons)")) + 
  labs(title=expression("Total USA PM"[2.5]*" Coal Combustion Emissions: 1999-2008"))
print(gplot)
dev.off()