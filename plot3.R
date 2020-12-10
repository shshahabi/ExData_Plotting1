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
attach(data)
plot(Sub_metering_1 ~ datetime, type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(Sub_metering_2 ~ datetime, col = "Red")
lines(Sub_metering_3 ~ datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#save_file
dev.copy(png,file ="plot3.png", height = 480, width = 480)
dev.off()
detach(data)
list.files()
