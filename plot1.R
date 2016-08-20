##########
# Plot 1 #
##########

# library

library(lubridate)

# Read datafile

hpc <- read.table("C:/Users/Italo/Documents/RWork/Coursera/Exp_data_1/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset and formatting

hpc_sub <- filter(hpc, Date == "1/2/2007" | Date =="2/2/2007")
hpc_sub$Global_active_power <- as.numeric(hpc_sub$Global_active_power) 

# Plot and save png file

png("plot1.png",width = 480 ,height = 480)
with(hpc_sub, hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)"))
dev.off()
