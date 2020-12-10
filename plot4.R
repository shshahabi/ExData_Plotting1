#reading the data set
data <- read.table("household_power_consumption.txt",header = T,sep =';',na.strings = "?")
head(data)
#first accomplish type we want
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
#subset data for being between @starting date & @finish date

data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))


##plot_1

data$datetime <- as.POSIXct(data$datetime)

par(mfrow= c(2,2))


with(data,plot(Global_active_power ~ datetime, type = "l",
               ylab = "Global Active Power ", xlab = ""))
with(data,plot(Voltage ~ datetime, type = "l",
               ylab = "Voltage", xlab = "datatime"))

plot(data$Sub_metering_1 ~ data$datetime, type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(data$Sub_metering_2 ~ data$datetime, col = "Red")
lines(data$Sub_metering_3 ~ data$datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(data,plot(Global_reactive_power ~ datetime, type = "l",
               ylab = "Global reactive Power", xlab = "datatime"))
#save_file
dev.copy(png,file ="plot4.png", height = 480, width = 480)
dev.off()
