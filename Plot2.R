
data.df <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";" , na.strings = "?")
## change Date and Time factor variables to datetime variable

data.df$Date <- as.Date(data.df$Date, format = "%d/%m/%Y")
data.df$Global_active_power <- as.numeric(data.df$Global_active_power)
## now filter on only the dates of interest
data.df <- filter(data.df, Date == as.Date("02-01-2007", format = "%m-%d-%Y") | Date == as.Date("02-02-2007", format = "%m-%d-%Y") )
data.df$datetime <- strptime(paste(data.df$Date,data.df$Time), format = "%Y-%m-%d %H:%M:%S")
## add day of week to dataframe
data.df$Day <- weekdays(data.df$datetime)

par(mfrow = c(1,1))


plot(data.df$datetime, data.df$Global_active_power, type = "l", main = "", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()