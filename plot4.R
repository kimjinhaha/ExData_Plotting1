#reading the downloaded data from the course website, the data should be located in the same folder
data <- read.table("household_power_consumption.txt", header = TRUE, sep =";", stringsAsFactors=FALSE, dec = ".")

#subsetting data that are only necessary for the exploratory analysis
mydata <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

#making the datetime variable to make the plot
datetime <- strptime(paste(mydata$Date, mydata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#converting character variables to numeric
mydata$Global_active_power <- as.numeric(mydata$Global_active_power)
mydata$Voltage <- as.numeric(mydata$Voltage)
mydata$Global_reactive_power <- as.numeric(mydata$Global_reactive_power)
mydata$Sub_Metering_1 <- as.numeric(mydata$Sub_metering_1)
mydata$Sub_Metering_2 <- as.numeric(mydata$Sub_metering_2)
mydata$Sub_Metering_3 <- as.numeric(mydata$Sub_metering_3)

#making the plot, using par() to represent 4 plots together
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

#first plot
with(mydata, plot(datetime, Global_active_power,
                  type = "l", # for lines
                  ylab = "Global Active Power (kilowatts)",
                  xlab = ""))

with(mydata, plot(datetime, Voltage,
                  type = "l", # for lines
                  ylab = "Voltage",
                  xlab = "datetime"))

with(mydata, plot(datetime, Sub_Metering_1,
                  type = "l", ## for lines
                  ylab = "Energy Submetering",
                  xlab = ""))

with(mydata, lines(datetime, Sub_Metering_2, type="l", col="red"))
with(mydata, lines(datetime, Sub_Metering_3, type="l", col="blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

with(mydata, plot(datetime, Global_reactive_power,
                  type = "l",
                  ylab = "Global_reactive_power",
                  xlab = "datetime"))

dev.off()