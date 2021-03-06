inp1 <- read.table("C:/Vadivel/Work/Analytics/coursera - Exploratory data analytics/Assignment/household_power_consumption.txt",header=TRUE,sep=";")
inp <- inp1 #taking backup of the read data
inp$Date <- as.Date(inp$Date,"%d/%m/%Y")

inp$Global_active_power <- as.numeric(inp$Global_active_power)
inp$Global_active_power <- inp$Global_active_power/1000 #converting watts to kilowatts
#filtering for 2 days in feb 2007
febdata <- subset(inp, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
febdata$DateTime <- as.POSIXct(paste(febdata$Date,as.character(febdata$Time)))

plot(febdata$DateTime,febdata$Sub_metering_1,type="l",ylab="Energy Sub metering",col="black")
lines(febdata$DateTime,febdata$Sub_metering_2,type="l",ylab="Global Active Power (Kilowatts)",col="red")
lines(febdata$DateTime,febdata$Sub_metering_3,type="l",ylab="Global Active Power (Kilowatts)",col="blue")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("sub_metering_1","sub_metering_2","sub_metering_3"))
dev.copy(png, file = "plot3.png")
dev.off()
