#Plotting Assignment 1 for Exploratory Data Analysis


library(data.table)
library(lubridate)
#load data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "e_power_cons.zip")
unzip(zipfile = "e_power_cons.zip", exdir = "e_power_cons")

# plot 1
data1 <- data.table::fread("./e_power_cons/household_power_consumption.txt", na.strings="?")
#Convert character dates to date class with lubridate package and Global Active Power to numeric
data1[, Date:= dmy(data1[, Date])]
data1[, Time:= hms(data1[, Time])]
data1[, Global_active_power:= as.numeric(data1[, Global_active_power])]
data_plot1 <- data1[Date == "2007-02-01" | Date == "2007-02-02", Global_active_power]
hist(data_plot1, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px")
dev.off()