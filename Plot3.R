## Plot 3

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

## Plot3 with PNG
png(file = "plot3.png", bg = "transparent")
with(HP2, plot(DT, Sub_metering_1, xlab = "", ylab = "Energy sub metering",
               type = "n"))
with(HP2, points(DT, Sub_metering_1, col = "black", type = "l"))
with(HP2, points(DT, Sub_metering_2, col = "red", type = "l"))
with(HP2, points(DT, Sub_metering_3, col = "blue", type = "l"))
legend("topright", lty = "solid", col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()