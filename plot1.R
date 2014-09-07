# Common steps for all the plots 

data <- read.table("./Exploratory Data Analysis/exdata_data_household_power_consumption/household_power_consumption.txt",sep =";",header=TRUE)
data$Timestamp <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date, format = "%d/%m/%Y")
# subset the data for Date = 1/2/2007 and 2/2/2007
filterdata <- subset(data,data$Date %in%  c(as.Date("2007-02-01"),as.Date("2007-02-02")))

# Specific Code for Plot1
filterdata$Global_active_power<-as.numeric(as.character(filterdata$Global_active_power))
png(file= "plot1.png")
plot1<-hist((filterdata$Global_active_power),col="red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)",ylab = "Frequency")
dev.off()Enter file contents here
