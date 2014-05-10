source("readData.R")
x <- readData()

hist(x$Global_active_power, col = "red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.copy(png, filename = "plot1.png")
dev.off()
