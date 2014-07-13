
# Variables
wd        <- "D:/Projects/Coursera/Exploratory Data Analysis/Project1/ExData_Plotting1" # Working Diercory
dataPath  <- "./data/household_power_consumption.txt"                                   # Data file path
mainTitle <- "Global Active Power"                                                      # Graph main title
xLab      <- "Global Active Power (kilowatts)"                                          # x-label title
yLab      <- "Frequency"                                                                # y-label title


# Set Working Directory
setwd(wd)

# Read data setting sep as ; and na as ?
data      <- read.csv(dataPath , sep = ";", na.strings = "?")

# Convert Date column to Date Type
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Subseting data with only first 2 days on February
data      <- subset(data, data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"))


# Create graph
png(file = "plot1.png")
hist(data$Global_active_power, col="red",xlab = xLab, ylab = yLab, main = mainTitle)
dev.off()
