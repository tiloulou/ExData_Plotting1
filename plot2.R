# Plot 2

download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "data.zip", mode = "wb")
unzip("data.zip")
data <- read.csv(file = "household_power_consumption.txt", sep = ";", na.strings = "?")

library(dplyr)
workdata <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")

Dates <- as.Date(workdata$Date, format="%d/%m/%Y")
Times <- workdata$Time
DateTime <- as.POSIXct(paste(as.character(Dates),as.character(Times)))
workdata$DateTime <- DateTime

png(file = "plot2.png")
with(workdata, 
     plot(DateTime, 
          Global_active_power, 
          type = "l", 
          xlab = "", 
          ylab = "Global Active Power (kilowatts)"
          )
     )
dev.off()