## S J Burrell        26-03-2017
##Code1 for Exploring Data Assgnment week 1 - Plot1
setwd("~/R/DataExplore1")
library(lubridate)

#read in the large file
fileN <- "household_power_consumption.txt"
readLines(con = fileN, n = 1L)
headernames = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
EnergySub <- read.csv(fileN, header = TRUE, sep=";", na.strings = "?", col.names = headernames)
#head(EnergySub)
#str(EnergySub)

#convert the date field
EnergySub$Date <- dmy(EnergySub$Date)

#get the data for dates 2007-02-01 and 2007-02-02.
EnergySub <-subset(EnergySub, Date == "2007-02-01" | Date == "2007-02-02")

#convert the datetime
EnergySub$DateTime <- as.POSIXct(paste(EnergySub$Date, EnergySub$Time))

#create plot 1
## width = 480, height = 480, units = "px"
hist(EnergySub$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "Plot1.png")
dev.off()