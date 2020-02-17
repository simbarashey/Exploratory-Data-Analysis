#Plotting Assignment 1 for Exploratory Data Analysis


library(data.table)
library(lubridate)
#load data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "e_power_cons.zip")
unzip(zipfile = "e_power_cons.zip", exdir = "e_power_cons")

# plot 4
data4 <- data.table::fread("./e_power_cons/household_power_consumption.txt", na.strings="?")
data4[, Global_active_power:= as.numeric(data4[, Global_active_power])]
data4[, DateTime := strptime(data4[,paste(data4$Date, data4$Time, sep = " ")], format = "%d/%m/%Y %H:%M:%S")]
data4 <- data4[(DateTime >= "2007-02-01 00:00:00") & (DateTime <= "2007-02-02 23:59:00"), ]
par(mfrow=c(2,2))
plot(x = data4[, DateTime], y = data4[, Global_active_power], type = "l", xlab="", ylab="Global Active Power (kilowatts)")
plot(x = data4[, DateTime], y = data4[, Voltage], type = "l", xlab="", ylab="Voltage")
plot(x = data4[, DateTime], y = data4[, Sub_metering_1], type = "l", xlab="", ylab="Energy sub metering")
lines(data4[, DateTime], data4[, Sub_metering_2], col="red")
lines(data4[, DateTime], data4[, Sub_metering_3], col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=c(1,1), lwd=c(1,1), cex=.5)
plot(x = data4[, DateTime], y = data4[, Global_reactive_power], type = "l", xlab="datetime", ylab="Global_reactive_power")
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()