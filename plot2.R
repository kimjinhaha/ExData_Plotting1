setwd("C:/ProgrammingProjects/Coursera/Course 4/week1/ExData_Plotting1-master")

#reading the downloaded data from the course website
data <- read.table("household_power_consumption.txt", header = TRUE, sep =";", stringsAsFactors=FALSE, dec = ".")

#subsetting data that are only necessary for the exploratory analysis
mydata <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

#converting global_active_power (character) to numeric variable for plotting
mydata$Global_active_power <- as.numeric(mydata$Global_active_power)

#making the datetime variable to make the plot
datetime <- strptime(paste(mydata$Date, mydata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#making the plot
png("plot2.png", width=480, height=480)

with(mydata, plot(datetime, Global_active_power,
                  type = "l", # for lines
                  ylab = "Global Active Power (kilowatts)",
                  xlab = ""))
#saving the plot as .png file
dev.off()