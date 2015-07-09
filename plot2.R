#Read in the power data
file <- "./household_power_consumption.txt"
pwrdata <- read.table(file,header = TRUE,sep = ";",stringsAsFactors = FALSE,na = "?")

# Subset the data for 1st and 2nd Feb 2007
subsetData <- pwrdata[pwrdata$Date %in% c("1/2/2007","2/2/2007") ,]

# Create Date time column
x<-paste(subsetData$Date,subsetData$Time)
subsetData$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")

#Output to a PNG and close connection
png(filename = "plot2.png",width = 480, height = 480, units = "px", bg = "transparent")
plot(subsetData$DateTime,subsetData$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)", type="l")
dev.off()