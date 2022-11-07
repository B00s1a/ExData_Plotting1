setwd("C:/DiskD/Courses/Part_4/Week_1")

library("dplyr")

plotData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

#  Preparing the data: change of date and time class, creating one more variable - DateTime
#  which contains both, date and time. Plus, filtering the data for two needed dates.

plotData <- plotData %>%
  mutate(DateTime = strptime(paste(plotData[["Date"]]
                                 , plotData[["Time"]]
                                 , sep = " ")
                           , format = "%d/%m/%Y %H:%M:%S")) %>%
  filter(grepl("2007-02-01|2007-02-02", DateTime))

#  Changing the local language of the system to English, so weekdays will appear in English

Sys.setlocale("LC_TIME", "en_US")

#  Plot 2 

plot2 <- plot(x = plotData$DateTime
            , y = as.numeric(plotData$Global_active_power)
            , type = "l"
            , ylab = "Global active power (kilowatts)"
            , xlab = "")
  
#  Saving the plot to .png file

dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off() 
  






