data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",nrows=2100000,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

data$Date <- as.Date(data$Date,format="%d/%m/%Y")

data <- data[data$Date=="2007-02-01"|data$Date=="2007-02-02",]
data$Time <- as.POSIXct(paste(data$Date,data$Time,sep=" "))

#Graph plot 4
png(filename="plot4.png",width=480,height=480,units="px")

par(mfrow=c(2,2))

plot(data$Time,data$Global_active_power,ylab="Global Active Power (kilowatts)",xlab=NA,type="n")
with(data,lines(Time,Global_active_power))

plot(data$Time,data$Voltage,ylab="Voltage",xlab="datetime",type="n")
with(data,lines(Time,Voltage))

plot(data$Time,data$Sub_metering_1,ylab="Energy sub metering",xlab=NA,type="n")
with(data,lines(Time,Sub_metering_1,col="black"))
with(data,lines(Time,Sub_metering_2,col="red"))
with(data,lines(Time,Sub_metering_3,col="blue"))
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

with(data,plot(Time,Global_reactive_power,xlab="datetime",type="n"))
with(data,lines(Time,Global_reactive_power))

dev.off()

