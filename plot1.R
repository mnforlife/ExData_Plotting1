assign1 <- read.table(file="household_power_consumption.txt",head=TRUE,sep=";", na.strings = "?")
##str(assign1)
##head(mydata, n=10)

##reformating date
assign1$Date <- as.Date(assign1$Date, format="%d/%m/%Y")

##subsetting data for two days in feb 2007 
newdata <- subset(assign1, subset= (Date >= "2007-02-01" & Date <= "2007-02-02")) 
                  


## Plot 1
hist(newdata$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")

## Saves data to png and makes it 480x480
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()