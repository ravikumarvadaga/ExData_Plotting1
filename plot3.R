# Common steps for all the plots 

data <- read.table("./Exploratory Data Analysis/exdata_data_household_power_consumption/household_power_consumption.txt",sep =";",header=TRUE)
data$Timestamp <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date, format = "%d/%m/%Y")
# subset the data for Date = 1/2/2007 and 2/2/2007
filterdata <- subset(data,data$Date %in%  c(as.Date("2007-02-01"),as.Date("2007-02-02")))

# Specific Code for Plot3
png(file = "plot3.png")
plot3 <-plot(filterdata$Timestamp,filterdata$Sub_metering_1,type = "n",ylab = "Energy sub metering",xlab ="Days")
lines(filterdata$Timestamp, filterdata$Sub_metering_1, type = "l", col = "black")
lines(filterdata$Timestamp, filterdata$Sub_metering_2, type = "l", col = "red")
lines(filterdata$Timestamp, filterdata$Sub_metering_3, type = "l", col = "blue")
plot3<-legend(x="topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       pch = NA, lty = 1 , col = c("black", "red", "blue"))
dev.off()
