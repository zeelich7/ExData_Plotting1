#Read in the power data
file <- "./household_power_consumption.txt"
pwrdata <- read.table(file,header = TRUE,sep = ";",stringsAsFactors = FALSE,na = "?")

# Subset the data for 1st and 2nd Feb 2007
subsetData <- pwrdata[pwrdata$Date %in% c("1/2/2007","2/2/2007") ,]

# Create Date time column
x<-paste(subsetData$Date,subsetData$Time)
subsetData$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")

#Output to a PNG and close connection
png(filename = "plot3.png",width = 480, height = 480, units = "px", bg = "transparent")
plot(subsetData$DateTime,subsetData$Sub_metering_1,xlab="",ylab="Energy sub metering", type="l",col="black")
lines(subsetData$DateTime, subsetData$Sub_metering_2, col = "red")
lines(subsetData$DateTime, subsetData$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2.5, col=c("black", "red", "blue"))
dev.off()