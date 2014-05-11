# Read data
data <- read.table('household_power_consumption.txt', sep=";", header=T)
# Create a new POSIXct variable DateTime using Date and Time
data$DateTime <- as.POSIXct(paste(data$Date," ",data$Time), format="%d/%m/%Y %H:%M:%S")
# Convert Date into Date type
data$Date <- as.Date(data$Date,format='%d/%m/%Y')
# Subset data
data = subset(data,Date >= "2007-02-01" & Date <= "2007-02-02")
# Convert into numeric
data$Global_active_power = as.numeric(type.convert(as.character(data$Global_active_power), dec = "."))

# Create as PNG image file dimensions by default are 480x480
png("plot2.png")
plot(data$DateTime,data$Global_active_power, type="l", ylab="Global active power (kilowatts)", xlab="")
dev.off()