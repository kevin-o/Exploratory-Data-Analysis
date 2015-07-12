## Plot 1
library(dplyr)

## assumes data file is in the current working directory
 data.df <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";" , na.strings = "?")

## change Date and Time factor variables to datetime variable
data.df$Date <- as.Date(data.df$Date, format = "%d/%m/%Y")
## now filter on only the dates of interest
data.df <- filter(data.df, Date == as.Date("02-01-2007", format = "%m-%d-%Y") | Date == as.Date("02-02-2007", format = "%m-%d-%Y") )
## the following is required for subsequent plots 
data.df$datetime <- strptime(paste(data.df$Date,data.df$Time), format = "%Y-%m-%d %H:%M:%S")

## 
hist(data.df$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)" ,main = "Global Active Power")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()