# Plot 1

download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "data.zip", mode = "wb")
unzip("data.zip")
data <- read.csv(file = "household_power_consumption.txt", sep = ";", na.strings = "?")

library(dplyr)
workdata <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")

png(file = "plot1.png")
hist(x = workdata$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

