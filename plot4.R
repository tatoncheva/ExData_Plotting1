# The script assumes that the source data file is downloaded and unziped 
# in the working directory.
# One can download it from:
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

# The reading of the data uses METHOD 3 - Manual Skip'n'Row Method as suggested 
# from the Community in the discussion forum.
# I chose the method as it is easy to implement, it is fast, and has low memory usage

data <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, 
                   nrow = 2880, na.strings="?", 
                   col.names = colnames(read.table("household_power_consumption.txt", 
                                                   header = TRUE, sep = ";", nrow = 1 )))

Sys.setlocale("LC_TIME", "English")
datetime <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")


png("plot4.png", bg = "transparent")
par(mfrow = c(2,2))
with(data, {
    plot(datetime, Global_active_power, type = "l", xlab = "", 
         ylab = "Global Active Power")    
    plot(datetime, Voltage, type = "l", ylab = "Voltage")    
    {
    with(data, plot(datetime, Sub_metering_1, type = "l", xlab = "",
                    ylab = "Energy sub metering"))
    with(data, points(datetime, Sub_metering_1, type = "l", col = "black"))
    with(data, points(datetime, Sub_metering_2, type = "l",col = "red"))
    with(data, points(datetime, Sub_metering_3, type = "l",col = "blue"))
    legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"), 
           bty = "n", pt.cex = 1, cex = 0.95, 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    }
    plot(datetime, Global_reactive_power, type = "l", ylim = c(0, 0.5))
    })
dev.off()