readData <- function() {
        csvFile <- "./data/household_power_consumption.txt"
        if (!file.exists(csvFile)) {
                temp <- tempfile()
                download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
                unzip(temp, exdir="./data")
                unlink(temp)       
        }
        
        x<-read.csv(csvFile, sep=";", nrows=1)
        x<-read.csv(csvFile, sep=";", nrows=1E4, skip=6E4, col.names=names(x))

        x <- x[as.Date(x$Date, format="%d/%m/%Y") >= as.Date("2007-02-01") & as.Date(x$Date, format="%d/%m/%Y") <= as.Date("2007-02-02"),]
        
        x$DateTime <- strptime(paste(x$Date, x$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

        x$Global_active_power <- as.numeric(levels(x$Global_active_power))[x$Global_active_power]
        x$Sub_metering_1 <- as.numeric(levels(x$Sub_metering_1))[x$Sub_metering_1]
        x$Sub_metering_2 <- as.numeric(levels(x$Sub_metering_2))[x$Sub_metering_2]
        x$Voltage <- as.numeric(levels(x$Voltage))[x$Voltage]
        x$Global_reactive_power <- as.numeric(levels(x$Global_reactive_power))[x$Global_reactive_power]
        x
}