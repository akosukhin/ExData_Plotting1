download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
              destfile = "IHEPC_DS.zip")
src <- unz("IHEPC_DS.zip", "household_power_consumption.txt")
ds_all <- read.table(src, header = TRUE, sep = ";", na.strings = "?")
ds_all$Time <- strptime(paste(ds_all$Date, ds_all$Time), "%d/%m/%Y %T")
ds_all$Date <- as.Date(ds_all$Date, "%d/%m/%Y")
st <- as.Date("2007-02-01")
en <- as.Date("2007-02-02")
ds <- subset(ds_all, Date >= st & Date <= en)
rm(ds_all)
png(filename = "plot3.png",
    width = 480, height = 480)

with(ds, plot(Time, Sub_metering_1, type = "l", 
              xlab = "", ylab = "Energy sub metering"))

lines(ds$Time, ds$Sub_metering_2, col = "red")
lines(ds$Time, ds$Sub_metering_3, col = "blue")
legend("topright", pch = "_", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()