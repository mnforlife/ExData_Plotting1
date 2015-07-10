# Plot 3. 

# Read plot3 data in
plot3 <- read.table(file="household_power_consumption.txt",head=TRUE,sep=";", na.strings = "?")

# Extract needed for plot 2 based on 2 days in feb
plot3 <- plot3[(plot3$Date=="1/2/2007" | plot3$Date=="2/2/2007"),]

# Combine Date and Time using strptime function
plot3$DateTime <- strptime(paste(plot3$Date, plot3$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")


# create the plot
plot(plot3$DateTime, plot3 $Sub_metering_1, type="l", col="black",
     xlab="", ylab="Energy sub metering")
lines(plot3$DateTime, plot3$Sub_metering_2, col="red")
lines(plot3$DateTime, plot3$Sub_metering_3, col="blue")
legend("topright",
       col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1)

## Saves plot2 to png and makes it 480x480
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
