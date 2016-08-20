##########
# Plot 4 #
##########

# library

library(lubridate)
library(dplyr)

# Read datafile

hpc <- read.table("C:/Users/Italo/Documents/RWork/Coursera/Exp_data_1/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset and formatting

hpc_sub <- filter(hpc, Date == "1/2/2007" | Date =="2/2/2007")
hpc_sub$Global_active_power <- as.numeric(hpc_sub$Global_active_power) 
hpc_sub <- mutate(hpc_sub, datetime = paste(Date,Time,sep = " "))
hpc_sub$datetime <- dmy_hms(hpc_sub$datetime) 
hpc_sub$Sub_metering_1 <- as.numeric(hpc_sub$Sub_metering_1)
hpc_sub$Sub_metering_2 <- as.numeric(hpc_sub$Sub_metering_2)
#Sub_metering_3 already numeric
hpc_sub$Global_reactive_power <- as.numeric(hpc_sub$Global_reactive_power)
hpc_sub$Voltage <- as.numeric(hpc_sub$Voltage)

# Plot and save png file

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
with(hpc_sub, {
        plot(datetime,Global_active_power, type="l", xlab = "", ylab = "Global Active Power")
        plot(datetime,Voltage, type="l", xlab = "datetime", ylab = "Voltage")
        plot(datetime, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
        lines(datetime, Sub_metering_2, type="l", col="red")
        lines(datetime, Sub_metering_3, type="l", col="blue")
        legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd = 1, col=c("black", "red", "blue"))
        plot(datetime,Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power")
})
dev.off()
