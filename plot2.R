##Creates line plot of Global Active Power by day

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
png("plot2.png", height = 480, width = 480, units = "px")

##create line plot
with(plotData, plot(plotData$dateTime, plotData$Global_active_power, type = "l", xlab = NA, ylab = "Global Active Power (kilowatts)"))

dev.off()
print("Plot Created")