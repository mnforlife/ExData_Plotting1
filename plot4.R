# Plot 4. 

# Read plot3 data in
plot4 <- read.table(file="household_power_consumption.txt",head=TRUE,sep=";", na.strings = "?")

# Extract needed for plot 2 based on 2 days in feb
plot4 <- plot4[(plot4$Date=="1/2/2007" | plot4$Date=="2/2/2007"),]

# Combine Date and Time using strptime function
plot4$DateTime <- strptime(paste(plot4$Date, plot4$Time, sep=" "), 
                           format="%d/%m/%Y %H:%M:%S")

## 2x2 four panel plot
par(mfrow=c(2,2))

## Plot 1
plot(plot4$DateTime, plot4$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power")


# Plot 2 

plot(plot4$DateTime, plot4$Voltage, type="l",
     xlab="datetime", ylab="Voltage")

# Plot 3
plot(plot4$DateTime, plot4$Sub_metering_1, type="l", col="black",
     xlab="", ylab="Energy sub metering")
lines(plot4$DateTime, plot4$Sub_metering_2, col="red")
lines(plot4$DateTime, plot4$Sub_metering_3, col="blue")
legend("topright",
       col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1)

#plot 4
plot(plot4$DateTime, plot4$Global_reactive_power, type="n",
     xlab="datetime", ylab="Global_reactive_power")
lines(plot4$DateTime, plot4$Global_reactive_power)

## Saves panels for plot4 to png and makes it 480x480
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()