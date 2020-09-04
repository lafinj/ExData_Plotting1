library(tidyverse)
library(lubridate)

data <- read_delim("household_power_consumption.txt", delim = ';')
data$Date <- data$Date %>% dmy()
data <- data %>% filter(Date == mdy('02-01-2007') | Date == mdy('02-02-2007'))
dateTime <- ymd_hms(paste(data$Date, data$Time))


png("plot3.png", width = 480, height = 480)
plot(dateTime, data$Sub_metering_1, 
     type = 'l', 
     xlab = '', 
     ylab = 'Energy sub metering')
lines(dateTime, data$Sub_metering_2, col = 'red')
lines(dateTime, data$Sub_metering_3, col = 'blue')
legend("topright", 
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"), 
       lty = 1,
       col = c('black','red','blue'))
dev.off()