setwd("C:/ProgrammingProjects/Coursera/Course 4/week1/ExData_Plotting1-master")

#reading the downloaded data from the course website
data <- read.table("household_power_consumption.txt", header = TRUE, sep =";", stringsAsFactors=FALSE, dec = ".")

#subsetting data that are only necessary for the exploratory analysis
mydata <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

#converting global_active_power (character) to numeric variable for plotting
mydata$Global_active_power <- as.numeric(mydata$Global_active_power)

#making the histogram, with title, and x variable lable, color, and break
png("plot1.png", width=480, height=480)

with(mydata, hist(Global_active_power, 
                  main = "Global Active Power", breaks = 20,
                  xlab = "Global Active Power (kilowatts)",
                  col = "red"))

#saving the histogram as .png file
dev.off()