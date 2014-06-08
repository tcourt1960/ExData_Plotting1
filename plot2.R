
# Coursera - Exploratory Data Analysis
#Tom Courtney

# Assignment 1 - plot2.R
# This R code opens the household power consumtumption file and outputs a histogram of Global Active Power
# over the time period Feb 1-2, 2007

data<-read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)
data$DateTime <- strptime(paste(data$Date, data$Time),format="%d/%m/%Y %H:%M:%S")
data$Global_active_power<-as.numeric(data$Global_active_power)
data$Global_reactive_power<-as.numeric(data$Global_reactive_power)
data$Voltage<-as.numeric(data$Voltage)
data$Global_intensity<-as.numeric(data$Global_intensity)
data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)
data$Sub_metering_3<-as.numeric(data$Sub_metering_3)

febdays<-subset(data, as.Date(DateTime, "%Y%m%d")=="2007-02-01" | as.Date(DateTime, "%Y%m%d")=="2007-02-02")


png(filename="plot2.png", width=480, height=480)
plot(febdays$DateTime, febdays$Global_active_power, type="l", main="", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
