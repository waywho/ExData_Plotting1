## Plot 2

## Read files
HP <- read.csv("household_power_consumption.txt", sep=";", na.strings="?",
               col.names = c("Date", "Time", "Global_active_power",
                             "Global_reactive_power",
                             "Voltage", "Global_intensity",
                             "Sub_metering_1", "Sub_metering_2",
                             "Sub_metering_3"), skip = 66637, nrows = 2879)

## Set date format with new column
DT <- as.POSIXlt(paste(HP$Date, HP$Time), format = "%d/%m/%Y %T")
HP2 <- cbind(HP, DT)

## Plot2 with PNG
png(file = "plot2.png", bg = "transparent")
with(HP2, plot(DT, Global_active_power, ylab = "Global Active Power (kilowatts)", 
               xlab = "", type = "l"))
dev.off()