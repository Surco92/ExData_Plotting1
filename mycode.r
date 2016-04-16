### LOADING DATA
temp <- tempfile()
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.csv(unz(temp,"household_power_consumption.txt"),sep=";",na.strings="?") 
unlink(temp)

# loading data from HDD: data <- read.csv("D:/R/ExpAnalysis/household_power_consumption.txt", sep=";", na.strings="?")

