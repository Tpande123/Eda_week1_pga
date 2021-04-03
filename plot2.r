full_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
data <- subset(full_data, Date %in% c("1/2/2007","2/2/2007"))
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 2
with(data, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Activsse Power (kilowatts)", xlab="")
})

dev.copy(png, file="plot2.png", height=480, width=480)