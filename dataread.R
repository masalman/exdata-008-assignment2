## Mohamad Salman - 11/09/14
## Exploratory Data Analysis - Assignment 2 - Course Project 2
## ***************************************************************
fetchData <- function(){
  ## Variable definitions
  ## wd - working directory
  ## fpath - filepath to R container, fetch if precached
  ## url - link to source data for Assignment
  ## start - start date: 2007-02-01
  ## finish - end date: 2007-02-02
  wd <- getwd()
  fpath <- file.path(wd,"data.zip")
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  
  ## Fetch data
  if(!file.exists(fpath)){
    download.file(url,fpath)
  }
  if(!(file.exists("summarySCC_PM25.rds") && file.exists("Source_Classification_Code.rds"))) { 
    unzip(fpath) 
  }
}