# Getting 2 day data
  filename="household_power_consumption.txt"
  data <- read.table(text = grep("^[1,2]/2/2007", readLines(filename), value = TRUE), 
                   col.names = c("Date", "Time", "Global_active_power", 
                                 "Global_reactive_power", "Voltage", "Global_intensity", 
                                 "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                   sep = ";", header = TRUE)
#Sets up date format
  data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
# Converts date to day format
  dt <- paste(as.Date(data$Date), data$Time)
  data$dt <- as.POSIXct(dt)
  #sets up file
  png(filename="Plot4.png", width=480, height=480)
  #sets up plot area
  par(mfrow=c(2,2),mar=c(4,4,2,1), oma =c(0,0,2,0))
  #plots & Legends
  with(data, {
    plot(Global_active_power ~ dt, type = "l", 
         ylab = "Global Active Power", xlab = "")
    plot(Voltage ~ dt, type = "l", ylab = "Voltage", xlab = "Date/Time")
    plot(Sub_metering_1 ~ dt, type = "l", ylab = "Energy sub metering",
         xlab = "")
    lines(Sub_metering_2 ~ dt, col = 'Red')
    lines(Sub_metering_3 ~ dt, col = 'Blue')
    legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
           bty = "n",
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power ~ dt, type = "l", 
         ylab = "Global_rective_power", xlab = "Date/Time")
  })
  #Turns off file write  
  dev.off()
  