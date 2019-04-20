# Read household power consumtion text file into data set
householdpowerconsumption <- read.table("/Users/fredparedes/Documents/Data Science Course/Class/ExploratoryDataAnalysis/household_power_consumption.txt", sep = ";", header = TRUE)

# Convert date column to date type
householdpowerconsumption$Date <- as.Date(householdpowerconsumption$Date, "%d/%m/%Y")

# Subset of only rows between 2007-02-01 and 2007-02-02
subsetHPC <- householdpowerconsumption[householdpowerconsumption$Date <= "2007-02-02" & householdpowerconsumption$Date >= "2007-02-01", ]

# Convert Global Active Power column to numeric
subsetHPC$Global_active_power <- as.numeric(subsetHPC$Global_active_power)

# Convert Global Active Power column to numeric
subsetHPC$Global_reactive_power <- as.numeric(subsetHPC$Global_reactive_power)

# Convert Global Active Power column to numeric
subsetHPC$Voltage <- as.numeric(subsetHPC$Voltage)

# Convert Sub Metering columns to numeric
subsetHPC$Sub_metering_1 <- as.numeric(subsetHPC$Sub_metering_1)
subsetHPC$Sub_metering_2 <- as.numeric(subsetHPC$Sub_metering_2)
subsetHPC$Sub_metering_3 <- as.numeric(subsetHPC$Sub_metering_3)

# create a date/time column
subsetHPC$DateTime <- strptime(paste(subsetHPC$Date, subsetHPC$Time), format = "%Y-%m-%d %H:%M:%S")

# Set device output to png 
png('Plot4.png', width = 480, height = 480, units = "px")

# set for 2 row and 2 columns and set up the margins
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

# Create Global Active Power to Day line plot
with(subsetHPC, plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatt)"))

# Create Voltage to DateTime plot
with(subsetHPC, plot(DateTime, Voltage, type = "l"))

# Create Energy Sub Metering to Day plot
with(subsetHPC, plot(DateTime, Sub_metering_1, type = "n", ylab = "Energy Sub Metering"))
points(subsetHPC$DateTime, subsetHPC$Sub_metering_1, type = "l")
points(subsetHPC$DateTime, subsetHPC$Sub_metering_2, type = "l", col = "red")
points(subsetHPC$DateTime, subsetHPC$Sub_metering_3, type = "l", col = "blue")
#adding legend
legend(x = "topright", pch = c(15, 15, 15), col = c("black","blue","red"), legend = c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"), cex = 0.75 )

# Create Global Active Power to Date Time Plot
with(subsetHPC, plot(DateTime, Global_reactive_power, type = "l", xlab = "DateTime", ylab = "Global Active Power (kilowatt)"))

# Turn off device
dev.off()
