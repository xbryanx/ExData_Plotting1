# Read data
data <- read.table('household_power_consumption.txt', sep=";", header=T)
# Subset data for only Feb 1, 2007 and Feb 2, 2007
data = subset(data,Date == "1/2/2007" | Date == "2/2/2007")
# Convert Global_active_power into numeric
data$Global_active_power = as.numeric(type.convert(as.character(data$Global_active_power), dec = "."))

# Create as PNG image file dimensions by default are 480x480
png("plot1.png")
hist(data$Global_active_power, main="Global active power", xlab="Global active power (kilowatts)",
     ylab="Frequency", col="red")
dev.off()