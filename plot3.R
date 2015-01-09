# Plot 3

download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "data.zip", mode = "wb")
unzip("data.zip")
data <- read.csv(file = "household_power_consumption.txt", sep = ";", na.strings = "?")

library(dplyr)
workdata <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")

Dates <- as.Date(workdata$Date, format="%d/%m/%Y")
Times <- workdata$Time
DateTime <- as.POSIXct(paste(as.character(Dates),as.character(Times)))
workdata$DateTime <- DateTime

png(file = "plot3.png")
with(workdata, 
     plot(DateTime, 
          Sub_metering_1, 
          type = "s", 
          xlab = "", 
          ylab = "Energy sub metering",
          col = "black"
          )
     )
with(workdata, 
     points(DateTime, 
          Sub_metering_2, 
          type = "s", 
          col = "red"
     )
)
with(workdata, 
     points(DateTime, 
            Sub_metering_3, 
            type = "s", 
            col = "blue"
     )
)
legend("topright", pch = "_", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()