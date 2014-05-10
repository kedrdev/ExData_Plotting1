source("readData.R")
x <- readData()

Sys.setlocale(category = "LC_TIME", locale = "C")

png(filename="plot3.png")

plot(x$DateTime, x$Sub_metering_1, type="l", xlab="",
     ylab="Energy sub metering")
lines(x$DateTime, x$Sub_metering_2, col="red")
lines(x$DateTime, x$Sub_metering_3, col="blue")

legend("topright", lty=1, col=c("black", "blue", "red"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()

Sys.setlocale(category = "LC_ALL", locale = "")