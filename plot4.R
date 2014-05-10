source("readData.R")
x <- readData()

Sys.setlocale(category = "LC_TIME", locale = "C")

png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

plot(x$DateTime, x$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")
plot(x$DateTime, x$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(x$DateTime, x$Sub_metering_1, type="l", xlab="",
     ylab="Energy sub metering")
lines(x$DateTime, x$Sub_metering_2, col="red")
lines(x$DateTime, x$Sub_metering_3, col="blue")
legend("topright", bty="n", lty=1, col=c("black", "blue", "red"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(x$DateTime, x$Global_reactive_power, type="l", xlab="datetime", 
     ylab="Global_reactive_power")

dev.off()

Sys.setlocale(category = "LC_ALL", locale = "")