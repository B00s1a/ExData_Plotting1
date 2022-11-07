setwd("C:/DiskD/Courses/Part_4/Week_1")

library("dplyr")

#  Preparing the data: change of date and time class, creating one more variable - DateTime
#  which contains both, date and time. Plus, filtering the data for two needed dates.

plotData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

plotData <- plotData %>%
  mutate(DateTime = strptime(paste(plotData[["Date"]]
                                   , plotData[["Time"]]
                                   , sep = " ")
                           , format = "%d/%m/%Y %H:%M:%S")) %>%
  filter(grepl("2007-02-01|2007-02-02", DateTime))

#  Changing the local language of the system to English, so weekdays will appear in English

Sys.setlocale("LC_TIME", "en_US")

#  Creating the grid 2 by 2 to fill four mini plots in one

par(mfrow = c(2,2))

#  Plot 1

plot(x = plotData$DateTime
   , y = as.numeric(plotData$Global_active_power)
   , type = "l"
   , ylab = "Global active power (kilowatts)"
   , xlab = "")

#  Plot 2

plot(x = plotData$DateTime
   , y = as.numeric(plotData$Voltage)
   , type = "l"
   , ylab = "Voltage"
   , xlab = "datetime")

#  Plot 3

plot(x = plotData$DateTime
   , y = plotData$Sub_metering_1
   , type = "l"
   , ylab = "Energy sub metering"
   , xlab = ""
   , col = "black")
lines(x = plotData$DateTime
    , y = plotData$Sub_metering_2
    , col = "red")
lines(x = plotData$DateTime
    , y = plotData$Sub_metering_3
    , col = "blue")
legend("topright"
     , legend = c("Sub_metering_1  ", "Sub_metering_2   ", "Sub_metering_3   ")
     , col = c("black", "red", "blue")
     , lty = 1
     , bty = "n"  # No outlines of the legend box
     , y.intersp = c(0.35)  # Reducing the spaces between description lines in legend
     , cex = 0.9)

#  Plot 4

plot(x = plotData$DateTime
   , y = as.numeric(plotData$Global_reactive_power)
   , type = "l"
   , ylab = "Global_reactive_power"
   , xlab = "datetime")

#  Saving the plot to .png file    

dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off() 







