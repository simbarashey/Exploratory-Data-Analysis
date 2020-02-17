#Plotting Assignment 1 for Exploratory Data Analysis


library(data.table)
library(lubridate)
#load data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "e_power_cons.zip")
unzip(zipfile = "e_power_cons.zip", exdir = "e_power_cons")

# plot 2
data2 <- data.table::fread("./e_power_cons/household_power_consumption.txt", na.strings="?")
data2[, Global_active_power:= as.numeric(data2[, Global_active_power])]
data2[, DateTime := strptime(data2[,paste(data2$Date, data2$Time, sep = " ")], format = "%d/%m/%Y %H:%M:%S")]
data2 <- data2[(DateTime >= "2007-02-01 00:00:00") & (DateTime <= "2007-02-02 23:59:00"), ]
#data2[, DateTime := dmy_hms(paste(data2$Date, data2$Time, sep = " "))]
#data2 <- data2[Date == "2007-02-01" | Date == "2007-02-02",]
plot(x = data2[, DateTime], y = data2[, Global_active_power], type = "l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png", width = 480, height = 480, units = "px")
dev.off()