#read file and format
data <- read.csv("./Exploratory/household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

data <- data[(data$Date == "1/2/2007"|data$Date == "2/2/2007"),]
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, format= "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format ="%d/%m/%Y %H")
data$Time <- strptime(data$Time, format="%H:%M:%S")

png("./Exploratory/plot4.png", width=480, height=480)
#plot4
#plot4
par(mfrow=c(2,2))
with(data, {
        plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power")
        plot(DateTime, Voltage, type="l", xlab="datetime", ylab="Voltage")
        plot(DateTime,Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
        lines(DateTime, Sub_metering_2, type="l", col="red")
        lines(DateTime, Sub_metering_3, type="l", col="blue")
        legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty="n", cex=0.9, lty=c(1,1,1), lwd=c(1,1,1), col=c("black", "red", "blue"))
        plot(DateTime, Global_reactive_power, type="l")
})

dev.off()