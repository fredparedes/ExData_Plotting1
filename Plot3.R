# Read household power consumtion text file into data set
householdpowerconsumption <- read.table("/Users/fredparedes/Documents/Data Science Course/Class/ExploratoryDataAnalysis/household_power_consumption.txt", sep = ";", header = TRUE)

# Convert date column to date type
householdpowerconsumption$Date <- as.Date(householdpowerconsumption$Date, "%d/%m/%Y")

# Subset of only rows between 2007-02-01 and 2007-02-02
subsetHPC <- householdpowerconsumption[householdpowerconsumption$Date <= "2007-02-02" & householdpowerconsumption$Date >= "2007-02-01", ]

# create a date/time column
subsetHPC$DateTime <- strptime(paste(subsetHPC$Date, subsetHPC$Time), format = "%Y-%m-%d %H:%M:%S")

# Convert Sub Metering columns to numeric
subsetHPC$Sub_metering_1 <- as.numeric(subsetHPC$Sub_metering_1)
subsetHPC$Sub_metering_2 <- as.numeric(subsetHPC$Sub_metering_2)
subsetHPC$Sub_metering_3 <- as.numeric(subsetHPC$Sub_metering_3)

# Set device output to png 
png('Plot3.png', width = 480, height = 480, units = "px")

with(subsetHPC, plot(DateTime, Sub_metering_1, type = "n", xlab = "Date", ylab = "Energy Sub Metering"))
points(subsetHPC$DateTime, subsetHPC$Sub_metering_1, type = "l")
points(subsetHPC$DateTime, subsetHPC$Sub_metering_2, type = "l", col = "red")
points(subsetHPC$DateTime, subsetHPC$Sub_metering_3, type = "l", col = "blue")

#adding legend
legend(x = "topright", pch = c(15, 15, 15), col = c("black","blue","red"), legend = c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3") )

# Turn off device
dev.off()