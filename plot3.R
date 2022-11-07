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

#  Plot 3

plot3 <- plot(x = plotData$DateTime
            , y = plotData$Sub_metering_1
            , type = "l"
            , ylab = "Energy sub metering"
            , xlab = ""
            , col = "black")
         lines(x = plotData$DateTime   # Adding new variable as lines
             , y = plotData$Sub_metering_2
             , col = "red")
         lines(x = plotData$DateTime   # Adding new variable as lines
             , y = plotData$Sub_metering_3
             , col = "blue")
         legend("topright"        # Adding the legend. 
                                  # The spaces are to prevent the legend from cropping during saving
              , legend = c("Sub_metering_1     ", "Sub_metering_2     ", "Sub_metering_3     ")
              , col = c("black", "red", "blue")
              , lty = 1)
         
#  Saving the plot to .png file        

dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off() 
