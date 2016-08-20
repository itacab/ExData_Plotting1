##########
# Plot 2 #
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

# Plot and save png file

png("plot2.png",width = 480 ,height = 480)
with(hpc_sub, plot(datetime,Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()
