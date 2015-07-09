#Read in the power data
file <- "./household_power_consumption.txt"
pwrdata <- read.table(file,header = TRUE,sep = ";",stringsAsFactors = FALSE,na = "?")

# Subset the data for 1st and 2nd Feb 2007
subsetData <- pwrdata[pwrdata$Date %in% c("1/2/2007","2/2/2007") ,]

# Create Date time column
x<-paste(subsetData$Date,subsetData$Time)
subsetData$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")

#Output to a PNG and close connection
png(filename = "plot4.png",width = 480, height = 480, units = "px", bg = "transparent")
par(mfrow = c(2,2))

#top left
plot(subsetData$DateTime,subsetData$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)", type="l")

#top right
plot(subsetData$DateTime,subsetData$Voltage,xlab="datetime",ylab="voltage",type="l")

#bottom left
plot(subsetData$DateTime,subsetData$Sub_metering_1,xlab="",ylab="Energy sub metering", type="l",col="black")
lines(subsetData$DateTime, subsetData$Sub_metering_2, col = "red")
lines(subsetData$DateTime, subsetData$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2.5, col=c("black", "red", "blue"))

#bottom right
plot(subsetData$DateTime,subsetData$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")

dev.off()