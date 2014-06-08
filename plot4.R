
# Coursera - Exploratory Data Analysis
#Tom Courtney

# Assignment 1 - plot4.R
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


#Open png file
png(filename="plot4.png", width=480, height=480)

#Prepare to plot columnwise
par(mfcol=c(2,2))

#Upper Left Plot
plot(febdays$DateTime, febdays$Global_active_power, type="l", main="", xlab="", ylab="Global Active Power (kilowatts)")


#Lower Left Plot
plot(febdays$DateTime, febdays$Sub_metering_1,col="black", type="l",ylab="Energy sub metering", xlab="")
lines(febdays$DateTime, febdays$Sub_metering_2, type="l",col="red")
lines(febdays$DateTime, febdays$Sub_metering_3, type="l",col="blue")
legend("topright",legend=c("sub_metering_1","sub_metering_2","sub_metering_3"),bty = "n" ,lty = c(1, 1, 1),col=c("black","red","blue"))


#Upper Right Plot
plot(febdays$DateTime,febdays$Voltage, col="black", type = "l",ylab="Voltage",xlab="datetime")


#Lower Right Plot
plot(febdays$DateTime,febdays$Global_reactive_power, col="black", type = "l",ylab="Global_reactive_power",xlab="datetime")

#Close the file
dev.off()
