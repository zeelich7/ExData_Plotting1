#Read in the power data
file <- "./household_power_consumption.txt"
pwrdata <- read.table(file,header = TRUE,sep = ";",stringsAsFactors = FALSE,na = "?")

## Subset the data for 1st and 2nd Feb 2007
subsetData <- pwrdata[pwrdata$Date %in% c("1/2/2007","2/2/2007") ,]

#Output to a PNG and close connection
png(filename = "plot1.png",width = 480, height = 480, units = "px", bg = "transparent")
hist(subsetData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)",breaks = 12, ylim = c(0, 1200))
dev.off()