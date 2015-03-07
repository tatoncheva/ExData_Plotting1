# The script assumes that the source data file is downloaded and unziped in the 
# working directory.
# One can download it from:
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

# The reading of the data uses METHOD 3 - Manual Skip'n'Row Method as suggested 
# from the Community in the discussion forum.
# I chose the method as it is easy to implement, it is fast, and has low memory usage


data <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, 
                   nrow = 2880, na.strings="?", 
                   col.names = colnames(read.table("household_power_consumption.txt", 
                                                   header = TRUE, sep = ";", nrow = 1 )))
png(filename = "plot1.png", bg = "transparent")
hist(data$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()