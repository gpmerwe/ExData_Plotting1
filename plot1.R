
setwd('C:/Coursera/4 Graphs/exdata_2Fdata%2Fhousehold_power_consumption')
rawData <- read.table("./household_power_consumption.txt", header=TRUE,sep=";")

head(rawData)
dim(rawData)

# Subset the date for this exercise
# Format
library(dplyr)
rawData$Date <- as.Date(rawData$Date,"%d/%m/%Y")
filterData <- subset(rawData, Date <= '2007-02-02' & Date >= '2007-02-01')

# Format Global Active Power variable
filterData$Global_active_power <- as.numeric(filterData$Global_active_power)

# Filter to exclude NAs and ?'s
filterData2 <- subset(filterData, !is.na(Global_active_power), Global_active_power != "?")

# First view
hist(filterData2$Global_active_power, 
     col = "red", 
     breaks=20, 
     main = "Global Active Power", 
     xlab="Global Active Power (kilowatts)")

# My values are very different compared to the example?
# Create png for result
png(filename="C:/Coursera/4 Graphs/Week 1/ExData_Plotting1/plot1.png", width = 480, height = 480, units = "px")
par(mar=c(4,4,2,2))
hist(filterData2$Global_active_power, 
     col = "red", 
     breaks=20, 
     main = "Global Active Power", 
     xlab="Global Active Power (kilowatts)")

dev.off()