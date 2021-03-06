#reading the data set
data <- read.table("household_power_consumption.txt",header = T,sep =';',na.strings = "?")
head(data)
#first accomplish type we want
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
#subset data for being between @starting date & @finish date

data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))


##plot_1

with(data,hist(Global_active_power,main = "global active power"
               , xlab="Global active power (KW)",col = "Red"))
#save_file
dev.copy(png,file ="plot1.png", height = 480, width = 480)
dev.off()

