filename="household_power_consumption.txt"
  data <- read.table(text = grep("^[1,2]/2/2007", readLines(filename), value = TRUE), 
                   col.names = c("Date", "Time", "Global_active_power", 
                                 "Global_reactive_power", "Voltage", "Global_intensity", 
                                 "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                   sep = ";", header = TRUE)
  #Sets date format  
  data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

  ## date conversion to day format
  dt <- paste(as.Date(data$Date), data$Time)
  data$dt <- as.POSIXct(dt)
  #sets up file
  png(filename="Plot3.png", width=480, height=480)
  #sets up plot area
  with(data,{
    plot(Sub_metering_1~dt,type="l", ylab="Global Active Power(kW)",xlab = "")
    lines(Sub_metering_2~dt, col="Red")
    lines(Sub_metering_3~dt, col= "Blue")
  })
  #sets up legend
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  #turns off write to file
  dev.off()
  