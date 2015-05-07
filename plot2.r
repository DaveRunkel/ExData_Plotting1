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
# Sets up plot area
png(filename="Plot2.png", width=480, height=480)
#plot
plot(data$Global_active_power ~ data$dt, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
#turns off file writing
dev.off()