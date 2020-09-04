library(tidyverse)
library(lubridate)

data <- read_delim("household_power_consumption.txt", delim = ';')
data$Date <- data$Date %>% dmy()
data <- data %>% filter(Date == mdy('02-01-2007') | Date == mdy('02-02-2007'))
dateTime <- ymd_hms(paste(data$Date, data$Time))


png("plot2.png", width = 480, height = 480)
plot(dateTime, data$Global_active_power, 
     type = 'l', 
     ylab = 'Global Active Power (kilowatts)', 
     xlab = '')
dev.off()