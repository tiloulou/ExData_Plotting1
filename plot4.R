# Plot 4
download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "data.zip", mode = "wb")
unzip("data.zip")
data <- read.csv(file = "household_power_consumption.txt", sep = ";", na.strings = "?")

library(dplyr)
workdata <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")

Dates <- as.Date(workdata$Date, format="%d/%m/%Y")
Times <- workdata$Time
DateTime <- as.POSIXct(paste(as.character(Dates),as.character(Times)))
workdata$DateTime <- DateTime

png(file = "plot4.png")

par(mfrow = c(2, 2))

# First graphic
with(workdata, 
     plot(DateTime, 
          Global_active_power, 
          type = "l", 
          xlab = "", 
          ylab = "Global Active Power"
     )
)

# Graphic number 2
with(workdata, 
     plot(DateTime, 
          Voltage, 
          type = "l", 
          xlab = "datetime", 
          ylab = "Voltage"
     )
)


# Graphic number 3
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

# Graphic number 4
with(workdata, 
     plot(DateTime, 
          Global_reactive_power, 
          type = "l", 
          xlab = "datetime", 
          ylab = "Global_reactive_power"
     )
)


dev.off()