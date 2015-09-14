inp1 <- read.table("C:/Vadivel/Work/Analytics/coursera - Exploratory data analytics/Assignment/household_power_consumption.txt",header=TRUE,sep=";")
inp <- inp1 #taking backup of the read data
inp$Date <- as.Date(inp$Date,"%d/%m/%Y")

inp$Global_active_power <- as.numeric(inp$Global_active_power)
inp$Global_active_power <- inp$Global_active_power/1000 #converting watts to kilowatts
#filtering for 2 days in feb 2007
febdata <- subset(inp, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))


hist(febdata$Global_active_power,breaks=6,main="Global Active Power",xlab="Global Active Power (Kilowatts)",col="red")
title(main="Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()
