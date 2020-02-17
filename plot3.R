#Plotting Assignment 1 for Exploratory Data Analysis


library(data.table)
library(lubridate)
#load data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "e_power_cons.zip")
unzip(zipfile = "e_power_cons.zip", exdir = "e_power_cons")

# plot 3
data3 <- data.table::fread("./e_power_cons/household_power_consumption.txt", na.strings="?")
data3[, Global_active_power:= as.numeric(data3[, Global_active_power])]
data3[, DateTime := strptime(data3[,paste(data3$Date, data3$Time, sep = " ")], format = "%d/%m/%Y %H:%M:%S")]
data3 <- data3[(DateTime >= "2007-02-01 00:00:00") & (DateTime <= "2007-02-02 23:59:00"), ]
plot(x = data3[, DateTime], y = data3[, Sub_metering_1], type = "l", xlab="", ylab="Energy sub metering")
lines(data3[, DateTime], data3[, Sub_metering_2], col="red")
lines(data3[, DateTime], data3[, Sub_metering_3], col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=c(1,1), lwd=c(1,1))
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()