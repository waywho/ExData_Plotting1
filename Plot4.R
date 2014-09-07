## Plot 4

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

## Plot4 with PNG
png(file = "plot4.png", bg = "transparent")

par(mfrow = c(2,2), bg = "transparent")
hist(HP2$Global_active_power, col = "red", main = "Global Active Power")
with(HP2, plot(DT, Voltage, xlab = "datetime", ylab = "Voltage", type = "l"))

with(HP2, plot(DT, Sub_metering_1, xlab = "", ylab = "Energy sub metering",
               type = "n"))
with(HP2, points(DT, Sub_metering_1, col = "black", type = "l"))
with(HP2, points(DT, Sub_metering_2, col = "red", type = "l"))
with(HP2, points(DT, Sub_metering_3, col = "blue", type = "l"))
legend("topright", lty = "solid", col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       cex = 0.6, box.lwd = 0)

with(HP)

with(HP2, plot(DT, Global_reactive_power, 
               xlab = "datetime", type = "l"))
dev.off()
