data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",nrows=2100000,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

data$Date <- as.Date(data$Date,format="%d/%m/%Y")

data <- data[data$Date=="2007-02-01"|data$Date=="2007-02-02",]
data$Time <- as.POSIXct(paste(data$Date,data$Time,sep=" "))

#Graph plot 3
png(filename="plot3.png",width=480,height=480,units="px")
plot(data$Time,data$Sub_metering_1,ylab="Energy sub metering",xlab=NA,type="n")
with(data,lines(Time,Sub_metering_1,col="black"))
with(data,lines(Time,Sub_metering_2,col="red"))
with(data,lines(Time,Sub_metering_3,col="blue"))
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

