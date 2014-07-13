##Creates line plot of sub metering data by day

##Assumes data to be read is in working directory
rawData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
##turn Date column into Date class
rawData$Date <- strptime(rawData$Date,format = "%d/%m/%Y")
rawData$Date <- as.Date(rawData$Date)

##Subset for 2007-02-01 and 2007-02-02
plotData <- rawData[rawData$Date == "2007-02-01" | rawData$Date == "2007-02-02",]

##create date and time column
dateTime <- strptime(paste(plotData$Date, plotData$Time), format = "%Y-%m-%d %H:%M:%S")

##add dateTime to plotData data frame
plotData <- cbind(plotData, dateTime)

print("Data Imported")

##create png file
png("plot3.png", height = 480, width = 480, units = "px")

##Create plot area
with(plotData, plot(plotData$dateTime, plotData$Sub_metering_1, type = "n", xlab = NA, ylab = "Energy Sub Metering"))
points(plotData$dateTime, plotData$Sub_metering_1, type = "l", col = "Black")
points(plotData$dateTime, plotData$Sub_metering_2, type = "l", col = "Red")
points(plotData$dateTime, plotData$Sub_metering_3, type = "l", col = "Blue")
legend("topright", c("Sub metering 1", "Sub metering 2", "Sub metering 3"), lty = c(1,1,1), col = c("Black", "Red", "Blue"))


dev.off()

print("Plot Created")
