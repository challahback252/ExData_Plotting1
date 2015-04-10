data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",nrows=2100000,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

data$Date <- as.Date(data$Date,format="%d/%m/%Y")

data <- data[data$Date=="2007-02-01"|data$Date=="2007-02-02",]
data$Time <- as.POSIXct(paste(data$Date,data$Time,sep=" "))

#Graph plot 2
png(filename="plot2.png",width=480,height=480,units="px")
plot(data$Time,data$Global_active_power,ylab="Global Active Power (kilowatts)",xlab=NA,type="n")
with(data,lines(Time,Global_active_power))
dev.off()

