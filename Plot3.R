## Plot 3
library(dplyr)
## assumes the working directory contains the datafile
data.df <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";" , na.strings = "?")
## change Date and Time factor variables to datetime variable

data.df$Date <- as.Date(data.df$Date, format = "%d/%m/%Y")
data.df$Global_active_power <- as.numeric(data.df$Global_active_power)
## now filter on only the dates of interest
data.df <- filter(data.df, Date == as.Date("02-01-2007", format = "%m-%d-%Y") | Date == as.Date("02-02-2007", format = "%m-%d-%Y") )
data.df$datetime <- strptime(paste(data.df$Date,data.df$Time), format = "%Y-%m-%d %H:%M:%S")
## add day of week to dataframe
data.df$Day <- weekdays(data.df$datetime)

## set up canvas for plotting
par(mfrow = c(1,1))

## plot the sub metering data
plot(data.df$datetime, data.df$Sub_metering_1, type = "l", main = "", xlab = "", ylab = "Energy sub metering")
lines(data.df$datetime, data.df$Sub_metering_2, col = "red")
lines(data.df$datetime, data.df$Sub_metering_3, col = "blue")
## now create the legend
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1), col=c("black","red","blue"),  cex = .9, xjust = 0)

## had trouble getting the plot to png file with the following code in Rstudio as the text in the legend was being cut off...
##dev.copy(png, file = "plot3.png",width = 800, height = 600,
##        pointsize = 8)
##dev.off()

## ... so solved the problem with and finally send to a .png file
png(file = "plot3.png", width = 480, height = 480)
        ## set up canvas for plotting
        par(mfrow = c(1,1))

        ## plot the sub metering data
        plot(data.df$datetime, data.df$Sub_metering_1, type = "l", main = "", xlab = "", ylab = "Energy sub metering")
        lines(data.df$datetime, data.df$Sub_metering_2, col = "red")
        lines(data.df$datetime, data.df$Sub_metering_3, col = "blue")
        ## now create the legend
        legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1), col=c("black","red","blue"),  cex = .9, xjust = 0)
dev.off()

