
# Variables
wd        <- "D:/Projects/Coursera/Exploratory Data Analysis/Project1/ExData_Plotting1" # Working Diercory
dataPath  <- "./data/household_power_consumption.txt"                                   # Data file path                                                                                      
xLab      <- ""                                                                         # x-label title
yLab      <- "Energy sub metering"                                                      # y-label title


# Set Working Directory
setwd(wd)

# Read data setting sep as ; and na as ?
data      <- read.csv(dataPath , sep = ";", na.strings = "?")

# Convert Date column to Date Type
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Subseting data with only first 2 days on February
data      <- subset(data, data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"))

# add a new column for DateTime
data$DateTime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

# Create graph
png(file = "plot4.png")

par(mfrow = c(2,2))


with(data, plot(data$DateTime, data$Global_active_power, xlab = "", ylab = "Global Active Power",  type = "l"))

with(data, plot(data$DateTime, data$Voltage, xlab = "datetime", ylab = "Voltage",  type = "l"))

with(data, plot(data$DateTime, data$Sub_metering_1, xlab = "", ylab = yLab,  type = "l"))
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3") , col= c("black","red","blue"), lty = c(1,1,1))
 
 with(data, plot(data$DateTime, data$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power",  type = "l"))
dev.off()
