#read file and format
data <- read.csv("./Exploratory/household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

data <- data[(data$Date == "1/2/2007"|data$Date == "2/2/2007"),]
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, format= "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format ="%d/%m/%Y %H")
data$Time <- strptime(data$Time, format="%H:%M:%S")

png("./Exploratory/plot2.png", width=480, height=480)
#plot2
with(data, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

dev.off()