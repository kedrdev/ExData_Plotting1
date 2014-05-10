source("readData.R")
x <- readData()

Sys.setlocale(category = "LC_TIME", locale = "C")

plot(x$DateTime, x$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")
dev.copy(png, filename = "plot2.png")
dev.off()

Sys.setlocale(category = "LC_ALL", locale = "")