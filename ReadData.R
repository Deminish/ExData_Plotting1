#Code to read in the data

data <- read.csv("C:/Users/Mike/Documents/Rwd/Exploratory/household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

data <- data[(data$Date == "1/2/2007"|data$Date == "2/2/2007"),]

data$DateTime <- paste(data$Date, data$Time)

data$DateTime <- strptime(data$DateTime, format= "%d/%m/%Y %H:%M:%S")

data$Date <- as.Date(data$Date, format ="%d/%m/%Y %H")
data$Time <- strptime(data$Time, format="%H:%M:%S")