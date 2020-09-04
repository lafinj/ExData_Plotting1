library(tidyverse)
library(lubridate)

data <- read_delim("household_power_consumption.txt", delim = ';')
data$Date <- data$Date %>% dmy()
data <- data %>% filter(Date == mdy('02-01-2007') | Date == mdy('02-02-2007'))

png("plot1.png", width = 480, height = 480)
with(data, hist(Global_active_power, 
                main = "Global Active Power", 
                xlab = "Global Active Power (kilowatts)", 
                col = "red"))
dev.off()