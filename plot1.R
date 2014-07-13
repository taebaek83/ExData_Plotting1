##plot1.R creates histogram plot with red bars and appropriate axes labels

##Assumes data to be read is in working directory
rawData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
##turn Date column into Date class
rawData$Date <- strptime(rawData$Date,format = "%d/%m/%Y")
rawData$Date <- as.Date(rawData$Date)

##Subset for 2007-02-01 and 2007-02-02
plotData <- rawData[rawData$Date == "2007-02-01" | rawData$Date == "2007-02-02",]

print("Data Imported")

##Create png file
png("plot1.png")

##Create histogram
with(plotData, hist(plotData$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))

dev.off()
print("Plot Created")