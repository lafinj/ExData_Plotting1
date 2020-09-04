library(tidyverse)
library(lubridate)

data <- read_delim("household_power_consumption.txt", delim = ';')
data$Date <- data$Date %>% dmy()
data <- data %>% filter(Date == mdy('02-01-2007') | Date == mdy('02-02-2007'))
dateTime <- ymd_hms(paste(data$Date, data$Time))


png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot(dateTime, data$Global_active_power, 
     type = 'l', 
     ylab = 'Global Active Power', 
     xlab='')
plot(dateTime, data$Voltage, 
     type = 'l', 
     ylab = 'Voltage', 
     xlab = 'datetime')
plot(dateTime, data$Sub_metering_1, 
     type = 'l', 
     xlab = '', 
     ylab = 'Energy sub metering')
lines(dateTime, data$Sub_metering_2, col = 'red')
lines(dateTime, data$Sub_metering_3, col = 'blue')
legend("topright", 
       box.lty = 0,
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"), 
       lty = 1,
       col = c('black','red','blue'))
plot(dateTime, data$Global_reactive_power, 
     type = 'l', 
     xlab = 'datetime', 
     ylab = 'Global_reactive_power')
dev.off()