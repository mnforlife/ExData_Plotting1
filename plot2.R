# Plot 2. plot2 set should be in workdir with scripts.

# Read plot2 data in
plot2 <- read.table(file="household_power_consumption.txt",head=TRUE,sep=";", na.strings = "?")

# Extract needed for plot 2 based on 2 days in feb
plot2 <- plot2[(plot2$Date=="1/2/2007" | plot2$Date=="2/2/2007"),]

# Combine Date and Time using strptime function
plot2$DateTime <- strptime(paste(plot2$Date, plot2$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")


# Plot the graph
plot(plot2$DateTime, plot2$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## Saves plot2 to png and makes it 480x480
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()