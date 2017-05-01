
setwd('C:\\Users\\tytsang\\Desktop\\Coursera\\4- Exploratory Wk1\\')

powr <- read.table('household_power_consumption.txt', sep = ";", header = TRUE, na.strings = "?")
powr$Date <- as.Date(strptime(powr$Date, "%d/%m/%Y"))
#powr$Time <- as.POSIXct(strptime(powr$Time, "%H:%M:%S"))
powr <- powr[powr$Date == "2007-02-01"|powr$Date == "2007-02-02",]
powr$wkday <- weekdays(powr$Date, abbreviate = TRUE)
powr$fulltime <- as.POSIXct(paste(powr$Date, powr$Time), format="%Y-%m-%d %H:%M:%S")


#plot 1
par(mfrow = c(1,1))
png(file = "plot1.png", width = 480, height = 480)
hist(powr$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()

#plot2
par(mfrow = c(1,1))
png(file = "plot2.png", width = 480, height = 480)
plot(powr$fulltime, powr$Global_active_power, type = "l", main = "", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()

#plot3
par(mfrow = c(1,1))
png(file = "plot3.png", width = 480, height = 480)
plot(powr$fulltime, powr$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering") 
  lines(powr$fulltime, powr$Sub_metering_2, col = "red") 
  lines(powr$fulltime, powr$Sub_metering_3, col = "blue") 
  legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lwd = c(2,2,2))
dev.off()

#plot 4
png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot(powr$fulltime, powr$Global_active_power, type = "l", main = "", ylab = "Global Active Power (kilowatts)", xlab = "")

plot(powr$fulltime, powr$Voltage, type = "l", ylab = "Voltage")

plot(powr$fulltime, powr$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering") 
  lines(powr$fulltime, powr$Sub_metering_2, col = "red") 
  lines(powr$fulltime, powr$Sub_metering_3, col = "blue") 
  legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lwd = c(2,2,2))

plot(powr$fulltime, powr$Global_reactive_power, type = "l")
dev.off()



