##########
# Plot 3 #
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

# Plot and save png file

png("plot3.png", width=480, height=480)
with(hpc_sub,plot(datetime, Sub_metering_1, type="l", ylab="Energy Submetering", xlab=""))
with(hpc_sub,lines(datetime, Sub_metering_2, type="l", col="red"))
with(hpc_sub,lines(datetime, Sub_metering_3, type="l", col="blue"))
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd = 1, col=c("black", "red", "blue"))
dev.off()
