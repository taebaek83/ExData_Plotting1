##Creates a pane of four plots

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
png("plot4.png")

##Create 2x2 pane for plots
par(mfrow = c(2,2))

##First plot
with(plotData, plot(plotData$dateTime, plotData$Global_active_power, type = "l", xlab = NA, ylab = "Global Active Power (kilowatts)"))

##Second plot
with(plotData, plot(plotData$dateTime, plotData$Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

##Third plot
#Create plot area
with(plotData, plot(plotData$dateTime, plotData$Sub_metering_1, type = "n", xlab = NA, ylab = "Energy Sub Metering"))
points(plotData$dateTime, plotData$Sub_metering_1, type = "l", col = "Black")
points(plotData$dateTime, plotData$Sub_metering_2, type = "l", col = "Red")
points(plotData$dateTime, plotData$Sub_metering_3, type = "l", col = "Blue")
legend("topright", c("Sub metering 1", "Sub metering 2", "Sub metering 3"), lty = c(1,1,1), col = c("Black", "Red", "Blue"))

##Fourth plot
with(plotData, plot(plotData$dateTime, plotData$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))


dev.off()

print("Plot Created")