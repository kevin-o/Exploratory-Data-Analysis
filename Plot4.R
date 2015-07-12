## Plot 4
library(dplyr)
## assumes data file resides in current working directory
data.df <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";" , na.strings = "?")

## change Date variable to Date format
data.df$Date <- as.Date(data.df$Date, format = "%d/%m/%Y")
data.df$Global_active_power <- as.numeric(data.df$Global_active_power)

## now filter on only the dates of interest
data.df <- filter(data.df, Date == as.Date("02-01-2007", format = "%m-%d-%Y") | Date == as.Date("02-02-2007", format = "%m-%d-%Y") )

# create new variable combining date and time
data.df$datetime <- strptime(paste(data.df$Date,data.df$Time), format = "%Y-%m-%d %H:%M:%S")

## add day of week to dataframe
data.df$Day <- weekdays(data.df$datetime)


png(file = "plot4.png", width = 480, height = 480)
        #create four plotting areas on the canvas
        par(mfrow = c(2,2))

        # plot the first quadrant
        plot(data.df$datetime, data.df$Global_active_power, type = "l", main = "", xlab = "", ylab = "Global Active Power (kilowatts)")

        #plot the upper right quadrant
        plot(data.df$datetime, data.df$Voltage, type = "l", main = "", xlab = "", ylab = "Voltage")

        #plot the lower left quadrant
        plot(data.df$datetime, data.df$Sub_metering_1, type = "l", main = "", xlab = "", ylab = "Energy sub metering")
        lines(data.df$datetime, data.df$Sub_metering_2, col = "red")
        lines(data.df$datetime, data.df$Sub_metering_3, col = "blue")

        ## now create the legend
        legend("topright",inset = .1, c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1), col=c("black","red","blue"), bty = "n", pt.cex = 1, cex = .8)

        ## plot the lower right quadrant
        plot(data.df$datetime, data.df$Global_reactive_power, type = "l", main = "", xlab = "", ylab = "Global Reactive Power")
dev.off()
## and finally send to a .png file
## dev.copy(png, file = "plot4.png", width = 800, height = 600,
 ##        pointsize = 12)
## dev.off()