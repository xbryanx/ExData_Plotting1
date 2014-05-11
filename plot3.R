# Read data
data <- read.table('household_power_consumption.txt', sep=";", header=T)
# Create a new POSIXct variable DateTime using Date and Time
data$DateTime <- as.POSIXct(paste(data$Date," ",data$Time), format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date,format='%d/%m/%Y')
# Subset data
data = subset(data,Date >= "2007-02-01" & Date <= "2007-02-02")
# Convert into specific data types
data$Sub_metering_1 = as.numeric(type.convert(as.character(data$Sub_metering_1), dec = "."))
data$Sub_metering_2 = as.numeric(type.convert(as.character(data$Sub_metering_2), dec = "."))
data$Sub_metering_3 = as.numeric(type.convert(as.character(data$Sub_metering_3), dec = "."))

# Create as PNG image file dimensions by default are 480x480
png("plot3.png")
plot(range(data$DateTime),range(cbind(data$Sub_metering_1,data$Sub_metering_2,data$Sub_metering_3)), ylab="Energy sub metering", xlab="", type="n")
lines(data$DateTime, data$Sub_metering_1)
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", colnames(data[c(7,8,9)]), col=c('black','red','blue'), lty=1)
dev.off()