
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



# Create graph
png(file = "plot3.png")

with(data, plot(strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S"), data$Sub_metering_1, xlab = "", ylab = yLab,  type = "l"))
lines(strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S"), data$Sub_metering_2, col = "red")
lines(strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S"), data$Sub_metering_3, col = "blue")
legend("topright", legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3") , col= c("black","red","blue"), lty = c(1,1,1))

dev.off()
