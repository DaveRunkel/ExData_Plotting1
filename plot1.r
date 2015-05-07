# Exploratory Data analysis Assignment 1-- plots

#PUlls Data
filename <- "household_power_consumption.txt"
  data <- read.table(text = grep("^[1,2]/2/2007", readLines(filename), 
                                 value = TRUE), col.names = c("Date", "Time", 
                                                              "Global_active_power", 
                                                              "Global_reactive_power", 
                                                              "Voltage", "Global_intensity",
                                                              "Sub_metering_1", 
                                                              "Sub_metering_2", 
                                                              "Sub_metering_3"), 
                     sep = ";", header = TRUE)
  #sets up file
  png(filename="Plot1.png", width=480, height=480)
  #plots  
  hist(data$Global_active_power,col="red", main =paste("Global Active Power"),
       xlab = "Global Active Power (kW)")
  #turns of file write
  dev.off()
