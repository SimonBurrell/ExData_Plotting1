## S J Burrell        26-03-2017
##Code1 for Exploring Data Assgnment week 1 - Plot4
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


#create plot 4
par(mfcol = c(2, 2))


plot(EnergySub$DateTime,
     EnergySub$Global_active_power,
     type = "line",
     xlab = "",
     ylab = "Global Active Power")



plot(EnergySub$DateTime,
     EnergySub$Sub_metering_1,
     "n",
     xlab = "",
     ylab = "Energy sub metering")

points(EnergySub$DateTime, EnergySub$Sub_metering_1, type = "line")

points(EnergySub$DateTime,EnergySub$Sub_metering_2, type = "line", col = "red")

points(EnergySub$DateTime, EnergySub$Sub_metering_3, type = "line", col = "blue")

legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = c(1, 1, 1),
       bty = "n")

plot(EnergySub$DateTime,
     EnergySub$Voltage,
     type = "line",
     xlab = "datetime",
     ylab = "Voltage")

plot(EnergySub$DateTime,
     EnergySub$Global_reactive_power,
     type = "line",
     xlab = "datetime",
     ylab = "Global_reactive_power")


dev.copy(png, file = "Plot4.png", width = 480, height = 480, units = "px")
dev.off()