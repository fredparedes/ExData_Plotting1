
# Read household power consumtion text file into data set
householdpowerconsumption <- read.table("/Users/fredparedes/Documents/Data Science Course/Class/ExploratoryDataAnalysis/household_power_consumption.txt", sep = ";", header = TRUE)

# Convert date column to date type
householdpowerconsumption$Date <- as.Date(householdpowerconsumption$Date, "%d/%m/%Y")

# Subset of only rows between 2007-02-01 and 2007-02-02
subsetHPC <- householdpowerconsumption[householdpowerconsumption$Date <= "2007-02-02" & householdpowerconsumption$Date >= "2007-02-01", ]

# create a date/time column
subsetHPC$DateTime <- strptime(paste(subsetHPC$Date, subsetHPC$Time), format = "%Y-%m-%d %H:%M:%S")

# Convert Global Active Power column to numeric
subsetHPC$Global_active_power <- as.numeric(subsetHPC$Global_active_power)

# Set device output to png 
png('Plot1.png', width = 480, height = 480, units = "px")

# Create histogram
hist(subsetHPC$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Turn off device
dev.off()
