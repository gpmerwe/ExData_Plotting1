
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

# Create datetime variable
my_data <- filterData2
my_data$DateTime <- paste(my_data$Date, my_data$Time)
my_data$DateTime <- strptime(my_data$DateTime, "%Y-%m-%d %H:%M:%S")

# First view
with(my_data, plot(DateTime, Global_active_power, type="n", ylab="Global Active Power (kilowatts)"))
with(my_data, lines(DateTime, Global_active_power))

# Create png for result
png(filename="C:/Coursera/4 Graphs/Week 1/ExData_Plotting1/plot2.png", width = 480, height = 480, units = "px")
par(mar=c(4,4,2,2))
with(my_data, plot(DateTime, Global_active_power, type="n", ylab="Global Active Power (kilowatts)"))
with(my_data, lines(DateTime, Global_active_power))
dev.off()